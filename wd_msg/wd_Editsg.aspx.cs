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
    public partial class wd_Editsg : System.Web.UI.Page
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
               m_info.Text = tb.Rows[0]["HTML"].ToString();
            }
        }

        protected void ButtonSV_Click(object sender, EventArgs e)
        {
            string strHtml = HiddenField1.Value;
            String strSQL = "Update T_SHIGONG_INFO set HTML='" + strHtml
               + "',Edit_user='" + Session["U_LoginName"] + "',LK_TIME='" + DateTime.Now.ToString() + "' where id=1";
            int ires = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            Response.Redirect("wd_Editsg.aspx");
        }
    }
}