using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace MarketInfo.it
{
    public partial class it_disan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            _DSFSG();
            _KWZYXG();
            _UPDATEZZWH();
        }
        //自主维护作业新增
        public void _DSFSG()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTDSFSG") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日
         //    $.post("../it/it_disan.aspx?CMD=CURTDSFSG&FLAG=" + type + "&SGSL=" +
         //shigong_sl + "&XMMC=" + xiangmu_mc + "&ZYWZ=" + zuoye_wz + "&JRXZSL=" + jinri_xzsl + "&XCQK=" + jinri_jcxcqk + "&QTBZ=" + qtbz, {}, function (data) {
             

            StringBuilder strField = new StringBuilder();
            StringBuilder strValues = new StringBuilder();
            strField.Append("insert into t_disanfang(");
            strValues.Append(") VALUES(");

            strField.Append("d_shigong_sl");
            strValues.Append("'" + Request.QueryString["SGSL"].Trim() + "',");
            strField.Append(",d_xiangmu_mc");
            strValues.Append("'" + Request.QueryString["XMMC"].Trim() + "',");
            strField.Append(",d_zuoye_wz");
            strValues.Append("'" + Request.QueryString["ZYWZ"].Trim() + "',");

            strField.Append(",d_jinri_xzsl");
            strValues.Append("'" + Request.QueryString["JRXZSL"].Trim() + "',");
            strField.Append(",d_jinri_jcxcqk");
            strValues.Append("'" + Request.QueryString["XCQK"].Trim() + "',");
            strField.Append(",d_qtbz");
            strValues.Append("'" + Request.QueryString["QTBZ"].Trim() + "',");


            strField.Append(",flag");
            strValues.Append("'" + Request.QueryString["FLAG"] + "',");
            strField.Append(",d_tid");
            strValues.Append("'" + Session["CUR_TID"].ToString() + "',");
            strField.Append(",d_time");
            strValues.Append("'" + strnow + "')");


            strField.Append(strValues.ToString());
            String strInser = strField.ToString();
            int res2 = WXDBUtility.SqlHelper.ExecuteSql(strInser);
            if (res2 > 0)
            {
                Response.Write("1");//成功
                return;
            }
            else
            {
                Response.Write("-1");//失败
                return;
            }

        }

        //自主维护作业修改
        public void _KWZYXG()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "XGDSFSG") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日
         //    $.post("../it/it_disan.aspx?CMD=XGDSFSG&FLAG=" + type + "&DID=" + id + "&SGSL=" +
         //shigong_sl + "&XMMC=" + xiangmu_mc + "&ZYWZ=" + zuoye_wz + "&JRXZSL=" + jinri_xzsl + "&XCQK=" + jinri_jcxcqk + "&QTBZ=" + qtbz, {}, function (data) {
             

            StringBuilder UP_strSQL = new StringBuilder();
            UP_strSQL.Append("UPDATE t_disanfang set ");
            UP_strSQL.Append("d_shigong_sl='" + Request.QueryString["SGSL"] + "',");
            UP_strSQL.Append("d_xiangmu_mc='" + Request.QueryString["XMMC"] + "',");

            UP_strSQL.Append("d_zuoye_wz='" + Request.QueryString["ZYWZ"] + "',");
            UP_strSQL.Append("d_jinri_xzsl='" + Request.QueryString["JRXZSL"] + "',");
            UP_strSQL.Append("d_jinri_jcxcqk='" + Request.QueryString["XCQK"] + "',");
            UP_strSQL.Append("d_qtbz='" + Request.QueryString["QTBZ"] + "',");
            UP_strSQL.Append("d_time='" + strnow + "',");

            UP_strSQL.Append("flag='" + Request.QueryString["FLAG"] + "'");
            UP_strSQL.Append(" where d_tid='" + Session["CUR_TID"].ToString() + "' and d_id='" + Request.QueryString["DID"] + "' ");
            String strUP_mySQL = UP_strSQL.ToString();

            int res2 = WXDBUtility.SqlHelper.ExecuteSql(strUP_mySQL);
            if (res2 > 0)
            {
                Response.Write("1");//成功
                return;
            }
            else
            {
                Response.Write("-1");//失败
                return;
            }

        }

        //提交自主维护作业ZZWHPOST

        public void _UPDATEZZWH()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "DSFPOST") return;
            //CURTID
            String strsql = "UPDATE t_disanfang set flag='1' where d_id='" + Request.QueryString["EDIT_DID"] + "'";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strsql);
            if (res > 0)
            {
                Response.Write("1");//成功
                return;
            }
            else
            {
                Response.Write("-1");//失败
                return;
            }
        }
    }
}