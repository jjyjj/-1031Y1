using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WXDBUtility
{
    public class ConfigHelper
    {
        public static string SysName = GetAppStrings("SYSNEME");
        //public static string DeptName = string.Empty;//登录单位
        //public static string DeptID = string.Empty;//登录单位编号
        //public static string UserName = string.Empty;//用户名
        //public static string UserID = string.Empty;//用户身份证

        #region 读取connecitonStrings配置节
        /// <summary>
        /// 依据连接串名字connectionName返回数据连接字符串
        /// </summary>
        /// <param name="connectionName"></param>
        /// <returns></returns>
        public static string GetConnectionStrings(string connectionName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings[connectionName].ConnectionString.ToString();
            return connectionString;
        }
        #endregion

        #region 读取appStrings配置节
        /// <summary>
        /// 返回config文件中appSettings配置节的value项
        /// </summary>
        /// <param name="strKey"></param>
        /// <returns></returns>
        public static string GetAppStrings(string strKey)
        {
            foreach (string key in ConfigurationManager.AppSettings)
            {
                if (key == strKey)
                {
                    return ConfigurationManager.AppSettings[strKey];
                }
            }
            return null;
        }
        #endregion


    }
}
