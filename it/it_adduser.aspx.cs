using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.it
{
    public partial class it_adduser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            _adduser();

            _Addclass();
        }
        //ADDCLASS
        public void _Addclass()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "ADDCLASS") return;
            //CURTID
            // var url = "../it/it_adduser.aspx?CMD=ADDUSER&ZID=" + zid + "&ZPID=" + zpid + "&TYPE=" + type + "&PDW=" + txtpwd + "&UNAME=" + txtReason;

            String strsql = "insert into T_ZYQ_INFO (zpid,zname,ztype)  VALUES('" + Request.QueryString["PID"] + "','" + Request.QueryString["NAME"] + "','" + Request.QueryString["TYPE"] + "')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strsql);
            if (res > 0)
            {
                Response.Write("1");//成功
                return;
            }
            else
            {
                Response.Write("-1");//失败
                return;
            }
        } 
        public void _adduser()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "ADDUSER") return;
            //CURTID
            // var url = "../it/it_adduser.aspx?CMD=ADDUSER&ZID=" + zid + "&ZPID=" + zpid + "&TYPE=" + type + "&PDW=" + txtpwd + "&UNAME=" + txtReason;
            //TRUENAME
            String strsql = "insert into T_USER_INFO (T_UNAME,T_PWD,ZID,ZPID,T_TYPE,T_NAME)  VALUES('" + Request.QueryString["UNAME"] + "','" + Request.QueryString["PDW"] + "','" + Request.QueryString["ZID"] + "','" + Request.QueryString["ZPID"] + "','" + Request.QueryString["TYPE"] + "','" + Request.QueryString["TRUENAME"] + "')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strsql);
            if (res > 0)
            {
                Response.Write("1");//成功
                return;
            }
            else
            {
                Response.Write("-1");//失败
                return;
            }
        } 
    }
}