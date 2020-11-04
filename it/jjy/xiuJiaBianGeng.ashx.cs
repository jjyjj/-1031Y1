using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MarketInfo.it.jjy
{
    /// <summary>
    /// xiuJiaBianGeng 的摘要说明
    /// </summary>
    public class xiuJiaBianGeng : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            #region 获取变更数据
            context.Response.ContentType = "text/plain";
            string result = "变更失败";

            int tId = Int32.Parse(context.Request.Params["T_WID"]);
            string strstart = context.Request.Params["strstart"];
            string strend = context.Request.Params["strend"];
            string strreason = context.Request.Params["strreason"];
            string path = context.Request.Params["path"];


            if (path != "undefined")
            {
                path = "../QJfile/" + path;//文件保存的路径
            }
            #endregion

            #region 获取原始数据
            string sql = "SELECT * FROM T_WORK_INFO1 WHERE T_WID=" + tId;
            var tb = WXDBUtility.SqlHelper.GetDataTable(sql);
            DateTime oldSatrtTime = Convert.ToDateTime(tb.Rows[0]["T_WSTART"].ToString());
            DateTime oldEndTime = Convert.ToDateTime(tb.Rows[0]["T_WEND"].ToString());
            #endregion

            #region 数据处理
            DateTime newStratTime = Convert.ToDateTime(strstart);
            DateTime newEndTime = Convert.ToDateTime(strend);
            #endregion


            #region 进行比较 变更情况

            //1 变更  0不变
            //new开始时间大于old开始并且 new结束>new 开始
            var case1 = (newStratTime - oldSatrtTime).Days >= 0 && (newEndTime - newStratTime).Days > 0 ? 1 : 0;
            // new 开始<old 开始 并且 new结束>new 开始 并且new  结束> old 开始
            var case2 = (oldSatrtTime - newStratTime).Days > 0 && (newEndTime - newStratTime).Days > 0 && (newEndTime - oldSatrtTime).Days > 0 ? 1 : 0;
            //这2个是新增
            var case3 = (oldSatrtTime - newEndTime).Days >= 0 && (newEndTime - newStratTime).Days > 0 ? 1 : 0;
            var case4 = (newStratTime - oldEndTime).Days >= 0 && (newEndTime - newStratTime).Days > 0 ? 1 : 0;
            #endregion

            #region 更新/新增
            if (case1 == 1 || case2 == 1)
            {
                //更新变更字段即可
                sql = "UPDATE  T_WORK_INFO1 SET T_WORK_INFO1.T_NewStartTime = '" + strstart + "' , T_WORK_INFO1.T_NewEndTime = '" + strend + "' ,T_WORK_INFO1.T_WRENSON = '" + strreason + "' ,T_WORK_INFO1.T_PATH = '" + path + "' ,T_FLAG=2 WHERE T_WORK_INFO1.T_WID = " + tId;
                try
                {
                    int res = WXDBUtility.SqlHelper.ExecuteSql(sql);
                    if (res > 0)
                    {
                        result = "已经提交变更，请等待审批";
                    }
                }
                catch (Exception ex)
                {
                    result = ex.Message;
                }
            }
            else
            {
                if (case3 == 1 || case4 == 1)
                {
                    result = "变更时间错误，请进行请假操作";
                }

            }
            #endregion
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