using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_gdkwork
{
    public partial class wd_workinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                this.hide_id.Value = Request.QueryString["curt_id"];

                GetBind(Request.QueryString["curt_id"]);
            }
        }

        public void GetBind(string strid)
        {
            String strSql = "select  * from dbo.t_gdk_workday where id='" + strid + "'  ";
            DataTable dt = WXDBUtility.SqlHelper.GetDataTable(strSql);
            if (dt != null) {

                 //$('#txtddup').val(data[0].didian);
                 // $('#txtworkup').val(data[0].zhuyao_gongzuo);
                 // $('#txtqtup').val(data[0].qita);
                 // $('#txtbzgzup').val(data[0].benzhou_zhongdian);
                 // $('#txtxzapup').val(data[0].xiahzou_jihua);

                txtddup.Value = dt.Rows[0]["didian"].ToString();
                txtworkup.Value = dt.Rows[0]["zhuyao_gongzuo"].ToString();
                txtqtup.Value = dt.Rows[0]["qita"].ToString();
                txtbzgzup.Value = dt.Rows[0]["benzhou_zhongdian"].ToString();

                txtxzapup.Value = dt.Rows[0]["xiahzou_jihua"].ToString();

            
            }
        
        }
    }
}