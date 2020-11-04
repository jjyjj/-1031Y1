using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Text.RegularExpressions;

namespace PB
{
    public class wc_pub
    {
        public struct STR_ZL_DATA
        {
            public string zl_code;
            public string zl_content;
        };

        public struct STR_SFZ
        {
            public string code;
            public string data;
            public string msg;
            public string success;
        };

        public struct STR_SFZ_DATA
        {
            public string roadcode;
            public string roadname;
            public string sfzdm;
            public string sfzmc;
            public string control_reason;
            public string control_state;
            public string starttime;
        };

        public struct STR_ROAD_DATA
        {
            public string roadcode;
            public string roadname;
            public string segment_code;
            public string segment_name;
            public string real_starttime;
            public string control_reason;
            public string control_state;
            public string control_measure;
            public string direction;
        };

        private static readonly String strDesKey = "huangabc";//加密所需8位密匙
        ///
        /// DES加密
        ///

        /// 要加密字符串
        /// 返回加密后字符串
        public static String Encrypt_DES(String str)
        {
            if (str == "") return "";
            System.Security.Cryptography.DESCryptoServiceProvider des = new System.Security.Cryptography.DESCryptoServiceProvider();
            Byte[] inputByteArray = System.Text.Encoding.Default.GetBytes(str);
            des.Key = System.Text.ASCIIEncoding.ASCII.GetBytes(strDesKey);
            des.IV = System.Text.ASCIIEncoding.ASCII.GetBytes(strDesKey);
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            System.Security.Cryptography.CryptoStream cs = new System.Security.Cryptography.CryptoStream(ms, des.CreateEncryptor(), System.Security.Cryptography.CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            foreach (Byte b in ms.ToArray())
                sb.AppendFormat("{0:X2}", b);
            return sb.ToString();
        }

        ///
        /// DES解密
        ///

        /// 要解密字符串
        /// 返回解密后字符串
        public static String Decrypt_DES(String str)
        {
            if (str == "") return "";
            System.Security.Cryptography.DESCryptoServiceProvider des = new System.Security.Cryptography.DESCryptoServiceProvider();
            Int32 x;
            Byte[] inputByteArray = new Byte[str.Length / 2];
            for (x = 0; x < str.Length / 2; x++)
                inputByteArray[x] = (Byte)(Convert.ToInt32(str.Substring(x * 2, 2), 16));
            des.Key = System.Text.ASCIIEncoding.ASCII.GetBytes(strDesKey);
            des.IV = System.Text.ASCIIEncoding.ASCII.GetBytes(strDesKey);
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            System.Security.Cryptography.CryptoStream cs = new System.Security.Cryptography.CryptoStream(ms, des.CreateDecryptor(), System.Security.Cryptography.CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            System.Text.StringBuilder ret = new System.Text.StringBuilder();
            return System.Text.Encoding.Default.GetString(ms.ToArray());
        }


        public static ArrayList _GetSFZ_Array(String strJson)
        {
            ArrayList sfz_arr = new ArrayList();
            if (strJson == "") return sfz_arr;
            JObject Jo = (JObject)JsonConvert.DeserializeObject(strJson);
            if (Jo == null) return sfz_arr;
            STR_SFZ s = new STR_SFZ();
            s.code = Jo["code"].ToString();
            s.data = Jo["data"].ToString();
            if (s.data != "")
            {
                JObject Jodata = (JObject)JsonConvert.DeserializeObject(s.data);
                if (Jodata != null)
                {
                    string parameter = Jodata["parameter"].ToString();
                    string rows = Jodata["rows"].ToString();
                    string total = Jodata["total"].ToString();
                    if (rows != "")
                    {
                        dynamic rowsdata = Newtonsoft.Json.JsonConvert.DeserializeObject(rows);
                        foreach (var obj in rowsdata)
                        {
                            STR_SFZ_DATA data = new STR_SFZ_DATA();
                            data.roadcode = obj["roadcode"].ToString().Replace("\"","");
                            data.roadname = obj["roadname"].ToString().Replace("\"", "");
                            data.sfzdm = obj["sfzdm"].ToString().Replace("\"", "");
                            data.sfzmc = obj["sfzmc"].ToString().Replace("\"", "");
                            data.control_reason = obj["control_reason"].ToString().Replace("\"", "");
                            data.control_state = obj["control_type"].ToString();
                            data.starttime = obj["starttime"].ToString();
                            sfz_arr.Add(data);
                        }
                    }
                }

            }
            s.msg = Jo["msg"].ToString();
            s.success = Jo["success"].ToString();
            return sfz_arr;
        }

        public static ArrayList _GetROAD_Array(String strJson)
        {
            ArrayList road_arr = new ArrayList();
            if (strJson == "") return road_arr;
            JObject Jo = (JObject)JsonConvert.DeserializeObject(strJson);
            if (Jo == null) return road_arr;
            STR_SFZ s = new STR_SFZ();
            s.code = Jo["code"].ToString();
            s.data = Jo["data"].ToString();
            if (s.data != "")
            {
                JObject Jodata = (JObject)JsonConvert.DeserializeObject(s.data);
                if (Jodata != null)
                {
                    string parameter = Jodata["parameter"].ToString();
                    string rows = Jodata["rows"].ToString();
                    string total = Jodata["total"].ToString();
                    if (rows != "")
                    {
                        dynamic rowsdata = Newtonsoft.Json.JsonConvert.DeserializeObject(rows);
                        foreach (var obj in rowsdata)
                        {
                            STR_ROAD_DATA data = new STR_ROAD_DATA();
                            data.roadcode = obj["roadcode"].ToString().Replace("\"", "");
                            data.roadname = obj["roadname"].ToString().Replace("\"", "");
                            data.segment_code = obj["segment_code"].ToString().Replace("\"", "");
                            data.segment_name = obj["segment_name"].ToString().Replace("\"", "");
                            data.real_starttime = obj["real_starttime"].ToString();
                            data.control_reason = obj["control_reason"].ToString().Replace("\"", "");
                            data.control_state = obj["control_type"].ToString();
                            data.control_measure = obj["control_measure"].ToString().Replace("\"", "");
                            data.direction = obj["direction"].ToString();
                            road_arr.Add(data);
                        }
                    }
                }
            }
            s.msg = Jo["msg"].ToString();
            s.success = Jo["success"].ToString();
            return road_arr;
        }

        public static DateTime ConvertLongToDateTime(long d)
        {
            DateTime dtStart = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
            long lTime = long.Parse(d + "0000");
            TimeSpan toNow = new TimeSpan(lTime);
            DateTime dtResult = dtStart.Add(toNow);
            return dtResult;
        }

        public static string _Str(String str,int iLen)
        {
            if (str.Length <= iLen)
            {
                return str;
            }
            else
            {
                return str.Substring(0, iLen) + "..";
            }
        }
        public static string RemoveHTMLTags(string htmlStream)
        {
            if (htmlStream == null || htmlStream.Trim() == "")
            {
                return "";
            }
            /*
             * 最好把所有的特殊HTML标记都找出来，然后把与其相对应的Unicode字符一起影射到Hash表内，最后一起都替换掉
             */
            //先单独测试,成功后,再把所有模式合并
            //注:这两个必须单独处理
            //去掉嵌套了HTML标记的JavaScript:(<script)[\\s\\S]*(</script>)
            //去掉css标记:(<style)[\\s\\S]*(</style>)
            //去掉css标记:\\..*\\{[\\s\\S]*\\}
            htmlStream = Regex.Replace(htmlStream, "(<script)[\\s\\S]*?(</script>)|(<style)[\\s\\S]*?(</style>)", " ", RegexOptions.IgnoreCase);
            //htmlStream = RemoveTag(htmlStream, "script");
            //htmlStream = RemoveTag(htmlStream, "style");
            //去掉普通HTML标记:<[^>]+>
            //替换空格:&nbsp;|&amp;|&shy;|&#160;|&#173;
            htmlStream = Regex.Replace(htmlStream, "<[^>]+>|&nbsp;|&amp;|&shy;|&#160;|&#173;|&bull;|&lt;|&gt;", " ", RegexOptions.IgnoreCase);
            //htmlStream = RemoveTag(htmlStream);
            //替换左尖括号
            //htmlStream = Regex.Replace(htmlStream, "&lt;", "<");
            //替换右尖括号
            //htmlStream = Regex.Replace(htmlStream, "&gt;", ">");
            //替换空行
            //htmlStream = Regex.Replace(htmlStream, "[\n|\r|\t]", " ");//[\n|\r][\t*| *]*[\n|\r]
            htmlStream = Regex.Replace(htmlStream, "(\r\n[\r|\n|\t| ]*\r\n)|(\n[\r|\n|\t| ]*\n)", "\r\n");
            htmlStream = Regex.Replace(htmlStream, "[\t| ]{1,}", " ");
            return htmlStream.Trim();
        }

        public static string _GetZL(String strCODE)
        {
            string strCMD = "";
            if (strCODE == "0")
            {
                strCMD = "全省正常通行";
            }
            else if (strCODE == "1")
            {
                strCMD = "禁止所有车辆上站";
            }
            else if (strCODE == "2")
            {
                strCMD = "禁止七座(含七座)以上车辆上站";
            }
            else if (strCODE == "5")
            {
                strCMD = "其他";
            }
            else if (strCODE == "8")
            {
                strCMD = "禁止货车上站";
            }
            else if (strCODE == "9")
            {
                strCMD = "禁止七座(不含七座)以上车辆上站";
            }
            return strCMD;
        }

        public static string _GetZL_RD(String strCODE)
        {
            string strCMD = "";
            if (strCODE == "0")
            {
                strCMD = "全省正常通行";
            }
            else if (strCODE == "1")
            {
                strCMD = "禁止所有车辆通行";
            }
            else if (strCODE == "2")
            {
                strCMD = "禁止七座(含七座)以上车辆通行";
            }
            else if (strCODE == "5")
            {
                strCMD = "其他";
            }
            else if (strCODE == "8")
            {
                strCMD = "禁止货车通行";
            }
            else if (strCODE == "9")
            {
                strCMD = "禁止七座(不含七座)以上车辆通行";
            }
            return strCMD;
        }

        public static String _GetFX(String strCode)
        {
            String res = "双向";
            if (strCode == "0")
            {
                res = "双向";
            }
            else if (strCode == "1")
            {
                res = "上行";
            }
            else
            {
                res = "下行";
            }
            return res;
        }
    }
}