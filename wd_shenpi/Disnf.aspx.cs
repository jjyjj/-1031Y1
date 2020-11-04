using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_shenpi
{
    public partial class Disnf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Request.QueryString["TID"] != null) {
                    this.HideTid.Value = Request.QueryString["TID"].ToString();
                }
            }
            sp_type();//判断哪个级别进入
        }
        public void sp_type() {
            string strtpe = string.Empty;
            if (Session["CUR_T_ID"] != null)
            {
                strtpe = Session["CUR_T_ID"].ToString();
            }
            switch (strtpe)
            {
                case "0":
                    this.Hide_Sp.Value = "3";
                    break;                   
                case "1":
                    this.Hide_Sp.Value = "2";
                    break;
                case "2":
                    this.Hide_Sp.Value = "1";
                    break;
            } 
        }
                  

    }
}