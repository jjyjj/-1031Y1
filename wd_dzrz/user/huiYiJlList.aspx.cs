using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz.user
{
    public partial class huiYiJlList : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CUR_TID"] != null)
                {
                    this.hideFid.Value = Session["CUR_TID"].ToString();
                }
                _DataBind();


            }
        }
        public void _DataBind()
        {
            var UId = Int32.Parse(Session["CUR_TID"].ToString());
            string sql = "SELECT * FROM T_HuiYi WHERE UId= " + UId + "ORDER BY CreateTime desc";
            tb = WXDBUtility.SqlHelper.GetDataTable(sql);
        }
        public static string stringStr(string str, int len)
        {
            if (str.Length <= len)
            {
                return str;

            }
            else
            {
                return str = str.Substring(0, len) + "...";
            }
        }
    }
}