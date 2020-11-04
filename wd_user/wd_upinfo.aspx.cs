using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinGIS.wd_user
{
    public partial class wd_upinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["U_LoginName"]!=null)
            {
                _Init();
            }
        }

        protected void Button_save_Click(object sender, EventArgs e)
        {
            String strSQL = "Update T_USER_INFO set T_UNAME='" + m_T_UNAME.Text.Trim()
                + "',T_PWD='" + m_T_PWD.Text.Trim() + "' where T_UNAME='" + m_T_UNAME.ToolTip + "'";
            int ires=WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            if (ires>0)
            {
                Session["U_LoginName"] = m_T_UNAME.Text.Trim();
                Response.Write("<Script Language=JavaScript>alert('修改成功！');</Script>");
            }
            else
            {
                Response.Write("<Script Language=JavaScript>alert('修改失败！');</Script>");
            }
            
        }

        public void _Init()
        {
            String strSQL = "Select * from T_USER_INFO where T_UNAME='" + Session["U_LoginName"].ToString()
                + "'";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null || tb.Rows.Count>0)
            {
                m_T_UNAME.Text = m_T_UNAME.ToolTip = tb.Rows[0]["T_UNAME"].ToString();
            }
        }
    }
}