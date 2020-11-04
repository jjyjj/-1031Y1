using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace WeiXinGISMap
{
    public partial class gsmap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String strdata = _GetData();
        }
        public String _GetData()
        {
            String strRes = "";
            //if (Request.QueryString["vehicleinfoCode"] == null) return strRes;
            //String strCMD = Request.QueryString["vehicleinfoCode"];

            String strSQL = "select * from T_WORK_INFO1 where T_WID='2'";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null)
            {
                strRes = WXDBUtility.JsonHelper.DataTableToJson(tb);
                // string str="";//"{"data":
                //  strRes=""+
            }
            return strRes;
        }
    }
}