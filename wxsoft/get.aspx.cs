using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Text;
using System.Data;

namespace wxsoft
{
    public partial class get : System.Web.UI.Page
    {
        public static string m_ServerIP = System.Configuration.ConfigurationManager.ConnectionStrings["SERVER_IP"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _GetBianHuaInfo();
                _UpdateTodayCurIP();
            }
        }

        public void _UpdateTodayCurIP()
        {
            //在这里对数据t_today_ip数据进行处理
            DateTime m_nowy = DateTime.Now;
            if (m_nowy.Hour == 0)
            {
                if (m_nowy.Minute >= 0 && m_nowy.Minute <= 2)
                {
                    String strSQL = "delete from T_TODAY_IP where DateDiff(dd,V_TIME,getdate())>0";
                    int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
                }
                
            }
        }

        //获取变化的信息
        public void _GetBianHuaInfo()
        {
            String strURL = m_ServerIP + "?CMD=GETTIME";
            string retString = "";
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strURL);
                request.Method = "GET";
                request.ContentType = "text/plain";
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                string encoding = response.ContentEncoding;
                if (encoding == null || encoding.Length < 1)
                {
                    encoding = "UTF-8"; //默认编码
                }
                StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding(encoding));
                retString = reader.ReadToEnd();
            }
            catch (System.Exception ex)
            {
                return;
            }
            if (retString == "") return;
            //2019-12-21 08:34:19#2018-08-09 09:26:18
            //检查是否有数据变化
            String[] arrTime = retString.Split('#');

            String strSQL = "Select * from T_WXMSG_CUR_INFO";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;
            String curInfoTime = tb.Rows[0]["LINFO_TIME"].ToString();
            String curMapTime = tb.Rows[0]["LMAP_TIME"].ToString();
            //修改通行信息
            bool m_yes = false;
            if (curInfoTime != arrTime[1])
            {
                _UpInfoData(arrTime[1]);
                m_yes = true;
            }
            //修改更新地图信息
            if (curMapTime != arrTime[0])
            {
                _UpMapData(arrTime[0]);
                m_yes = true;
            }

            //在这里生成一个静态页面吧，这样速度会非常的快
            if (m_yes)
            {
                _CrtHtml();
            }
        }

        //获取通行信息
        public void _UpInfoData(String strTime)
        {
            String strURL = m_ServerIP + "?CMD=GETTXINFO";
            string retString = "";
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strURL);
                request.Method = "GET";
                request.ContentType = "text/plain";
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                string encoding = response.ContentEncoding;
                if (encoding == null || encoding.Length < 1)
                {
                    encoding = "UTF-8"; //默认编码
                }
                StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding(encoding));
                retString = reader.ReadToEnd();
            }
            catch (System.Exception ex)
            {
                return;
            }
            if (retString == "") return;
            _UpdateLKInfo(retString);            
        }

        public void _UpdateLKInfo(String info)
        {
            String[] arrInfo = info.Split('#');
            String strTime = WXDBUtility.DESHelper.Decrypt_DES(arrInfo[2]);
            String strSQL = "Update T_WXMSG_CUR_INFO set LINFO_ELSEDATA='" 
                + arrInfo[0] + "',LINFO_LKDATA='" + arrInfo[1]
                + "',LINFO_TIME='" + strTime + "',MAP_SEE='" + arrInfo[3] + "'";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            Response.Write("Info:" + res.ToString() + "<BR>");
        }

        //////////////////////////////////////////////////////////////////////////
        public void _UpMapData(String strTime)
        {
            String strURL = m_ServerIP + "?CMD=GETDATA";
            string retString = "";
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strURL);
                request.Method = "GET";
                request.ContentType = "text/plain";
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                string encoding = response.ContentEncoding;
                if (encoding == null || encoding.Length < 1)
                {
                    encoding = "UTF-8"; //默认编码
                }
                StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding(encoding));
                retString = reader.ReadToEnd();
            }
            catch (System.Exception ex)
            {
                return;
            }
            if (retString == "") return;
            _UpdateMapInfo(retString, strTime);

        }

        public void _UpdateMapInfo(String info,String strTime)
        {
            String[] arrMap = info.Split('#');
            String strSQL = "Update T_WXMSG_CUR_INFO set LSMAP='" + arrMap[0]
                + "',LBMAP='" + arrMap[1] + "',LMAP_TIME='" + strTime + "'";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            Response.Write("Map:"+res.ToString());
        }
        
        //检查地图是否更新了
        public void _GetMapTimeUp()
        {
            String strURL = m_ServerIP + "?CMD=GETMAPTIME";
            string retString = "";
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(strURL);
                request.Method = "GET";
                request.ContentType = "text/plain";
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                string encoding = response.ContentEncoding;
                if (encoding == null || encoding.Length < 1)
                {
                    encoding = "UTF-8"; //默认编码
                }
                StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding(encoding));
                retString = reader.ReadToEnd();
            }
            catch (System.Exception ex)
            {
                return;
            }
            if (retString == "") return;
            String strDbTime = _GetLastTime();
            String strMapTime = retString;
            if (strMapTime == strDbTime) return;
            //开始获取详细信息
            
        }

        public String _GetLastTime()
        {
            String strSQL = "Select * from T_WXMSG_CUR_INFO";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb!=null)
            {
                return tb.Rows[0]["LTIME"].ToString();
            }
            else
            {
                return "";
            }
        }

        public void _CrtHtml()
        {
            String strPath = HttpContext.Current.Server.MapPath(@"\");
            String strTime = _GetTime();

            String strTimeFile = strTime + ".htm";
            String strpageFile = strPath + "page/map" + strTimeFile;
            //获取模板数据
            String strMod = _GetModeTxt(strPath + "page/map.htm");
            //1.获取第一个模板的数据

            String strXMod = _GetModeTxt(strPath + "page/xmap.htm");
            //2.获取第二个模板的数据

            //修改数据
            String strRes = strMod;
            string strSQL = "Select LSMAP,LBMAP,LMAP_TIME,MAP_SEE,LINFO_LKDATA,LINFO_ELSEDATA,LINFO_TIME from T_WXMSG_CUR_INFO";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;

            //1.发布时间
            String strLKTime = tb.Rows[0]["LINFO_TIME"].ToString();
            strRes = strRes.Replace("<!--FBSJ-->", strLKTime);

            //2.当前路况
            String strLK = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["LINFO_LKDATA"].ToString());
            strRes = strRes.Replace("<!--LK-->", strLK);

            //其他路况
            String strElseLK = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["LINFO_ELSEDATA"].ToString());
            strRes = strRes.Replace("<!--QTLK-->", strElseLK);
            //Label_MapTime.Text = tb.Rows[0]["LMAP_TIME"].ToString();
            String strShowMap = tb.Rows[0]["MAP_SEE"].ToString();
            if (strShowMap == "1")
            {
                String strXiaoMap = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["LSMAP"].ToString());
                String strXpngFile = strPath + "page/map" + strTime + ".png";
                _SavePng(strXiaoMap, strXpngFile);

                String strIMG = "<img src=\"map" + strTime + ".png\" width=\"100%\" />";
                strRes = strRes.Replace("<!--GZMAP-->", strIMG);
            }
            strRes = strRes.Replace("mapX.aspx", "x_map" + strTimeFile);

            String strBMap = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["LBMAP"].ToString());
            String strXSpngFile = strPath + "page/x_map" + strTime + ".png";
            _SavePng(strBMap, strXSpngFile);

            String strBigIMG = "<img src=\"x_map" + strTime + ".png\" width=\"100%\" />";
            strXMod = strXMod.Replace("<!--GZMAP-->", strBigIMG);
            strXMod = strXMod.Replace("<!--FBSJ-->", strLKTime);
            /////////////////////////////////////
            _OutPutHTML(strRes, strpageFile);
            //再创建大图
            String strBigpageFile = strPath + "page/x_map" + strTimeFile;
            _OutPutBigHTML(strXMod, strBigpageFile);
            _UpdateInitTxt(strPath, strTimeFile);

            //修改page.aspx中文件的名称
        }

        public void _SavePng(String base64, String imgPath)
        {
            String inputStr = base64;//把纯净的Base64资源扔给inpuStr,这一步有点多余
            try
            {
                byte[] arr = Convert.FromBase64String(inputStr);//将纯净资源Base64转换成等效的8位无符号整形数组
                System.IO.MemoryStream ms = new System.IO.MemoryStream(arr);//转换成无法调整大小的MemoryStream对象
                System.Drawing.Bitmap bmp = new System.Drawing.Bitmap(ms);//将MemoryStream对象转换成Bitmap对象
                ms.Close();//关闭当前流，并释放所有与之关联的资源
                bmp.Save(imgPath, System.Drawing.Imaging.ImageFormat.Png);//保存到服务器路径
            }
            catch (Exception ex) { }
        }

        public void _UpdateInitTxt(String path, string strTimeFile)
        {
            //1.先删除文件
            //删除小文件
            String strSQL = "Select * from T_URL";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;
            String strVal = tb.Rows[0][0].ToString();

            //map2020118144621
            String strObjFile = path + "page\\" + strVal;
            File.Delete(strObjFile);
            strObjFile = strObjFile.Replace(".htm", ".png");
            File.Delete(strObjFile);

            string strXX = path + "page\\x_" + strVal;
            File.Delete(strXX);
            strXX = strXX.Replace(".htm", ".png");
            File.Delete(strXX);
            strSQL = "Update T_URL set url='" + "map" + strTimeFile + "'";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
        }

        public void _OutPutHTML(String html, String htmlFile)
        {
            try
            {
                using (System.IO.StreamWriter file = new System.IO.StreamWriter(htmlFile, false, System.Text.UTF8Encoding.UTF8))
                {
                    file.WriteLine(html);
                }
            }
            catch (Exception e) { }
        }

        public void _OutPutBigHTML(String html, String htmlFile)
        {
            try
            {
                using (System.IO.StreamWriter file = new System.IO.StreamWriter(htmlFile, false, System.Text.UTF8Encoding.UTF8))
                {
                    file.WriteLine(html);
                }
            }
            catch (Exception e) { }
        }

        public String _SetHtml(String html)
        {
            String strRes = html;
            string strSQL = "Select LSMAP,LMAP_TIME,MAP_SEE,LINFO_LKDATA,LINFO_ELSEDATA,LINFO_TIME from T_WXMSG_CUR_INFO";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return strRes;

            //1.发布时间
            String strLKTime = tb.Rows[0]["LINFO_TIME"].ToString();
            strRes = strRes.Replace("<!--FBSJ-->", strLKTime);

            //2.当前路况
            String strLK = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["LINFO_LKDATA"].ToString());
            strRes = strRes.Replace("<!--LK-->", strLK);

            //其他路况
            String strElseLK = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["LINFO_ELSEDATA"].ToString());
            strRes = strRes.Replace("<!--QTLK-->", strElseLK);
            //Label_MapTime.Text = tb.Rows[0]["LMAP_TIME"].ToString();
            String strShowMap = tb.Rows[0]["MAP_SEE"].ToString();
            if (strShowMap == "1")
            {
                String strXiaoMap = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["LSMAP"].ToString());
                String strIMG = "<img src=\"data:image/png;base64," + strXiaoMap + "\" width=\"100%\" />";
                strRes = strRes.Replace("<!--GZMAP-->", strIMG);
            }
            return strRes;
        }

        public String _GetModeTxt(String strFile)
        {
            String strRes = "";
            try
            {
                System.IO.StreamReader file = new System.IO.StreamReader(strFile);
                strRes = file.ReadToEnd();
                file.Close();
            }
            catch (Exception e) { }

            return strRes;
        }

        public String _GetTime()
        {
            String strRes = "";
            DateTime mnow = DateTime.Now;
            strRes = mnow.Year.ToString() + mnow.Month.ToString() + mnow.Day.ToString() + mnow.Hour.ToString() + mnow.Minute.ToString() + mnow.Second;
            return strRes;
        }
     }
}