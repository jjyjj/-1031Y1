using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace MarketInfo
{
    public partial class api : System.Web.UI.Page
    {
        public static string strPath = System.Configuration.ConfigurationManager.ConnectionStrings["MAPPATH"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            _GetTime();
            _GetAllData();
            _GetTXInfo();
            _GetBigMapX();
        }
        public void _GetTXInfo()
        {
            if (Request.QueryString["CMD"] == null) return;
            String strCMD = Request.QueryString["CMD"];
            if (strCMD != "GETTXINFO") return;
            String strSQL = "Select * from T_SHIGONG_INFO";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;
            String HTML = WXDBUtility.DESHelper.Encrypt_DES(tb.Rows[0]["HTML"].ToString());
            String LK = WXDBUtility.DESHelper.Encrypt_DES(tb.Rows[0]["LK"].ToString());
            String LK_TIME = WXDBUtility.DESHelper.Encrypt_DES(tb.Rows[0]["LK_TIME"].ToString());
            strSQL = "select *  from T_DITU";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;
            String strMapSee = tb.Rows[0]["type"].ToString();
            Response.Write(HTML + "#" + LK + "#" + LK_TIME + "#" + strMapSee);
        }
        public void _GetTime()
        {
            if (Request.QueryString["CMD"] == null) return;
            String strCMD = Request.QueryString["CMD"];
            if (strCMD != "GETTIME") return;
            String strSQL = "Select m_time from p_uptime";
            DataTable tb = WXDBUtility.PostgreSQLHelper.GetDataTable(strSQL);
            if (tb == null) return;
            String strMapTime = tb.Rows[0][0].ToString();
            strSQL = "Select LK_TIME from T_SHIGONG_INFO";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;
            String strInfoTime = tb.Rows[0][0].ToString();
            Response.Write(strMapTime + "#" + strInfoTime);
        }
        public void _GetAllData()
        {
            if (Request.QueryString["CMD"] == null) return;
            String strCMD = Request.QueryString["CMD"];
            if (strCMD != "GETDATA") return;
            //获取小图
            string strBigPng = strPath + "800000/800000.png";
            String pngDa = WXDBUtility.DESHelper.Encrypt_DES(_Img2Text(strBigPng));
            string strSmallPng = strPath + "1600000/1600000.png";
            String pngXiao = WXDBUtility.DESHelper.Encrypt_DES(_Img2Text(strSmallPng));
            Response.Write(pngXiao + "#" + pngDa);
        }
        public String _Img2Text(String strFile)
        {
            String strRes = "";
            System.Drawing.Bitmap bmp1 = new System.Drawing.Bitmap(strFile);
            using (MemoryStream ms1 = new MemoryStream())
            {
                bmp1.Save(ms1, System.Drawing.Imaging.ImageFormat.Png);
                byte[] arr1 = new byte[ms1.Length];
                ms1.Position = 0;
                ms1.Read(arr1, 0, (int)ms1.Length);
                ms1.Close();
                strRes = Convert.ToBase64String(arr1);
            }
            return strRes;
        }

        //获取大图的流量
        public void _GetBigMapX()
        {
            if (Request.QueryString["CMD"] == null) return;
            String strCMD = Request.QueryString["CMD"];
            if (strCMD != "GETMAPX") return;
            string strBigPng = strPath + "800000/800000.png";
            String pngDa = _Img2Text(strBigPng);
            Response.Write("data:image/png;base64,"+pngDa);
        }
    }
}