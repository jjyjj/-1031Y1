using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.it
{
    public partial class spjk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            _SPJK();
            _SPJKUPDATE();


            _SPJKTJ();

        }


        public void _SPJK()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "SPJK") return;
                //    String strUp = "UPDATE t_shipinjiankong set s_zhanming='" + Request.QueryString["GZC"] + "',s_anzhuangwz='" + Request.QueryString["GBH"]
                //        + "',s_xmgcqc='" + Request.QueryString["GXZQY"] + "',s_shifouzc='" + Request.QueryString["GSL"] + "',s_uid='" + Request.QueryString["GJRJCSL"]
                //        + "',s_pzdw='" + Request.QueryString["GXCZF"] + "',flag='1',s_beizhu='" + Request.QueryString["GZFRC"] + "',s_whqk='" + Request.QueryString["whqk"] + "' where s_tid='" + Session["CUR_TID"] + "'and s_zhanming='" + Request.QueryString["GZC"]
                //+ "'and s_anzhuangwz='" + Request.QueryString["GBH"] + "'and s_xmgcqc='" + Request.QueryString["GXZQY"] + "'and s_shifouzc='"
                //+ Request.QueryString["GSL"] + "'and s_uid='" + Request.QueryString["GJRJCSL"] + "'and s_pzdw='" + Request.QueryString["GXCZF"] + "'";
                //    int res = WXDBUtility.SqlHelper.ExecuteSql(strUp);
                //    if (res > 0)
                //    {
                //        Response.Write("1");//成功

                //        return;

                //    }
                //    else
                //    {
                //        Response.Write("-1");//失败 
                //        return;
                //    }
          
            String strInser = "insert into t_shipinjiankong (s_tid,s_zhanming,s_anzhuangwz,s_xmgcqc,s_shifouzc,s_uid,s_pzdw,flag,s_beizhu,s_whqk) VALUES('" + Session["CUR_TID"]
                                             + "','" + Request.QueryString["GZC"]
                                        + "','" + Request.QueryString["GBH"]
                                        + "','" + Request.QueryString["GXZQY"]

                                         + "','" + Request.QueryString["GSL"]
                                         + "','" + Request.QueryString["GJRJCSL"]//GJRJCSL
                                          + "','" + Request.QueryString["GXCZF"]
                                           + "','" + Request.QueryString["flag"] + "','" + Request.QueryString["GZFRC"]               
                                        + "','" + Request.QueryString["whqk"] + "')";
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

        public void _SPJKUPDATE() {

            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "UPDATESPJK") return;

        //     $.post("../it/spjk.aspx?CMD=UPDATESPJK&AZWZ=" + strweizhi + "&XMQC=" + strxmqc + "&SFZC=" + strsfzc + "&UID=" +
        //struid + "&PZDW=" + strpzdw + "&WHQK=" + strwhqk + "&BZ=" +
        // strbeizhu + "&flag=" +
        // type + "&ID=" +
        // id, 



            String strUp = "UPDATE t_shipinjiankong set sp1='0',spid1='0',sp2='0',spid2='0',sp3='0',spid3='0', s_anzhuangwz='" + Request.QueryString["AZWZ"]
                + "',s_xmgcqc='" + Request.QueryString["XMQC"] + "',s_shifouzc='" + Request.QueryString["SFZC"] + "',s_uid='" + Request.QueryString["UID"]
                + "',s_pzdw='" + Request.QueryString["PZDW"] + "',flag='" + Request.QueryString["flag"] + "',s_beizhu='" + Request.QueryString["BZ"] + "',s_whqk='" + Request.QueryString["WHQK"] + "' where  s_id='" + Request.QueryString["ID"]
        + "'";
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
        public void _SPJKTJ()
        {
            // t_shipinjiankong

            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "SPJKTJ") return;
            String strsql = "UPDATE t_shipinjiankong set flag='1',sp1='0',spid1='0',sp2='0',spid2='0',sp3='0',spid3='0' where s_id='" + Request.QueryString["s_id"] + "'";
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