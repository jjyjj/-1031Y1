using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace OA_APP.fr_main.fankui
{
    public partial class it_setfankui : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Response.Write(my_Uname + my_PWD);
            if (Request.QueryString["m_question"].ToString() != null)
            {
                string m_question = Request.QueryString["m_question"].ToString().Trim();
                //string m_contact = Request.QueryString["m_contact"].ToString().Trim();
                 _ISOK(m_question);


            }
        }

        public void _ISOK(string m_question)
        {
            int len = m_question.Length;
            if (len>300)
            {
                Response.Write("LEN");
                return;
            }
            string m_IP = GetIP();
            string strSQL = "INSERT INTO T_FanKui (M_MSG,M_IP) VALUES ('" + m_question + "','" +m_IP+"')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            if (res> 0)
            {             
                Response.Write("YES");
            }
            else
            {
                Response.Write("NO");

            }
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