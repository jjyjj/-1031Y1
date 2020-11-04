using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.it
{
    public partial class it_szff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            _SPJK();
            _SPJKZC();
            _SPJKTJ();

           // _UPdate();
        }

        
        public void _SPJK()
        {
            String strnow;
            // t_wbxt
            //    $.post("../it/it_submint.aspx?CMD=CURTGHGQ&FLAG=" + type + "&GZC=" +
            //gzhanchang + "&GBH=" + strbianhao + "&GXZQY=" + strquyuu  + "&GSL=" + 
            //strshu   + "&GJRJCSL=" + strjcshu   + "&GXCZF=" + strzfshu    + "&GZFRC=" + 
            //strzfrc     + "&GYLQK=" + stryanlian    + "&GFXWT=" + strwenti+ "&GCD=" + strchangdu , {}, function (data) {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "SPJK") return;



            String strSQL = "select * from t_sanzhuangfei where s_tid='" + Session["CUR_TID"] + "'and s_jinri_ff='" + Request.QueryString["GZC"]
        + "'and s_xiaqu_yf='" + Request.QueryString["GBH"] + "'and s_jd='" + Request.QueryString["GXZQY"] + "'and flag='" + Request.QueryString["flag"] +
        "'and s_bz='" + Request.QueryString["GLS"] + "'";
           


            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null)
            {
                String strflag = tb.Rows[0]["flag"].ToString();
                if (strflag == "1")
                {
                    Response.Write("0"); return;//已经提交，不能修改
                }
                if (strflag == "0")
                {

                    strnow = DateTime.Now.ToLocalTime().ToString(); 

                    String strUp = "UPDATE t_sanzhuangfei set s_jinri_ff='" + Request.QueryString["GZC"] + "',s_xiaqu_yf='" + Request.QueryString["GBH"]
                        + "',s_jd='" + Request.QueryString["GXZQY"] + "',flag='1',s_time='"+strnow+"',s_bz='" + Request.QueryString["GLS"] + "' where s_tid='" + Session["CUR_TID"] + "' and s_id='" + Session["EDIT_GID"] + "'";
                    int res = WXDBUtility.SqlHelper.ExecuteSql(strUp);
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


                    // _Update();
                }
            }
            // t_wbxt
          strnow = DateTime.Now.ToLocalTime().ToString(); 
            String strInser = "insert into t_sanzhuangfei (s_tid,s_jinri_ff,s_xiaqu_yf,s_jd,s_bz,flag,s_time) VALUES('" + Session["CUR_TID"]
                                               + "','" + Request.QueryString["GZC"]
                                          + "','" + Request.QueryString["GBH"]
                                          + "','" + Request.QueryString["GXZQY"]
                                            + "','" + Request.QueryString["GSL"]

                                           + "','1','" + strnow + "')";
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

        public void _SPJKZC()
        {
            string strcmd = Request.QueryString["CMD"];

            if (strcmd != "SPJKZC") return;
            String strnow;

            String strSQL = "select * from t_sanzhuangfei where s_tid='" + Session["CUR_TID"] + "'and s_jinri_ff='" + Request.QueryString["GZC"]
              + "'and s_xiaqu_yf='" + Request.QueryString["GBH"] + "'and s_jd='" + Request.QueryString["GXZQY"] + "'and flag='" + Request.QueryString["flag"] + "'and s_bz='" + Request.QueryString["GLS"] + "'";

            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null)
            {

                String strflag = tb.Rows[0]["flag"].ToString();
                if (strflag == "1")
                {
                    Response.Write("-1"); return;//已经提交，不能修改
                }
                if (strflag == "0")
                {
                   strnow = DateTime.Now.ToLocalTime().ToString(); 
                    String strUp = "UPDATE t_sanzhuangfei set s_jinri_ff='" + Request.QueryString["GZC"] + "',s_xiaqu_yf='" + Request.QueryString["GBH"]
                      + "',s_jd='" + Request.QueryString["GXZQY"] + "',flag='0',s_time='" + strnow + "',s_bz='" + Request.QueryString["GLS"] + "'  where s_tid='" + Session["CUR_TID"] + "' and s_id='" + Session["EDIT_GID"] + "'";
                    int res = WXDBUtility.SqlHelper.ExecuteSql(strUp);
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
             strnow = DateTime.Now.ToLocalTime().ToString(); 
            String strInser = "insert into t_sanzhuangfei (s_tid,s_jinri_ff,s_xiaqu_yf,s_jd,s_bz,flag,s_time) VALUES('" + Session["CUR_TID"]
                                               + "','" + Request.QueryString["GZC"]
                                          + "','" + Request.QueryString["GBH"]
                                          + "','" + Request.QueryString["GXZQY"]
                                            + "','" + Request.QueryString["GSL"]

                                           + "','0','" + DateTime.Now + "')";
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



        public void _SPJKTJ()
        {
            // t_shipinjiankong

            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "SPJKTJ") return;
            String strsql = "UPDATE t_sanzhuangfei set flag='1',s_time='" + DateTime.Now + "' where s_id='" + Request.QueryString["s_id"] + "'";
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