using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;

namespace WXDBUtility
{
    public partial class ROUTESSer
    {
        #region  BasicMethod

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public static DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select lk,lk_time");
            strSql.Append(" FROM T_LK where l_id=1");
            return SqlHelper.Query(strSql.ToString());
        }
        public static DataSet GetListARR(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select top 1 M_CONTENT,M_CRTTIME");
            strSql.Append(" FROM T_COMM_MSG order by M_CRTTIME desc");
            return SqlHelper.Query(strSql.ToString());
        }
        #endregion  BasicMethod
        #region  ExtensionMethod

        #endregion  ExtensionMethod
    }
}