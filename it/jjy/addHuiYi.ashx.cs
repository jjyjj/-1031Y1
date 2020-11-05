using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it.jjy
{
    /// <summary>
    /// addHuiYi 的摘要说明
    /// </summary>
    public class addHuiYi : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
           
            string result = "保存失败";
          
            var uId = Int32.Parse(context.Request.Params["uId"].ToString());
            var title = context.Request.Params["title"].ToString();
            var content = context.Request.Params["content"].ToString();
            var createTime = DateTime.Now.ToString("yyyy-MM-dd");//2020-11-04

            string StrSql = "INSERT INTO T_HuiYi (Title, Content,IsDel,UId,CreateTime) VALUES ('" + title + "', '" + content + "',0," + uId + ",'" + createTime + "')";
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {
                    result = "保存成功";
                }
            }
            catch (Exception ex)
            {
                result = "服务器错误";
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