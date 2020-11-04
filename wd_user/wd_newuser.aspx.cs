using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinGIS.wd_user
{
    public partial class wd_newuser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["T_UNAME"] != null)
                {
                    m_T_UNAME.Text = m_T_UNAME.ToolTip = Request.QueryString["T_UNAME"].ToString();
                    m_T_PWD.Text = m_T_PWD2.Text = Request.QueryString["T_PWD"].ToString();
                }
            }
        }
        public void _Add()
        {
            if (m_T_UNAME.Text.Trim() == "" || m_T_PWD.Text.Trim() == "")
            {
                return;
            }

            String strSQL = "Insert into T_USER_INFO(T_UNAME,T_PWD,T_TYPE) VALUES('" + m_T_UNAME.Text
                + "','" + m_T_PWD.Text + "',1)";
            WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            Response.Redirect("wd_listusers.aspx");
        }

        public void _Update()
        {
            if (m_T_UNAME.Text.Trim() == "" || m_T_PWD.Text.Trim() == "")
            {
                return;
            }

            String strSQL = "Update T_USER_INFO set T_UNAME='" + m_T_UNAME.Text
                + "',T_PWD='" + m_T_PWD.Text + "' where T_UNAME='" + m_T_UNAME.ToolTip + "'";
            WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            Response.Redirect("wd_listusers.aspx");
        }
        protected void Button_save_Click(object sender, EventArgs e)
        {
            if (m_T_UNAME.ToolTip != "")
            {
                _Update();
            }
            else
            {
                _Add();
            }
            

        }
    }
}