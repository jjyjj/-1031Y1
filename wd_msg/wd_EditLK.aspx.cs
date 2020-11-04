using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WXDBUtility;
using System.IO;
using System.Text;


namespace MarketInfo.ZSGLInfo
{
    public partial class wd_EditLK : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _Getdata();
            }
        }
        private void _Getdata()
        {
            string sqlStr = "";
            sqlStr = "select *  from T_SHIGONG_INFO order by id desc";
            tb = SqlHelper.GetDataTable(sqlStr);
            if (tb != null)
            {
                m_info.Text = tb.Rows[0]["LK"].ToString();
            }
        }
        protected void ButtonSV_Click(object sender, EventArgs e)
        {
            string strHtml = HiddenField1.Value;
            string strHtml1 = HiddenField2.Value;
            //strHtml = HttpUtility.UrlDecode(strHtml, Encoding.UTF8); 
            //加密传输
            //StreamWriter streamWriter = new StreamWriter(strHtml, false, System.Text.Encoding.UTF8);
            //String strHtml=Request.Params["m_html"];
            String strSQL = "Update T_SHIGONG_INFO set LK='" + strHtml
               + "', Edit_user='" + Session["U_LoginName"] + "',LK_TIME='"+DateTime.Now.ToString()+"' where id=1";

            //纯文本的路况信息（接口用的）
            String strSQL1 = "Update T_LK set lk='" + strHtml1
              + "',lk_time='" + DateTime.Now.ToUniversalTime().ToString() + "', lk_user='" + Session["U_LoginName"] + "' where l_id=1";
            int ires1 = WXDBUtility.SqlHelper.ExecuteSql(strSQL1);
            int ires = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            Response.Redirect("wd_EditLK.aspx");
        }
    }
}