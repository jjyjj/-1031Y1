using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace MarketInfo.it
{
    /// <summary>
    /// UpdateXunXianGong 的摘要说明
    /// </summary>
    public class UpdateXunXianGong : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string result = "保存失败";
            //   $.post("../../it/UpdateXunXianGong.ashx", { id: txtid, txtxingming: txtxingming, age: txtage, card: txtcard, tel: txttel, 
            //zhqd: txtzhqd, zhzd: txtzhzd, lc: txtlc, 
            //quyu: txtquyu, zhanneipingjia: txtzhanneipingjia, qita: txtqita, tid: txttid, zhuzhi: txtzhuzhi }, function (data) {
            // { id: txtid, txtxingming: txtxingming, age: txtage, card: txtcard, tel: txttel, zhqd: txtzhqd, zhzd: txtzhzd, lc: txtlc, quyu: txtquyu, zhanneipingjia: txtzhanneipingjia, qita: txtqita, tid: txttid, zhuzhi: txtzhuzhi, bg: txtbg }
           
            // var url = "../../it/UpdateXunXianGong.ashx";
            //$.post(url, { id: txtid, txtxingming: txtxingming, age: txtage, card: txtcard, tel: txttel, zhqd: txtzhqd, zhzd: txtzhzd, lc: txtlc,
            //quyu: txtquyu, zhanneipingjia: txtzhanneipingjia, qita: txtqita, tid: txttid, zhuzhi: txtzhuzhi,
            //bg: txtbg }, function (data) {
             
            StringBuilder UP_strSQL = new StringBuilder();
            UP_strSQL.Append("UPDATE t_xunxiangong_info set ");
            UP_strSQL.Append("xx_name='" + context.Request.Form["txtxingming"] + "',");
            UP_strSQL.Append("xx_nianling='" + context.Request.Form["age"] + "',");
            UP_strSQL.Append("xx_shenfenhao='" + context.Request.Form["card"] + "',");
            UP_strSQL.Append("xx_tel='" + context.Request.Form["tel"] + "',");

            UP_strSQL.Append("xx_qdzh='" + context.Request.Form["zhqd"] + "',");

            UP_strSQL.Append("xx_zdzh='" + context.Request.Form["zhzd"] + "',");

            UP_strSQL.Append("xx_licheng='" + context.Request.Form["lc"] + "',");
            UP_strSQL.Append("xx_jiating_zh='" + context.Request.Form["zhuzhi"] + "',");
            UP_strSQL.Append("xx_zhennei_pj='" + context.Request.Form["zhanneipingjia"] + "',");
            UP_strSQL.Append("xx_qita='" + context.Request.Form["qita"] + "',");
            UP_strSQL.Append("xx_guanxia_qy='" + context.Request.Form["quyu"] + "',");
            //xx_guanxia_qy
            UP_strSQL.Append("xx_renyuan_bgxx='" + context.Request.Form["bg"] + "'");
            UP_strSQL.Append(" where xx_tid='" + context.Request.Form["tid"] + "' and xx_id='" + context.Request.Form["id"] + "' ");
            String strUP_mySQL = UP_strSQL.ToString();

            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(strUP_mySQL);
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