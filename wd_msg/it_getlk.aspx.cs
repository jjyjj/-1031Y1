using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

using WXDBUtility;
namespace MarketInfo.wd_msg
{

    public partial class it_getlk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Request.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");  
            string json = "";
            if (Request.QueryString["TYPE"] != "" && Request.QueryString["TYPE"] != null)
            {

                string type = Request.QueryString["TYPE"].ToString();
                //1.SQL注入问题（）
                Regex numRegex = new Regex(@"\b\d{1}\b");
                if (!numRegex.IsMatch(type))
                {
                    // id 为纯数字。。
                    Response.Write("001");
                    return;
                }
                else
                {                
                  json =TOJSON.GetRoutesByOrder(type);
                }
            }
            Response.Write(json);
            Response.Charset = "utf-8";
        }
    }
}