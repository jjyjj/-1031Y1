using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace MarketInfo.it
{
    public partial class it_xunhuguanli : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            _XHQK();
            _UPPOST();
            _UPdate();
        }
        public void _XHQK()
        {

            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTXH") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日
            //   $.post("../it/it_xunhuguanli.aspx?CMD=CURTXH&FLAG=" + type + "&JCQD=" +
         //jiancha_quduan + "&JCLC=" + jiancha_licheng + "&FXWT=" + faxian_wenti + "&WTGZ=" +
         //wenti_genzong + "&QT=" + qita, 
           
                StringBuilder strField = new StringBuilder();
                StringBuilder strValues = new StringBuilder();
                strField.Append("insert into t_xunhuguanli(");
                strValues.Append(") VALUES(");

                strField.Append("xh_zid");
                strValues.Append("'" + Session["CUR_ZID"].ToString()+ "',");
                strField.Append(",xh_zpid");
                strValues.Append("'" + Session["CUR_PZID"].ToString() + "',");
                strField.Append(",xh_tid");
                strValues.Append("'" + Session["CUR_TID"].ToString() + "',");
                strField.Append(",xh_xunxiangong_id");
                strValues.Append("'" + Request.QueryString["XXGID"] + "',");
                strField.Append(",xh_jiancha_quduan");
                strValues.Append("'" + Request.QueryString["JCQD"] + "',");
                strField.Append(",xh_jiancha_licheng");
                strValues.Append("'" + Request.QueryString["JCLC"] + "',");
                strField.Append(",xh_faxian_wenti");
                strValues.Append("'" + Request.QueryString["FXWT"] + "',");
                strField.Append(",xh_wenti_zhuizong");
                strValues.Append("'" + Request.QueryString["WTGZ"] + "',");
                strField.Append(",flag");
                strValues.Append("'" + Request.QueryString["FLAG"] + "',");
                strField.Append(",xh_qita");
                strValues.Append("'" + Request.QueryString["QT"] + "')");              

                strField.Append(strValues.ToString());
                String strInser = strField.ToString();
                int res2 = WXDBUtility.SqlHelper.ExecuteSql(strInser);
                if (res2 > 0)
                {
                    Response.Write("1");//成功
                //更新logo表，填写工作视为在线 2020-9-29  齐
                WXDBUtility.Updatelog.Uplgo(Session["CUR_TID"].ToString());
                return;
                }
                else
                {
                    Response.Write("-1");//失败
                    return;
                }
            
        }
        public void _UPdate() { 
        
         //  $.post("../it/it_xunhuguanli.aspx?CMD=CURTUPXH&FLAG=" + type + "&JCQD=" +
         //txtjcqd + "&JCLC=" + txtjclc + "&FXWT=" + txtfxwt + "&WTGZ=" +
         //txtwtgz + "&XXGID=" + xx_id + "&QT=" + txtqt, {}, function (data) {


         //    $.post("../it/it_xunhuguanli.aspx?CMD=CURTUPXH&XHID=" + id + "&FLAG=" + type + "&JCQD=" +
         //txtjcqd + "&JCLC=" + txtjclc + "&FXWT=" + txtfxwt + "&WTGZ=" +
         //txtwtgz + "&QT=" + txtqt, {}, function (data) {


            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTUPXH") return;
            StringBuilder UP_strSQL = new StringBuilder();
            UP_strSQL.Append("UPDATE t_xunhuguanli set ");

           // UP_strSQL.Append("xh_xunxiangong_id='" + Request.QueryString["XXGID"] + "',");
            UP_strSQL.Append("xh_jiancha_quduan='" + Request.QueryString["JCQD"] + "',");
            UP_strSQL.Append("xh_jiancha_licheng='" + Request.QueryString["JCLC"] + "',");
            UP_strSQL.Append("xh_faxian_wenti='" + Request.QueryString["FXWT"] + "',");
            UP_strSQL.Append("xh_wenti_zhuizong='" + Request.QueryString["WTGZ"] + "',");
            UP_strSQL.Append("xh_qita='" + Request.QueryString["QT"] + "',");
            UP_strSQL.Append("sp1='0',");
            UP_strSQL.Append("sp2='0',");
            UP_strSQL.Append("sprid1='0',");
            UP_strSQL.Append("sprid2='0',");

            UP_strSQL.Append("flag='" + Request.QueryString["FLAG"] + "'");
            UP_strSQL.Append(" where  xh_id='" + Request.QueryString["XHID"] + "'");
            String strUP_mySQL = UP_strSQL.ToString();

            int res = WXDBUtility.SqlHelper.ExecuteSql(strUP_mySQL);
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
        //XHPOST
        public void _UPPOST()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "XHPOST") return;
            //CURTID
            String strsql = "UPDATE t_xunhuguanli set flag='1',sp1='0',sp2='0',sprid1='0',sprid2='0',xh_time=='" + DateTime.Now + "' where xh_id='" + Request.QueryString["CURTID"] + "'";
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