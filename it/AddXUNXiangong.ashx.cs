using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace MarketInfo.it
{
    /// <summary>
    /// AddXUNXiangong 的摘要说明
    /// </summary>
    public class AddXUNXiangong : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";

           //  $.post("../../it/XunXianGongAdd.ashx", {xxname: xxname, xxqdzh: xxqdzh, xxzdzh: xxzdzh, : licheng, : xxnianling, : xxshenfenzheng, : xxtel}, function (data) {
               
            string strxxname = context.Request.Form["xxname"];
            string strxxqdzh = context.Request.Form["xxqdzh"];
            string strxxzdzh = context.Request.Form["xxzdzh"];
            string strlicheng = context.Request.Form["licheng"];
            string strxxnianling = context.Request.Form["xxnianling"];
            string strxxshenfenzheng = context.Request.Form["xxshenfenzheng"];
            string strxxtel = context.Request.Form["xxtel"];
            StringBuilder strField = new StringBuilder();
            StringBuilder strValues = new StringBuilder();
            strField.Append("insert into t_xunxiangong_info(");
            strValues.Append(") VALUES(");

            strField.Append("xx_name");
            strValues.Append("'" + strxxname + "',");
            strField.Append(",xx_qdzh");
            strValues.Append("'" + strxxqdzh + "',");


            strField.Append(",xx_zdzh");
            strValues.Append("'" + strxxzdzh + "',");

            strField.Append(",xx_licheng");
            strValues.Append("'" + strlicheng + "',");

            strField.Append(",xx_nianling");
            strValues.Append("'" + strxxnianling + "',");
            strField.Append(",xx_shenfenhao");
            strValues.Append("'" + strxxshenfenzheng + "',");
            strField.Append(",xx_tel");
            strValues.Append("'" + strxxtel + "',");
            strField.Append(",xx_tid");
            strValues.Append("'" +context.Request.Form["tid"] + "')");         
            strField.Append(strValues.ToString());
            String strInser = strField.ToString();
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(strInser);
                if (res > 0)
                {
                    result = "0";
                }
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }
            context.Response.ContentType = "text/plain";
            context.Response.Write(result);
            //int res2 = WXDBUtility.SqlHelper.ExecuteSql(strInser);
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