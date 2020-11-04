using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_msg
{
    public partial class wd_txinfo : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _GetTimeData();
                _GetData();
                _GetMapSee();
            }
        }

        public void _GetData()
        {
            String sqlStr = "select *  from T_SHIGONG_INFO order by id desc";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(sqlStr);
            if (tb == null) return;
            m_header.Text = tb.Rows[0]["LK"].ToString();
            m_neirong.Text = tb.Rows[0]["HTML"].ToString();
            
        }

        public void _GetMapSee()
        {
            String strSQL = "SELECT * from T_DITU";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null && tb.Rows.Count > 0)
            {
                String seeMap = tb.Rows[0][0].ToString();
                bool yes = false;
                if (seeMap == "1")
                {
                    yes = true;
                }
                m_seeMap.Checked = yes;
            }
        }


        public void _GetTimeData()
        {
            String strSQL = "SELECT m_time from p_uptime";
            DataTable tb = WXDBUtility.PostgreSQLHelper.GetDataTable(strSQL);
            if (tb != null && tb.Rows.Count > 0)
            {
                System.DateTime time = System.DateTime.Parse(tb.Rows[0][0].ToString());
                m_bt.Text = time.ToString();
            }
        }

        protected void m_seeMap_CheckedChanged(object sender, EventArgs e)
        {
            _UpdateSeeMap();
        }

        public void _UpdateSeeMap()
        {
            string strYes = "0";
            if (m_seeMap.Checked)
            {
                strYes = "1";
            }
            String strSQL = "update T_DITU set type='" + strYes + "'";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);

            strSQL = "Update T_SHIGONG_INFO set LK_TIME='" + DateTime.Now.ToString() + "'";
            res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
        }

    }
}