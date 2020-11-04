using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz
{
    public partial class wd_spjk : System.Web.UI.Page
    {
          public DataTable gtb;
          public DataTable tb = null;
          public DataTable tbzc = null;
          public DataTable tbyc = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            string str = string.Empty ;
            if (Session["CUR_TID"] != null) {
                str = Session["CUR_TID"].ToString();
            }
            //绑定显示默认值
            _GetGData();
            //绑定本人负责的监控
            _BindData();
            //绑定暂存的数据
            _BindDataZC();
            _BindDataYC();
          //string str=  Session["CUR_TID"].ToString();
           
        }
          public void _GetGData()
        {
            //  t_shipinjiankong
            String strSel = "";
           // Session["CUR_TID"] = "";
            if (Request.QueryString["EDIT_GID"] != "" && Request.QueryString["EDIT_GID"] != null)
            {
                Session["EDIT_GID"] = Request.QueryString["EDIT_GID"].ToString();
                strSel = "select  * from t_shipinjiankong where s_id='" + Request.QueryString["EDIT_GID"] + "' ";
            }//年月日
            else
            {
                strSel = "select top 1 * from t_shipinjiankong   order by s_id DESC ";
            }

            //,flag='" + Request.QueryString["flag"] + "'
         
          
            gtb = WXDBUtility.SqlHelper.GetDataTable(strSel);
            if (gtb == null) return;
            if (Session["CUR_T_ID"].ToString() == "2")
            {
                String sql = "select zname from T_ZYQ_INFO where zid='" + Session["CUR_ZID"].ToString() + "'";
                DataTable tb = WXDBUtility.SqlHelper.GetDataTable(sql);
                if (tb != null)
                {
                    this.zhanming.Value = tb.Rows[0]["zname"].ToString();
                    this.zm.Value = tb.Rows[0]["zname"].ToString();
                }
            }
            if (Session["CUR_T_ID"].ToString() == "3")
            {
                String sql = "select zname from T_ZYQ_INFO where zid='" + Session["CUR_PZID"].ToString() + "'";
                DataTable tb = WXDBUtility.SqlHelper.GetDataTable(sql);
                if (tb != null)
                {
                    this.zhanming.Value = tb.Rows[0]["zname"].ToString();
                }
            }
          //  this.zhanming.Value = gtb.Rows[0]["s_zhanming"].ToString();// 站名
            this.anzhuangweizhi.Value = gtb.Rows[0]["s_anzhuangwz"].ToString();//安装位置
            this.xmgcqc.Value = gtb.Rows[0]["s_xmgcqc"].ToString();//项目工程全称

            this.sfzcsy.Value = gtb.Rows[0]["s_shifouzc"].ToString();//是否正常使用
            this.uid.Value = gtb.Rows[0]["s_uid"].ToString();//uid码

            this.pzdw.Value = gtb.Rows[0]["s_pzdw"].ToString();//配置单位
            this.beizhu.InnerText = gtb.Rows[0]["s_beizhu"].ToString();//备注
            this.whqk.Value = gtb.Rows[0]["s_whqk"].ToString();//备注

    
        }


          public void _BindData()
          {

             
              String strSel = "select *   from t_shipinjiankong where s_tid='" + Session["CUR_TID"] + "'";
              tb = WXDBUtility.SqlHelper.GetDataTable(strSel);

              if (tb == null)
              {
                  String strSel1 = "select * s_id  from t_shipinjiankong where s_tid='" + Session["CUR_TID"] + "' ";
                  tb = WXDBUtility.SqlHelper.GetDataTable(strSel1);

              }
          }


          public void _BindDataZC()
          {


              String strSel = "select *   from t_shipinjiankong where s_tid='" + Session["CUR_TID"] + "' and flag='0' order by s_id DESC";
              tbzc = WXDBUtility.SqlHelper.GetDataTable(strSel);
          }

          public void _BindDataYC()
          {


              String strSel = "select *   from t_shipinjiankong where s_tid='" + Session["CUR_TID"] + "' and flag='1'";
              tbyc = WXDBUtility.SqlHelper.GetDataTable(strSel);
          }

          //public void _SPJK()
          //{
          //    // t_shipinjiankong
          //    //    $.post("../it/it_submint.aspx?CMD=CURTGHGQ&FLAG=" + type + "&GZC=" +
          //    //gzhanchang + "&GBH=" + strbianhao + "&GXZQY=" + strquyuu  + "&GSL=" + 
          //    //strshu   + "&GJRJCSL=" + strjcshu   + "&GXCZF=" + strzfshu    + "&GZFRC=" + 
          //    //strzfrc     + "&GYLQK=" + stryanlian    + "&GFXWT=" + strwenti+ "&GCD=" + strchangdu , {}, function (data) {
          //    string strcmd = Request.QueryString["CMD"];
          //    if (strcmd != "SPJK") return;
          //    String strSQL = "select  * from t_shipinjiankong where s_tid='" + Session["CUR_TID"] + "'";
          //    DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
          //    if (tb != null)
          //    {
          //        String strflag = tb.Rows[0]["flag"].ToString();
          //        if (strflag == "1")
          //        {
          //            Response.Write("0"); return;//已经提交，不能修改
          //        }
          //        if (strflag == "0")
          //        {


          //            String strUp = "UPDATE t_shipinjiankong set s_zhanming='" + Request.QueryString["GZC"] + "',s_anzhuanglujing='" + Request.QueryString["GBH"]
          //                + "',s_xmgcqc='" + Request.QueryString["GXZQY"] + "',ss-shifouzc='" + Request.QueryString["GSL"] + "',s_uid='" + Request.QueryString["GJRJCSL"]
          //                + "',s_pzdw='" + Request.QueryString["GXCZF"] + "',flag='" + Request.QueryString["GZFRC"] + "', where w_tid='" + Session["CUR_TID"] + "'";
          //            int res = WXDBUtility.SqlHelper.ExecuteSql(strUp);
          //            if (res > 0)
          //            {
          //                Response.Write("11");//成功
          //                return;
          //            }
          //            else
          //            {
          //                Response.Write("-11");//失败
          //                return;
          //            }


          //            // _Update();
          //        }
          //    }
          //    String strInser = "insert into t_shipinjiankong (s_zhanming,s_anzhuanglujing,s_xmgcqc,s_shifouzc,s_uid,s_pzdw,flag) VALUES('" + Request.QueryString["GZC"]
          //                                + "','" + Request.QueryString["GBH"]
          //                                + "','" + Request.QueryString["GXZQY"]

          //                                 + "','" + Request.QueryString["GSL"]
          //                                 + "','" + Request.QueryString["GJRJCSL"]//GJRJCSL
          //                                  + "','" + Request.QueryString["GXCZF"]
          //                                   + "','" + Request.QueryString["GZFRC"]
          //                                    + "','" + Session["CUR_TID"]// 
          //                                + "',)";
          //    int res2 = WXDBUtility.SqlHelper.ExecuteSql(strInser);
          //    if (res2 > 0)
          //    {
          //        Response.Write("1");//成功
          //        return;
          //    }
          //    else
          //    {
          //        Response.Write("-1");//失败
          //        return;
          //    }

          //}

    
    }
}