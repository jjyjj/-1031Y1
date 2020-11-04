using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MarketInfo.wd_dzrz.wd_file
{
    public partial class wd_ygtz : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Session["CUR_T_ID"] != null)
                {
                    this.HideTid.Value = Session["CUR_T_ID"].ToString();
                    this.hid_tid.Value = Request.QueryString["TID"];
                }
            }
        }





        #region  
        public static long ConvertToTimestamp(DateTime time)
        {

            DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
            return (long)(time - startTime).TotalSeconds * 1000;

        } 
        /// <summary>
        /// 事件通知ADD
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_save1_Command(object sender, CommandEventArgs e)
        { 
                    filesa1(); 
        } 
        public void filesa1()
        {
            HttpPostedFile file = Request.Files[0];     
            string fileName = System.IO.Path.GetFileName(file.FileName.ToString());
            string strtid = string.Empty;
            string strzid = string.Empty;
            string strzpid = string.Empty;
            string strtitle = this.txttitle1.Value;
            string strpath = string.Empty;
            string filetitle = string.Empty;
            if (Session["CUR_TID"] != null)
            {
                 strtid = Session["CUR_TID"].ToString();
                 strzid = Session["CUR_ZID"].ToString();
                 strzpid = Session["CUR_PZID"].ToString();

            }
            strpath = System.AppDomain.CurrentDomain.BaseDirectory.ToString() + "file_data1\\" + strtid + "\\";
            if (!System.IO.Directory.Exists(strpath))
            {
                System.IO.Directory.CreateDirectory(strpath);
            }
            string datatime = ConvertToTimestamp(DateTime.Now).ToString();
            filetitle = datatime + "_" + fileName; 
            string StrSql = "insert T_File_1(title,path,t_id,file_title,zid,zpid) values('" + strtitle + "','" + strpath + "','" + strtid + "','" + filetitle + "','"+ strzid + "','"+ strzpid + "')";
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {

                    file.SaveAs(strpath + filetitle);
                    Response.Redirect("wd_ygtz.aspx");
                }
            }
            catch (Exception ex)
            {

            }

        } 
        #endregion
    }
}