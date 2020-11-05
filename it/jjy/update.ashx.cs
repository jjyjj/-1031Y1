using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it.jjy
{
    /// <summary>
    /// update 的摘要说明
    /// </summary>
    public class update : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int tId = Int32.Parse(context.Request.Params["T_WID"]);
            int type = Int32.Parse(context.Request.Params["type"]);
            string returnReason = "";
            string sql = "";
            string result = "";
            if (type == 1)
            {
                returnReason = context.Request.Params["ReturnReason"].ToString();
                sql = "UPDATE T_WORK_INFO1 SET T_WORK_INFO1.T_FLAG = 4 , T_WORK_INFO1.T_ReturnReason ='" + returnReason + "' WHERE T_WORK_INFO1.T_WID = " + tId;
                result = WXDBUtility.SqlHelper.ExecuteSql(sql) > 0 ? "驳回成功" : "驳回失败";
            }
            else
            {
                sql = "UPDATE T_WORK_INFO1 SET T_WORK_INFO1.T_FLAG = 3 WHERE T_WORK_INFO1.T_WID = " + tId;
                result = WXDBUtility.SqlHelper.ExecuteSql(sql) > 0 ? "审批成功" : "审批失败";
            }

            context.Response.Write(result);

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}