using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;

namespace MarketInfo.wd_dzrz.wd_file
{
    /// <summary>
    /// deldata1 的摘要说明
    /// </summary>
    public class deldata1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "删除失败";
            string strid = context.Request.Form["id"];

            string path = string.Empty;
            string StrSql = "delete T_File_1 where id=" + strid;
            string sql = "select * from T_File_1 where id=" + strid;
            DataTable dt = WXDBUtility.SqlHelper.GetDataTable(sql);
            if (dt != null)
            {
                path = dt.Rows[0]["path"].ToString() + dt.Rows[0]["file_title"].ToString();
            }
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {
                    if (File.Exists(path))
                    {
                        File.Delete(path);
                    }
                    result = "0";
                }
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }
            context.Response.ContentType = "text/plain";
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