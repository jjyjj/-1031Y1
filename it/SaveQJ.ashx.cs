using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it
{
    /// <summary>
    /// SaveQJ 的摘要说明
    /// </summary>
    public class SaveQJ : IHttpHandler
    {
        /// <summary>
        /// 上传文件同时将文件保存到指定文件夹
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {
             HttpPostedFile file = context.Request.Files[0];//获取索引为0的文件
             string path = context.Server.MapPath("~/QJfile/" + file.FileName);//保存路径
             file.SaveAs(path);//直接保存，不返回
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