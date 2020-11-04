using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz._1xunhuaguanli
{
    public partial class xh_addphoto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSV_Click(object sender, EventArgs e)
        {
            //Session["CUR_DOCID"],Session["CUR_DID"]            
            HttpFileCollection files = Request.Files;
            if (files.Count > 0 && m_files.HasFile)
            {
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    _SaveFile(file);
                }
            }
           // Response.Redirect("wd_filelist.aspx?MID=" + Session["CUR_MID"].ToString());
        }


        public void _SaveFile(HttpPostedFile file)
        {
            String strPath = System.AppDomain.CurrentDomain.BaseDirectory.ToString() + "wd_dzrz\\photo\\";
            String strDir = strPath + Request.QueryString["TID"] + "\\";
            if (!System.IO.Directory.Exists(strDir))
            {
                System.IO.Directory.CreateDirectory(strPath + Request.QueryString["TID"] + "\\");
                System.IO.Directory.CreateDirectory(strDir);
            }
            //要改名
            String strName = Request.QueryString["TID"]+"-"+file.FileName;
            file.SaveAs(strDir + strName);
            String strCurPath = Request.QueryString["TID"].ToString() + "\\" + strName;
            String strSQL = "update  t_xunxiangong_info set xx_photo='"+strCurPath+"' where xx_id='"+Request.QueryString["TID"]+"'";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
        }


        public static long ConvertToTimestamp(DateTime time)
        {

            DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));

            return (long)(time - startTime).TotalSeconds * 1000;

        }
    }
}