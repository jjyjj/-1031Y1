using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace MarketInfo.wd_user
{
    public partial class wd_listusers : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            _GetData();
        }
        public void _GetData()
        {
            
            String strSQL = "Select * from T_USER_INFO where T_TYPE!='0'";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
        }
    }
}