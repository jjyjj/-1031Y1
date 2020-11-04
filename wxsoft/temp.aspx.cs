using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace wxsoft
{
    public partial class temp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            _CrtHtml();
        }

        public void _CrtHtml()
        {
            String strPath = HttpContext.Current.Server.MapPath(@"\");
            String strTime = _GetTime();
            
            String strTimeFile =strTime + ".htm";
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
        public void _UpdateInitTxt(String path,string strTimeFile)
        {
            //1.先删除文件
            //删除小文件
            String strOldFile=path+"page\\init.txt";
            String strVal = _GetModeTxt(strOldFile);
            //map2020118144621
            String strObjFile = path + "page\\" + strVal;
            File.Delete(strObjFile);
            strObjFile = strObjFile.Replace(".htm", ".png");
            File.Delete(strObjFile);

            string strXX = path + "page\\x_" + strVal;
            File.Delete(strXX);
            strXX = strXX.Replace(".htm", ".png");
            File.Delete(strXX);

            String strFile = path + "page.aspx";
            try
            {
                String strTxt = "<%@ Page Language=\"C#\" AutoEventWireup=\"true\" CodeBehind=\"page.aspx.cs\" Inherits=\"wxsoft.page\" %>";
                strTxt = strTxt + "\n<%Response.Redirect(\"page/map" + strTimeFile + "\");%>";
                using (System.IO.StreamWriter file = new System.IO.StreamWriter(strFile, false, System.Text.UTF8Encoding.UTF8))
                {
                    file.Write(strTxt);
                }
            }
            catch (Exception e) { }

            try
            {
                using (System.IO.StreamWriter file = new System.IO.StreamWriter(strOldFile, false, System.Text.UTF8Encoding.UTF8))
                {
                    file.Write("map"+strTimeFile);
                }
            }
            catch (Exception e) { }
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