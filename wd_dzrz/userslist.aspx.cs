using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class userslist : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            _GetData();
        }
        public void _GetData()
        {
            String strSQL = "Select * from T_USER_INFO";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
        }
    }
}