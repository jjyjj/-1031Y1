using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WXDBUtility
{
   public class Updatelog
    {


        public static int Uplgo(String strtid)
        {
            String strnowdate = DateTime.Now.ToShortDateString().ToString();

            //String SQLupdate = "update t_log set write='1' where T_ID='" + strtid + "' and trctime<=getdate() and trctime>'"+ strnowdate + "'";
            String SQLupdate = "update t_log set write='1' where T_ID='" + strtid + "' and  DateDiff(dd,trctime,getdate())=0";
            
            //DateDiff(dd,setTime,getdate())=0
           int res= WXDBUtility.SqlHelper.ExecuteSql(SQLupdate);
            return res;
        }
    }
}
