using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace MarketInfo
{
    public partial class crtmap : System.Web.UI.Page
    {
        public static string Server_IP = ConfigurationManager.ConnectionStrings["Server_IP"].ToString();
        public static string m_MKT = ConfigurationManager.ConnectionStrings["MKT"].ToString();
        public static string m_XiaoTu = ConfigurationManager.ConnectionStrings["XIAOTU"].ToString();
        public static string m_DaTu = ConfigurationManager.ConnectionStrings["DATU"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            //3500&H=3344
            ImageS.ImageUrl = Server_IP + "/mapwms.aspx?MAP=" + m_MKT + m_XiaoTu;
            ImageB.ImageUrl = Server_IP + "/mapwms.aspx?MAP=" + m_MKT + m_DaTu;
        }
    }
}