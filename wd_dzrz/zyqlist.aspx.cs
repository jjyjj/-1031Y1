using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class zyqlist : System.Web.UI.Page
    {
        public DataTable tb = null;
        public int strtype=1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["PID"] != null)
                {
                    Session["PID"] = Request.QueryString["PID"];//
                    Session["PNAME"] = Request.QueryString["PNAME"];

                }
                if (Session["PID"] == null)
                {
                    Session["PID"] = "-1";
                }
                m_pid.Value = Session["PID"].ToString();
                _GetData();

            }
        }
        public void _GetData()
        {
            String strSQL = "select * from T_ZYQ_INFO where zpid=" + Session["PID"].ToString() + " order by zid";
            tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null)
            {
                strtype = int.Parse(tb.Rows[0]["ztype"].ToString());
                //if (strtype == 2)
                //{
                //    strtype = strtype + 1;
                //}
            }
            else {
                strtype = int.Parse(Request.QueryString["TYPE"].ToString()) + 1;
            }
        }

        public String _GetBack()
        {
            String strHtml = "";
            String strPID = _GetParID(Session["PID"].ToString());
            strHtml = "<a href='zyqlist.aspx?PID=" + strPID + "' class='btn btn-success btn-round'><i class='ace-icon glyphicon glyphicon-backward red2'></i>返回上级</a>";
            return strHtml;
        }

        public String _GetParID(String curID)
        {
            String strSQL = "select * from T_ZYQ_INFO where zpid=" + curID;
            DataTable mtb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (mtb == null) return "";
            return mtb.Rows[0]["zid"].ToString();
        }
    }
}