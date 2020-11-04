using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_user
{
    public partial class wd_bg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _binddata();
            }
        }
        public void _binddata()
        {
            string StrSql = "";

            string strtype = Session["CUR_T_ID"].ToString();//TYPE
            string strzid = Session["CUR_ZID"].ToString();
            string strzpid = Session["CUR_PZID"].ToString();
            if (strtype == "1")
            {
                StrSql = "select  * from dbo.T_ZYQ_INFO where  ztype='1' and zid<>'" + strzid + "'";

            }
            if (strtype == "2" || strtype == "3")
            {
                StrSql = "select  * from dbo.T_ZYQ_INFO where  ztype='2' and zid<>'" + strzid + "'";

            }
            // dt = WXDBUtility.SqlHelper.GetDataTable(strsql);           
           DataTable dt = WXDBUtility.SqlHelper.GetDataTable(StrSql);               
            C_COUNTRY.DataSource = dt;
            C_COUNTRY.DataTextField = "zname";
            C_COUNTRY.DataValueField = "zid";           
            C_COUNTRY.DataBind();
            this.C_COUNTRY.Items.Insert(0, new ListItem("请选择目标单位", ""));
            //strSQL = "SELECT  JB_NAME FROM T_JB_TYPE  ";
            //dt = DBUtility.DbHelperSQL.GetDataTable(strSQL);
            //D_JB.DataSource = dt;
            //D_JB.DataTextField = "JB_NAME";
            //D_JB.DataBind();

        }
    }
}