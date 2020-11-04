using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_shenpi
{
    public partial class xiuJiaShenPiList : System.Web.UI.Page
    {
        public DataTable tb = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            _Getdata();
        }
        public void _Getdata()
        {
            //查询站长下边员工的请假信息（已提交） 1 提交 0 暂存
            string Strsql = "SELECT* FROM T_WORK_INFO1 ,T_USER_INFO WHERE T_WORK_INFO1.T_ID in (SELECT T_USER_INFO.T_ID from T_USER_INFO WHERE ZPID = " + Int32.Parse(Session["CUR_ZID"].ToString()) + ") AND T_FLAG = 2 AND T_USER_INFO.T_ID = T_WORK_INFO1.T_ID ORDER BY T_WORK_INFO1.T_CRTIME DESC";

            tb = WXDBUtility.SqlHelper.GetDataTable(Strsql);
        }
        #region MyRegion
        public class ResultModel
        {
            public DataRow UserModel { get; set; } = null;
            public DataTable QingJiaModel { get; set; } = null;

        }
        //public class UserModel
        //{
        //    public int T_ID { get; set; }
        //    public string T_UNAME { get; set; }
        //    public int ZID { get; set; }//
        //    public int ZPID { get; set; }//所属站长ID
        //    public int T_TYPE { get; set; }//用户类型 0 管理员 1区长 2站长 3下属
        //}
        //public class QingJiaModel
        //{
        //    public int T_WID { get; set; }
        //    public int T_TYPEID { get; set; }//请假类型 1休假 2 轮休
        //    public string T_WSTART { get; set; }//开始时间
        //    public string T_WEND { get; set; }//结束时间
        //    public int T_ID { get; set; }// 员工Id
        //    public int T_FLAG { get; set; }//请假状态 1 提交 0 暂存
        //    public DateTime T_CRTIME { get; set; }//提交时间
        //    public string T_PATH { get; set; }//附件路径
        //}
        #endregion

    }
}