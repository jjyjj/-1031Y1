using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_dier_shigong
{
    public partial class dier : System.Web.UI.Page
    {

     
        public DataTable dt_2 = null;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            _GetGData();
        }
        public void _GetGData()
        {



            string strSel = "select top 1 * from dbo.t_DIER_shigong where id='" + Request.QueryString["EDIT_GID"] + "' ";


            dt_2 = WXDBUtility.SqlHelper.GetDataTable(strSel);
     
         


        }

     



    }
}