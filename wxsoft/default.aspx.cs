using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace wxsoft
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _GetVisitor();
                _GetCnt();
                _GetData();
            }
        }
        private void _GetData()
        {
            string strSQL = "Select LSMAP,LMAP_TIME,MAP_SEE,LINFO_LKDATA,LINFO_ELSEDATA,LINFO_TIME from T_WXMSG_CUR_INFO";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;
            Label_LK.Text = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["LINFO_LKDATA"].ToString());
            Label_ELSE.Text = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["LINFO_ELSEDATA"].ToString());
            Label_LKTIME.Text = tb.Rows[0]["LINFO_TIME"].ToString();
            //Label_MapTime.Text = tb.Rows[0]["LMAP_TIME"].ToString();
            String strShowMap = tb.Rows[0]["MAP_SEE"].ToString();
            if (strShowMap=="1")
            {
                String strXiaoMap = WXDBUtility.DESHelper.Decrypt_DES(tb.Rows[0]["LSMAP"].ToString());
                if (strXiaoMap!="")
                {
                    Image_Xiao.ImageUrl = "data:image/png;base64," + strXiaoMap;
                }
                else
                {
                    Image_Xiao.Visible = false;
                }
            }
        }

        public void _GetCnt()
        {
            string strSQL = "Select *,(select count(*) from T_TODAY_IP) as tnum from T_IP_NUM";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;
            try
            {
                m_cnt.Text = int.Parse(tb.Rows[0][0].ToString()).ToString("N0");
                m_today.Text = int.Parse(tb.Rows[0][1].ToString()).ToString("N0");
            }
            catch (Exception e) { }
        }

        public void _GetVisitor()
        {
            String strIP = GetIP();
            String strSQL2 = "Insert into T_IP(IP_ADD) Values('" + strIP + "')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL2);
        }
        public static string GetIP()
        {
            //如果客户端使用了代理服务器，则利用HTTP_X_FORWARDED_FOR找到客户端IP地址
            try
            {
                string userHostAddress = userHostAddress = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
                return userHostAddress;
            }
            catch (Exception ex)
            {

            }
            return "127.0.0.1";
        }
    }
}