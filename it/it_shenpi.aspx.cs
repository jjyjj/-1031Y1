using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.it
{
    public partial class it_shenpi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            _SZFSP();
            _XunXianGong();
            _QiTaGongZuo();
        }
        /// <summary>
        /// 其他工作
        /// </summary>
        private void _QiTaGongZuo()
        {
            string result = "退回失败";
            string strcmd = Request.Form["cmd"];
            string strid = Request.Form["id"];
            string strsp = Request.Form["sp"];
            string strspa = Request.Form["spa"];
            string strname= Request.Form["Name"];
            if (strcmd != "qtgz") { return; }
            try
            {
                string StrSql = "UPDATE dbo.t_qita set sp" + strspa + "='" + strsp + "' ,sprid" + strspa + "='" + Session["CUR_TID"] + "',reason" + strspa + "='" + strname + "'  where q_id='" + strid + "'";
                if (strsp == "-1") {
                    StrSql = "UPDATE dbo.t_qita set sp" + strspa + "='" + strsp + "' ,sprid" + strspa + "='" + Session["CUR_TID"] + "',reason" + strspa + "='" + strname + "',flag='0'  where q_id='" + strid + "'";
                }
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {
                    result = "0";
                }
                Response.Write(result);//成功 

            }
            catch (Exception ex)
            {
                result = ex.Message;
            }                    
        }
        /// <summary>
        /// 巡线工
        /// </summary>
        private void _XunXianGong()
        {
            string result = "退回失败";
            string strcmd = Request.Form["cmd"];
            string strid = Request.Form["id"];
            string strsp = Request.Form["sp"];
            string strspa = Request.Form["spa"];
            if (strcmd != "xxg") { return; }
            try
            {


                String StrSql = "";
                if (strsp == "-1")
                {
                    //strsql = "UPDATE t_dongtaifengxian set sp" + context.Request.Form["sp"] + "='" + context.Request.Form["TYPE"] + "' ,spid" + context.Request.Form["sp"] + "='" + context.Session["CUR_TID"] + "',reason" + context.Request.Form["sp"] + "='" + context.Request.Form["Reason"] + "',setTime='" + DateTime.Now.ToLocalTime() + "',flag='0'  where id='" + context.Request.Form["ID"] + "'";
                    StrSql = "UPDATE dbo.t_xunhuguanli set sp" + strspa + "='" + strsp + "' ,sprid" + strspa + "='" + Session["CUR_TID"] + "',reason" + strspa + "='" + Request.Form["Reason"] + "',setTime='" + DateTime.Now.ToLocalTime() + "',flag='0'   where xh_id='" + strid + "'";

                }
                else
                {
                    //strsql = "UPDATE t_dongtaifengxian set sp" + context.Request.Form["sp"] + "='" + context.Request.Form["TYPE"] + "' ,spid" + context.Request.Form["sp"] + "='" + context.Session["CUR_TID"] + "',reason" + context.Request.Form["sp"] + "='" + context.Request.Form["Reason"] + "',setTime='" + DateTime.Now.ToLocalTime() + "'  where id='" + context.Request.Form["ID"] + "'";
                    StrSql = "UPDATE dbo.t_xunhuguanli set sp" + strspa + "='" + strsp + "' ,sprid" + strspa + "='" + Session["CUR_TID"] + "',reason" + strspa + "='" + Request.Form["Reason"] + "',setTime='" + DateTime.Now.ToLocalTime() + "'   where xh_id='" + strid + "'";

                }

               // string StrSql = "UPDATE dbo.t_xunhuguanli set sp" + strspa + "='" + strsp + "' ,sprid" + strspa + "='" + Session["CUR_TID"] + "',flag='0'   where xh_id='" + strid + "'";
                    int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                    if (res > 0)
                    {
                        result = "0";
                    }
                    Response.Write(result);//成功 
                
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }                        
        }
        public void _SZFSP() { 
        
          string strcmd = Request.QueryString["CMD"];
            if (strcmd != "SZFSP") return;
            //CURTID
            string strtype = Session["CUR_T_ID"].ToString();
            String strsql = "";
            //管理处
            if (strtype == "0")
            {
                strsql = "UPDATE t_sanzhuangfei set sp3='" + Request.QueryString["TYPE"] + "' ,sprid3='" + Session["CUR_TID"] + "',reason3='" + Request.QueryString["Reason"] + "'  where s_id='" + Request.QueryString["EDIT_SZID"] + "'";
            }
            //区主任
            if (strtype == "1")
            {
                strsql = "UPDATE t_sanzhuangfei set sp2='" + Request.QueryString["TYPE"] + "' ,sprid2='" + Session["CUR_TID"] + "',reason2='" + Request.QueryString["Reason"] + "'  where s_id='" + Request.QueryString["EDIT_SZID"] + "'";               
            }
             //站长
            if (strtype == "2")
            {
                strsql = "UPDATE t_sanzhuangfei set sp1='" + Request.QueryString["TYPE"] + "' ,sprid1='" + Session["CUR_TID"] + "',reason1='" + Request.QueryString["Reason"] + "'  where s_id='" + Request.QueryString["EDIT_SZID"] + "'";
            }
            
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