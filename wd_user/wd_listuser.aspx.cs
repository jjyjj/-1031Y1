using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WeiXinGIS.wd_user
{
    public partial class wd_listuser : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["TYPE"] != "" && Request.QueryString["ZID"] != "")
                {
                    _GetDataBind();
                }               
            }
          
           
        }

        
        public void _GetDataBind()
        {
            if (Request.QueryString["ZID"] == null) return;
            String strSQL = "Select * from T_USER_INFO where T_TYPE='" + Request.QueryString["TYPE"] + "' and ZID='" + Request.QueryString["ZID"] + "'";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
        }
    }
}