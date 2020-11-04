using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace MarketInfo.it
{
    public partial class it_submint : System.Web.UI.Page
    {
        #region  11.3-jjy
        //主要是对 
        //_ISQJ();
        //_ISLX();
        //_ISXX();
        //_ISCG();
        //这四个方法的sql语句添加一个T_WNAME，因为数据库中有这个字段，但是请假/轮休流程中并没有插入这个字段，直接读取Sessionde中的name了
        #endregion
        //11.03
        public string strtype_n;
        public string strzid_n;
        public string strzpid_n;
        protected void Page_Load(object sender, EventArgs e)
        {
            //11.03
            strtype_n = Session["CUR_T_ID"].ToString();
            strzid_n = Session["CUR_ZID"].ToString();
            strzpid_n = Session["CUR_PZID"].ToString();
            _ISQJ();
            _ISLX();
            _ISXX();
            _ISCG();
            _GHGQ();
            _UPGHGQ();
            _UPDATEGGQ();

            _FXGL();
            _UPDATEFXGL();
        }

        public void _FXGL()
        {

            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTFXGL") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日

            if (Session["EDIT_ID"].ToString() != "" && Session["EDIT_ID"] != null)
            {
                StringBuilder UP_strSQL = new StringBuilder();
                UP_strSQL.Append("UPDATE t_fangxun set ");
                UP_strSQL.Append("fx_zhanchang='" + Request.QueryString["FZC"] + "',");
                UP_strSQL.Append("fx_xingzhengweizhi='" + Request.QueryString["FXZWZ"] + "',");
                UP_strSQL.Append("fx_zhongdianbuwei='" + Request.QueryString["FZDBW"] + "',");
                //String strData = WXDBUtility.DESHelper.Encrypt_DES(m_info.Value);//简介
                UP_strSQL.Append("fx_leixing='" + Request.QueryString["FLX"] + "',");
                UP_strSQL.Append("fx_bzxxgsfmtxj='" + Request.QueryString["FBZSF"] + "',");
                UP_strSQL.Append("fx_xxgxxjg='" + Request.QueryString["FJG"] + "',");
                UP_strSQL.Append("fx_bzxxglryxxdj='" + Request.QueryString["FDJ"] + "',");
                UP_strSQL.Append("fx_xxglryxxjg='" + Request.QueryString["FGLJG"] + "',");

                UP_strSQL.Append("fx_qkxxsm='" + Request.QueryString["FSM"] + "',");
                UP_strSQL.Append("fx_zzzx='" + Request.QueryString["FZZZX"] + "',");
                UP_strSQL.Append("fx_sswh='" + Request.QueryString["FSS"] + "',");
                UP_strSQL.Append("fx_qtbz='" + Request.QueryString["FQT"] + "',");
                UP_strSQL.Append("flag='" + Request.QueryString["FLAG"] + "'");
                UP_strSQL.Append(" where fx_tid='" + Session["CUR_TID"].ToString() + "' and fx_id='" + Session["EDIT_ID"] + "' and f_time='" + strnow + "'");
                String strUP_mySQL = UP_strSQL.ToString();

                int res = WXDBUtility.SqlHelper.ExecuteSql(strUP_mySQL);
                if (res > 0)
                {
                    Response.Write("111");//成功
                    Session["EDIT_ID"] = null;//EDIT_GID
                                              // String se = Session["EDIT_ID"].ToString();
                    Session.Remove("EDIT_ID");
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
                strField.Append("insert into t_fangxun(");
                strValues.Append(") VALUES(");

                strField.Append("fx_zhanchang");
                strValues.Append("'" + Request.QueryString["FZC"].Trim() + "',");
                strField.Append(",fx_xingzhengweizhi");
                strValues.Append("'" + Request.QueryString["FXZWZ"].Trim() + "',");
                strField.Append(",fx_zhongdianbuwei");
                strValues.Append("'" + Request.QueryString["FZDBW"] + "',");
                strField.Append(",fx_leixing");
                strValues.Append("'" + Request.QueryString["FLX"] + "',");
                strField.Append(",fx_bzxxgsfmtxj");
                strValues.Append("'" + Request.QueryString["FBZSF"] + "',");
                strField.Append(",fx_bzxxglryxxdj");
                strValues.Append("'" + Request.QueryString["FDJ"] + "',");
                strField.Append(",fx_qkxxsm");
                strValues.Append("'" + Request.QueryString["FSM"] + "',");
                strField.Append(",fx_zzzx");
                strValues.Append("'" + Request.QueryString["FZZZX"] + "',");
                strField.Append(",fx_sswh");
                strValues.Append("'" + Request.QueryString["FSS"] + "',");
                strField.Append(",fx_qtbz");
                strValues.Append("'" + Request.QueryString["FQT"] + "',");
                strField.Append(",flag");
                strValues.Append("'" + Request.QueryString["FLAG"] + "',");
                strField.Append(",fx_tid");
                strValues.Append("'" + Session["CUR_TID"].ToString() + "',");

                //11.3
                strField.Append(",ntype");
                strValues.Append("'" + strtype_n + "',");

                strField.Append(",zid");
                strValues.Append("'" + strzid_n + "',");

                strField.Append(",zpid");
                strValues.Append("'" + strzpid_n + "',");

                strField.Append(",f_time");
                strValues.Append("'" + strnow + "',");

                strField.Append(",fx_xxglryxxjg");
                strValues.Append("'" + Request.QueryString["FGLJG"] + "',");//巡线管理人员巡检结果
                strField.Append(",fx_xxgxxjg");
                strValues.Append("'" + Request.QueryString["FJG"].Trim() + "')");
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
        public void _GHGQ()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTGHGQ") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日


            String strInser = "insert into t_ghgq_info (g_tid,g_ggqbh,g_jinri_jiancha,g_faixian_went,g_wenti_genzong,g_xuanchuan_zoufang,g_yingji_yanlian,g_qita,ntype,zid,zpid,flag) VALUES('" + Session["CUR_TID"].ToString() + "','" + Request.QueryString["GGQBH"] + "','" + Request.QueryString["JRJC"]
                                            + "','" + Request.QueryString["FXWT"]
                                            + "','" + Request.QueryString["WTGZ"]
                                            + "','" + Request.QueryString["XCZF"]
                                             + "','" + Request.QueryString["YJYL"]
                                             + "','" + Request.QueryString["QT"]//GJRJCSL
                                                                                //11.03
                                              + "','" + strtype_n
                                               + "','" + strzid_n
                                                + "','" + strzpid_n

                                              + "','" + Request.QueryString["FLAG"] + "')";
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
            // }

        }


        //UPGHGQ
        public void _UPGHGQ()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "UPGHGQ") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日
            // $.post("../it/it_submint.aspx?CMD=CURTGHGQ&FLAG=" + type + "&GGQBH=" + ghgqbh + "&JRJC=" +
            //jinrijiancha + "&FXWT=" + gfaxianwenti + "&WTGZ=" + gwentigenzong + "&XCZF=" +
            //gxuanchuanzoufang + "&YJYL=" + yingjiyanlian + "&QT=" + qita, {}, function (data) {


            String strUp = "UPDATE t_ghgq_info set g_jinri_jiancha='" + Request.QueryString["JRJC"] + "',g_faixian_went='" + Request.QueryString["FXWT"]
                + "',g_wenti_genzong='" + Request.QueryString["WTGZ"] + "',g_xuanchuan_zoufang='" + Request.QueryString["XCZF"] + "',g_yingji_yanlian='" + Request.QueryString["YJYL"]
                + "',g_qita='" + Request.QueryString["QT"] + "',flag='" + Request.QueryString["FLAG"] + "'   where g_id='" + Request.QueryString["GID"] + "'";
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
            // }

        }
        //请假
        public void _ISQJ()
        {

            string strcmd = Request.QueryString["CMD"];
            var name = Session["U_LoginName"].ToString(); //jjy 11.3
            if (strcmd != "CURTQJ") return;
            String strSQL = "select  * from T_WORK_INFO1 where T_ID='" + Session["CUR_TID"] + "' AND  T_TYPEID='1' AND T_WSTART='" + Request.QueryString["START"] + "'  AND T_WEND='" + Request.QueryString["END"] + "' order by T_CRTIME desc";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null) { Response.Write("0"); return; }//已经申请，不要重复操作

            string path = "";
            if (Request.QueryString["PATH"] != "undefined")
            {
                path = "../QJfile/" + Request.QueryString["PATH"];//文件保存的路径
            }

            String strInser = "insert into T_WORK_INFO1 (T_TYPEID,T_WSTART,T_WEND,T_WRENSON,T_FLAG,T_ID,ntype,zid,zpid,T_WNAME,T_PATH) VALUES('1','" + Request.QueryString["START"]
                + "','" + Request.QueryString["END"]
                + "','" + Request.QueryString["REASON"]
                 + "','" + Request.QueryString["FLAG"]
                    //11.03

                    + "','" + Session["CUR_TID"]
                       + "','" + strtype_n
                           + "','" + strzid_n
                  + "','" + strzpid_n




                           + "','" + name//jjy
                + "','" + path + "')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strInser);
            if (res > 0)
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

        public void _ISLX()
        {
            //
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTLX") return;
            String strSQL = "select  * from T_WORK_INFO1 where T_ID='" + Session["CUR_TID"] + "' AND   T_TYPEID='2' AND T_WSTART='" + Request.QueryString["START"] + "'  AND T_WEND='" + Request.QueryString["END"] + "' order by T_CRTIME desc";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null) { Response.Write("0"); return; }//已经申请，不要重复操作
            String strInser = "insert into T_WORK_INFO1 (T_TYPEID,T_WSTART,T_WEND,T_FLAG,,ntype,zid,zpid,T_WNAME,T_ID) VALUES('2','" + Request.QueryString["START"]
                + "','" + Request.QueryString["END"]
                  + "','" + Request.QueryString["FLAG"]
                   //11.03
                   + "','" + strtype_n
                     + "','" + strzid_n
                       + "','" + strzpid_n
                        + "','" + Session["U_LoginName"].ToString() //11.3 jjy
                + "','" + Session["CUR_TID"] + "')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strInser);
            if (res > 0)
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

        public void _ISXX()
        {
            //
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTXXPX") return;
            String strSQL = "select  * from T_WORK_INFO1 where T_ID='" + Session["CUR_TID"] + "' AND   T_TYPEID='4' AND T_WSTART='" + Request.QueryString["START"] + "'  AND T_WEND='" + Request.QueryString["END"] + "' order by T_CRTIME desc";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null) { Response.Write("0"); return; }//已经申请，不要重复操作
            String strInser = "insert into T_WORK_INFO1 (T_TYPEID,T_WSTART,T_WEND,T_WRENSON,T_FLAG,T_WNAME,T_ID) VALUES('4','" + Request.QueryString["START"]
                + "','" + Request.QueryString["END"]
                 + "','" + Request.QueryString["REASON"]
                   + "','" + Request.QueryString["FLAG"]
                    + "','" + Session["U_LoginName"].ToString()//11.3 jjy
                + "','" + Session["CUR_TID"] + "')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strInser);
            if (res > 0)
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
        public void _ISCG()
        {
            //
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTCG") return;
            String strSQL = "select  * from T_WORK_INFO1 where T_ID='" + Session["CUR_TID"] + "' AND   T_TYPEID='3' AND T_WSTART='" + Request.QueryString["START"] + "'  AND T_WEND='" + Request.QueryString["END"] + "' order by T_CRTIME desc";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null) { Response.Write("0"); return; }//已经申请，不要重复操作
            String strInser = "insert into T_WORK_INFO1 (T_TYPEID,T_WSTART,T_WEND,T_WRENSON,T_FLAG,T_WNAME,T_ID) VALUES('3','" + Request.QueryString["START"]
                + "','" + Request.QueryString["END"]
                 + "','" + Request.QueryString["REASON"]
                   + "','" + Request.QueryString["FLAG"]
                    + "','" + Session["U_LoginName"].ToString()//11.3 jjy
                + "','" + Session["CUR_TID"] + "')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strInser);
            if (res > 0)
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
        public void _UPDATEGGQ()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "GGQPOST") return;
            //CURTID
            String strsql = "UPDATE t_ghgq_info set flag='1',sp1='0',sp2='0',sp3='0',sprid1='0',sprid2='0',sprid3='0' where g_id='" + Request.QueryString["CURTID"] + "'";
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
        public void _UPDATEFXGL()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "FXGLPOST") return;
            //CURTID
            String strsql = "UPDATE t_fangxun set flag='1',sp1='0',sp2='0',sp3='0',spid1='0',spid2='0',spid3='0' where fx_id='" + Request.QueryString["CURTID"] + "'";
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


        //FXGLPOST
    }
}