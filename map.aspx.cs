using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WeiXinGIS
{
    public partial class map : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["MAP"]!=null)
            {
                //Response.ContentType = "image/png";
                string strMap = Request.QueryString["MAP"];
                _GetMap(strMap);
            }
        }
        public void _GetMap(string strMap)
        {
            string strPath = System.Configuration.ConfigurationManager.ConnectionStrings["MAPPATH"].ToString();
            Response.ContentType = "image/png";
            if (strMap == "1")//大图
            {
                string strXYPng = strPath + "800000/800000.png";
                Response.WriteFile(strXYPng);
            }
            else
            {
                string strXYPng = strPath + "1600000/1600000.png";
                Response.WriteFile(strXYPng);
            }
            
        }

    }
}