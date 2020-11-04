using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Text;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using PB;
using System.Data;

namespace MarketInfo.it
{
    public partial class get : System.Web.UI.Page
    {
        public static String m_ip = System.Configuration.ConfigurationManager.ConnectionStrings["DATAIP"].ConnectionString;
        public static String sign = System.Configuration.ConfigurationManager.ConnectionStrings["DATAKEY"].ConnectionString;
        
        public String m_httpSFZ;
        public String m_httpLD;
        protected void Page_Load(object sender, EventArgs e)
        {
            m_httpSFZ = m_ip + "/control/sfz";
            m_httpLD = m_ip + "/control/road";
            String strSFZ = HttpPost(m_httpSFZ);
            String strLD = HttpPost(m_httpLD);
            JObject JoSFZ = (JObject)JsonConvert.DeserializeObject(strSFZ);
            if (JoSFZ == null) return;
            //bool iSFZ = false;
            //if (JoSFZ["code"].ToString()=="200")
            //{
            //    iSFZ = true;
            //}

            //bool iLD = false;
            JObject JoLD = (JObject)JsonConvert.DeserializeObject(strLD);

            if (Request.QueryString["CMD"] != null)
            {
                String cmd = Request.QueryString["CMD"];
                if (cmd == "SEEIT")
                {
                    Response.Write(strSFZ);
                    Response.Write("<p>");
                    Response.Write(strLD);
                    Response.End();
                    return;
                }
            }
            
            //if (JoLD == null) return;
            //if (JoLD["code"].ToString() == "200")
            //{
            //    iLD = true;
            //}

            String strJMSFZ = wc_pub.Encrypt_DES(strSFZ);
            String strJMLD = wc_pub.Encrypt_DES(strLD);
            if (!_IsIn(strJMSFZ, strJMLD))
            {
                String strGID = System.Guid.NewGuid().ToString();
                String strSQL = "Insert into T_ITZL_INFO(IT_ZL_SFZ,IT_ZL_ROAD,GID) VALUES('" +
                                     strJMSFZ + "','" + strJMLD + "','" + strGID + "')";
                int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
                //然后生成这个地图
                if (res > 0 && _IsCanUp() == "1")
                {
                    //_CrtMap(strGID);
                    Response.Redirect("api.aspx?CMD=FABU&GID=" + strGID);
                }
                //Response.Write(res.ToString());
            }
            else
            {
                Response.Write("没有更新!");
            }
            
        }

        public bool _IsIn(String strSFZ, String strLD)
        {
            bool yes = false;
            String strSQL = "select top 1 * from T_ITZL_INFO order by IT_TIME desc";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return yes;
            if (strSFZ == tb.Rows[0]["IT_ZL_SFZ"].ToString() && strLD == tb.Rows[0]["IT_ZL_ROAD"].ToString())
            {
                yes = true;
            }
            return yes;
        }

        public static string HttpPost(string Url)
        {
            string retString = "";
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url);
                request.Method = "POST";
                request.ContentType = "application/json";
                request.Headers.Add("sign",sign);
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                string encoding = response.ContentEncoding;
                if (encoding == null || encoding.Length < 1)
                {
                    encoding = "UTF-8"; //默认编码
                }
                StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding(encoding));
                retString = reader.ReadToEnd();
            }
            catch (System.Exception ex)
            {
            	
            }            
            return retString;
        }

        public String _IsCanUp()
        {
            try
            {
                String strSQL = "Select * from T_ITZL_OK";
                DataTable mtb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
                if (mtb != null)
                {
                    return mtb.Rows[0][0].ToString();
                }
                else
                {
                    return "0";
                }
            }
            catch (System.Exception ex)
            {
                return "0";
            }
            return "0";
        }

    }
}