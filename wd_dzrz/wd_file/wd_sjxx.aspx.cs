using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz.wd_file
{
    public partial class wd_sjxx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CUR_T_ID"] != null)
                {
                    this.HideTid.Value = Session["CUR_T_ID"].ToString();
                    this.hid_tid.Value = Request.QueryString["TID"];
                }
            }
        }

        #region
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_save_Click(object sender, EventArgs e)
        {
            HttpFileCollection files = Request.Files;
            if (files.Count > 0)
            {
                for (int i = 0; i < files.Count; i++)
                {
                    HttpPostedFile file = files[i];
                    filesa(file);
                }
            }
        }
        public static long ConvertToTimestamp(DateTime time)
        {

            DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
            return (long)(time - startTime).TotalSeconds * 1000;

        } 
        public void filesa(HttpPostedFile file)
        {
            string strtid = string.Empty;
            string strzid = string.Empty;
            string strzpid = string.Empty;
            string strtitle = this.txtTitle.Value;
            string strtype = this.txttype.Value;
            string strpath = string.Empty;
            string filetitle = string.Empty;
            if (Session["CUR_TID"] != null)
            {
                strtid = Session["CUR_TID"].ToString();
                strzid = Session["CUR_ZID"].ToString();
                strzpid = Session["CUR_PZID"].ToString();

            }


            strpath = System.AppDomain.CurrentDomain.BaseDirectory.ToString() + "file_data\\" + strtid + "\\";
            if (!System.IO.Directory.Exists(strpath))
            {
                System.IO.Directory.CreateDirectory(strpath);
            }
            string datatime = ConvertToTimestamp(DateTime.Now).ToString();
            filetitle = datatime + "_" + file.FileName;
            string StrSql = "insert T_File(title,file_type,path,t_id,file_title,zid,zpid) values('" + strtitle + "','" + strtype + "','" + strpath + "','" + strtid + "','" + filetitle + "','"+ strzid + "','"+ strzpid + "')";
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {

                    file.SaveAs(strpath + filetitle);
                    Response.Redirect("wd_sjxx.aspx");
                }
            }
            catch (Exception ex)
            {

            }

        }
        #endregion
         
    }
}