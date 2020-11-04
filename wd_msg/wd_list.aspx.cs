using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WXDBUtility;


namespace MarketInfo.wd_msg
{
    public partial class wd_list : System.Web.UI.Page
    {
        public DataTable tb = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _GetData();
            }
        }
        public void _GetData()
        {
            string sqlStr = "";
            if (rb_dangri.Checked)
            {
                //String today = System.DateTime.Now.ToShortDateString();
                //String today_St = today + " 00:00:00";
                //String today_Ed = today + " 23:59:59";
                //sqlStr = "select *  from T_SHIGONG_INFO where LK_TIME>='" + today_St
                //    + "' And LK_TIME<='" + today_Ed + "' order by id desc";
                sqlStr = "select *  from T_SHIGONG_INFO order by id desc";
            }
            else
            {
                //sqlStr = "select *  from T_ZL_INFO order by ZL_ID desc";
                sqlStr = "select *  from T_SHIGONG_INFO order by id desc";
            }
            tb = SqlHelper.GetDataTable(sqlStr);
            if (tb != null)
            {
                AspNetPager1.RecordCount = tb.Rows.Count;
                if (tb.Rows.Count >= 0)
                {
                    PagedDataSource ps = new PagedDataSource();
                    DataView dv = new DataView(tb);
                    ps.DataSource = dv;
                    ps.AllowPaging = true;
                    ps.CurrentPageIndex = AspNetPager1.CurrentPageIndex - 1;
                    ps.PageSize = AspNetPager1.PageSize;
                    DataList1.DataSource = ps;
                    DataList1.DataBind();
                    //m_rowcnt.Text = "共有[" + tb.Rows.Count.ToString() + "]条数据";
                }
            }
        }
        protected void AspNetPager1_PageChanged(object sender, EventArgs e)
        {
            _GetData();
        }

        protected void rb_dangri_CheckedChanged(object sender, EventArgs e)
        {
            _GetData();
        }


        protected void rb_all_CheckedChanged(object sender, EventArgs e)
        {
            _GetData();
        }
       

        protected void bnt_xs_Click(object sender, EventArgs e)
        {
            _DITU("0");//显示地图
        }

        protected void bnt_yc_Click(object sender, EventArgs e)
        {
            _DITU("1");//隐藏地图
        }
        private void _DITU(string type)
        {
            String sql1 = "update T_DITU set type='" + type + "'";
            int ires = SqlHelper.ExecuteSql(sql1);
            if (ires > 0)
            {

            }
        }
      
    }
}