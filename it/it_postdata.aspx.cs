using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace MarketInfo.it
{
    public partial class it_postdata : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
             
            _UPPOSTGDGL();
            _GDGLFC();
        }
        //管道光缆复测
        public void _GDGLFC()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTGDFC") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日
            //11.03
            string strtype_n = Session["CUR_T_ID"].ToString();
            string strzid_n = Session["CUR_ZID"].ToString();
            string strzpid_n = Session["CUR_PZID"].ToString();
         //   $.post("../it/it_postdata.aspx?CMD=CURTGDFC&FLAG=" + type + "&XQGDLC=" +
         //xiaqu_gdlc + "&XQGLLC=" + xiaqu_gllc + "&JRFCGDLC=" + jinri_fcgdlc + "&JRFCGLLC=" +
         //jinri_fcgllc + "&FXWT=" + faxian_wt + "&FCLC=" + fuce_lc + "&FCJD=" +
         //fuce_jd,
            if (Session["EDIT_GDID"].ToString() != "" && Session["EDIT_GDID"] != null)
            {
                StringBuilder UP_strSQL = new StringBuilder();
                UP_strSQL.Append("UPDATE t_guandao_glfc set ");
                UP_strSQL.Append("gd_xiaqu_gdlc='" + Request.QueryString["XQGDLC"] + "',");
                UP_strSQL.Append("gd_xiaqu_gllc='" + Request.QueryString["XQGLLC"] + "',");
                UP_strSQL.Append("gd_jinri_fcgdlc='" + Request.QueryString["JRFCGDLC"] + "',");

                UP_strSQL.Append("gd_jinri_fcgllc='" + Request.QueryString["JRFCGLLC"] + "',");
                UP_strSQL.Append("gd_faxian_wt='" + Request.QueryString["FXWT"] + "',");

                //gd_faxian_wt
                UP_strSQL.Append("gd_fuce_lc='" + Request.QueryString["FCLC"] + "',");
                UP_strSQL.Append("gd_fuce_jd='" + Request.QueryString["FCJD"] + "',");

                UP_strSQL.Append("flag='" + Request.QueryString["FLAG"] + "'");
                UP_strSQL.Append("gd_wt='" + Request.QueryString["WT"] + "'");
                UP_strSQL.Append("gd_fh='" + Request.QueryString["FH"] + "'");
                UP_strSQL.Append(" where gd_tid='" + Session["CUR_TID"].ToString() + "' and gd_id='" + Session["EDIT_GDID"] + "' and gd_time='" + strnow + "'");
                String strUP_mySQL = UP_strSQL.ToString();

                int res = WXDBUtility.SqlHelper.ExecuteSql(strUP_mySQL);
                if (res > 0)
                {
                    Response.Write("111");//成功
                    Session["EDIT_FSID"] = null;
                    Session.Remove("EDIT_FSID");
                    //string sc = Session["EDIT_XHID"].ToString();

                    return;
                }
                else
                {
                    Response.Write("-111");//失败
                    return;
                }

            }
            else
            {

                StringBuilder strField = new StringBuilder();
                StringBuilder strValues = new StringBuilder();
                strField.Append("insert into t_guandao_glfc(");
                strValues.Append(") VALUES(");

                strField.Append("gd_xiaqu_gdlc");
                strValues.Append("'" + Request.QueryString["XQGDLC"].Trim() + "',");
                strField.Append(",gd_xiaqu_gllc");
                strValues.Append("'" + Request.QueryString["XQGLLC"].Trim() + "',");
                strField.Append(",gd_jinri_fcgdlc");
                strValues.Append("'" + Request.QueryString["JRFCGDLC"] + "',");
                strField.Append(",gd_jinri_fcgllc");
                strValues.Append("'" + Request.QueryString["JRFCGLLC"] + "',");


                strField.Append(",gd_faxian_wt");
                strValues.Append("'" + Request.QueryString["FXWT"] + "',");




                strField.Append(",gd_fuce_lc");
                strValues.Append("'" + Request.QueryString["FCLC"] + "',");

                strField.Append(",gd_fuce_jd");
                strValues.Append("'" + Request.QueryString["FCJD"] + "',");

                strField.Append(",gd_wt");
                strValues.Append("'" + Request.QueryString["WT"] + "',");

                strField.Append(",gd_fh");
                strValues.Append("'" + Request.QueryString["FH"] + "',");

                strField.Append(",flag");
                strValues.Append("'" + Request.QueryString["FLAG"] + "',");
                strField.Append(",gd_tid");
                strValues.Append("'" + Session["CUR_TID"].ToString() + "',");

                //11.03
                strField.Append(",ntype");
                strValues.Append("'" + strtype_n + "',");

                strField.Append(",zid");
                strValues.Append("'" + strzid_n + "',");

                strField.Append(",zpid");
                strValues.Append("'" + strzpid_n + "',");


                strField.Append(",gd_time");
                strValues.Append("'" + strnow + "')");

              
     


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
        }
        //管道光缆复测
        public void _UPPOSTGDGL()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "GDFCPOST") return;
            //CURTID
            String strsql = "UPDATE t_guandao_glfc set flag='1',sp1='0',sp2='0',sp3='0',spid1='0',spid2='0',spid3='0' where gd_id='" + Request.QueryString["CURTID"] + "'";
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