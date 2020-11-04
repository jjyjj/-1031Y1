using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo
{
    public partial class postall : System.Web.UI.Page
    {
        /************************************************************************/
        /* 2020.9.29定时提交当天的作业
         *
         * 
        / * 
        /************************************************************************/
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime strnowdate = DateTime.Parse(DateTime.Now.ToLongTimeString());
            String strnowdate2 = DateTime.Now.ToShortDateString().ToString();

            //下午5点之前不做任何处理  直接return
            String strwu = "17:00:00";
            String strwuend = "17:30:00";
            DateTime strwuend1 = DateTime.Parse(strwuend);

            String strliu = "17:55:00";
            DateTime strliuend1 = DateTime.Parse("18:30:00");
            String strqi = "19:00:00";
            DateTime strqiend1 = DateTime.Parse("19:30:00");

            DateTime strwunew = DateTime.Parse(strwu);

            DateTime strliunew = DateTime.Parse(strliu);

            DateTime strqinew = DateTime.Parse(strqi);

            int num1 = DateTime.Compare(strnowdate, strwunew);
            int num10 = DateTime.Compare(strwuend1, strnowdate);

            int num2 = DateTime.Compare(strnowdate, strliunew);
            int num20 = DateTime.Compare(strliuend1, strnowdate);

            int num3 = DateTime.Compare(strnowdate, strqinew);
            int num30 = DateTime.Compare(strqiend1, strnowdate);

            if (num1 > 0 && num10 != -1)
            {

                //更新type=3的用户提交的作业
                _Uptype3("3");
            }
            if (num2 > 0 && num20 != -1)
            {

                //更新type=2的用户提交的作业
                _Uptype3("2");
            }
            if (num3 > 0 && num30 != -1)
            {

                //更新type=1的用户提交的作业
                _Uptype3("1");
            }
            //17:00 type=3
           
        }
        public static void _Uptype3(string strtype)
        {
            String strnowdate = DateTime.Now.ToShortDateString().ToString();

           // String where = " in (select T_ID from T_USER_INFO where T_TYPE='3')";
            //and setTime<=getdate() and setTime>'"+ strnowdate + "'
            //开挖类
            String strUp1 = "update t_dongtaifengxian set flag='1' where flag='0' and DateDiff(dd,setTime,getdate())=0 and t_id in (select T_ID from T_USER_INFO where T_TYPE='"+ strtype + "')";
            WXDBUtility.SqlHelper.ExecuteSql(strUp1);

            //第三方
            String strUp2 = "update T_Dsan_xinzengshigong set flag='1' where flag='0' and DateDiff(dd,setTime,getdate())=0 and t_id in (select T_ID from T_USER_INFO where T_TYPE='" + strtype + "')";
            WXDBUtility.SqlHelper.ExecuteSql(strUp2);

            //第二方
            String strUp3 = "update t_DIER_shigong set flag='1' where flag='0' and DateDiff(dd,er_time,getdate())=0 and t_id in (select T_ID from T_USER_INFO where T_TYPE='" + strtype + "')";
            WXDBUtility.SqlHelper.ExecuteSql(strUp3);

            //高后果
            String strUp4 = "update t_ghgq_info set flag='1' where flag='0' and DateDiff(dd,g_time,getdate())=0 and g_tid in (select T_ID from T_USER_INFO where T_TYPE='" + strtype + "')";
            WXDBUtility.SqlHelper.ExecuteSql(strUp4);
            //巡护管理
            String strUp5 = "update t_xunhuguanli set flag='1' where flag='0' and DateDiff(dd,xh_time,getdate())=0 and xh_tid in (select T_ID from T_USER_INFO where T_TYPE='" + strtype + "')";
            WXDBUtility.SqlHelper.ExecuteSql(strUp5);
            //宣传走访
            String strUp6 = "update T_xuan_chuan_zou_fang set flag='1' where flag='0' and DateDiff(dd,setTime,getdate())=0 and t_id in (select T_ID from T_USER_INFO where T_TYPE='" + strtype + "')";
            WXDBUtility.SqlHelper.ExecuteSql(strUp6);
            //腐蚀控制
            String strUp7 = "update t_fushi set flag='1' where flag='0' and DateDiff(dd,fs_time,getdate())=0 and fs_tid in (select T_ID from T_USER_INFO where T_TYPE='" + strtype + "')";
            WXDBUtility.SqlHelper.ExecuteSql(strUp7);
            //防汛管理
            String strUp81 = "update t_fangxun set flag='1' where flag='0' and DateDiff(dd,f_time,getdate())=0 and fx_tid in (select T_ID from T_USER_INFO where T_TYPE='" + strtype + "')";
            WXDBUtility.SqlHelper.ExecuteSql(strUp81);
            //三桩费
            String strUp82 = "update t_sanzhuangfei set flag='1' where flag='0' and DateDiff(dd,s_time,getdate())=0 and s_tid in (select T_ID from T_USER_INFO where T_TYPE='" + strtype + "')";
            WXDBUtility.SqlHelper.ExecuteSql(strUp82);
            //光缆复测
            String strUp83 = "update t_guandao_glfc set flag='1' where flag='0' and DateDiff(dd,gd_time,getdate())=0 and gd_tid in (select T_ID from T_USER_INFO where T_TYPE='" + strtype + "')";
            WXDBUtility.SqlHelper.ExecuteSql(strUp83);
            //视频监控
            String strUp9 = "update t_shipinjiankong set flag='1' where flag='0' and DateDiff(dd,setTime,getdate())=0 and s_tid in (select T_ID from T_USER_INFO where T_TYPE='" + strtype + "')";
            WXDBUtility.SqlHelper.ExecuteSql(strUp9);
        }
    }
}