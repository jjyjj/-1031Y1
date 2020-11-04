using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace MarketInfo.it
{
    public partial class it_post : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
          
            _XHQK();
            _UPDATEXHQK();
            _UPPOSTSZ();
            _SZFFF();

            _UPPOSTZL();
            _ZLZL();

            _UPPOSTQT();
            _QTGZ();

            //CURTFSKZ
            _FSKZ();
            _UPPOSTFS();


            _Updatefskz();

        }
       
        //腐蚀控制
        public void _FSKZ()
        {

            string strcmd = Request.QueryString["CMD"];
            string strtype_n = Session["CUR_T_ID"].ToString();
            string strzid_n = Session["CUR_ZID"].ToString();
            string strzpid_n = Session["CUR_PZID"].ToString();
            if (strcmd != "CURTFSKZ") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日         
                StringBuilder strField = new StringBuilder();
                StringBuilder strValues = new StringBuilder();
                strField.Append("insert into t_fushi(");
                strValues.Append(") VALUES(");

                strField.Append("fs_guzhang_cl");
                strValues.Append("'" + Request.QueryString["FGZCL"].Trim() + "',");
                strField.Append(",fs_shebei_tz");
                strValues.Append("'" + Request.QueryString["FSBTZ"].Trim() + "',");
                strField.Append(",fs_dingqi_cs");
                strValues.Append("'" + Request.QueryString["FDQCS"] + "',");
                strField.Append(",fs_bz");
                strValues.Append("'" + Request.QueryString["FBZ"] + "',");

                strField.Append(",fs_zhuanghao");
                strValues.Append("'" + Request.QueryString["ZH"] + "',");
                strField.Append(",fs_xingzheng_weizhi");
                strValues.Append("'" + Request.QueryString["XZWZ"].ToString() + "',");


                strField.Append(",flag");
                strValues.Append("'" + Request.QueryString["FLAG"] + "',");
                strField.Append(",fs_tid");
                strValues.Append("'" + Session["CUR_TID"].ToString() + "',");

            //11.03
                strField.Append(",ntype");
                strValues.Append("'" + strtype_n  + "',");

                strField.Append(",zid");
                strValues.Append("'" +strzid_n + "',");

                strField.Append(",zpid");
                strValues.Append("'" + strzpid_n + "',");

                strField.Append(",fs_time");
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
            //}
        }
        //腐蚀控制更新
        public void _Updatefskz()
        {

         //    $.post("../it/it_post.aspx?CMD=UPDATFSKZ&FLAG=" + type + "&FGZCL=" +
         //guzhang_cl + "&FSBTZ=" + shebei_tz + "&FDQCS=" + dingqi_cs + "&FBZ=" +
         //strqt, {}, function (data) {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "UPDATFSKZ") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日

            StringBuilder UP_strSQL = new StringBuilder();
            UP_strSQL.Append("UPDATE t_fushi set ");
            UP_strSQL.Append("fs_guzhang_cl='" + Request.QueryString["FGZCL"] + "',");
            UP_strSQL.Append("fs_shebei_tz='" + Request.QueryString["FSBTZ"] + "',");
            UP_strSQL.Append("fs_dingqi_cs='" + Request.QueryString["FDQCS"] + "',");


            UP_strSQL.Append("fs_zhuanghao='" + Request.QueryString["ZH"] + "',");
            UP_strSQL.Append("fs_xingzheng_weizhi='" + Request.QueryString["WZ"] + "',");


            UP_strSQL.Append("sp1='0',");
            UP_strSQL.Append("sp2='0',");
            UP_strSQL.Append("spid1='0',");
            UP_strSQL.Append("spid2='0',");

            
            UP_strSQL.Append("fs_bz='" + Request.QueryString["FBZ"] + "',");
            UP_strSQL.Append("flag='" + Request.QueryString["FLAG"] + "'");
            UP_strSQL.Append(" where fs_tid='" + Session["CUR_TID"].ToString() + "' and fs_id='" + Request.QueryString["FSID"] + "' and fs_time='" + strnow + "'");
            String strUP_mySQL = UP_strSQL.ToString();

            int res = WXDBUtility.SqlHelper.ExecuteSql(strUP_mySQL);
            if (res > 0)
            {
                Response.Write("1");//成功
                Session["EDIT_FSID"] = null;
                //Session["EDIT_FSID"].ToString() = "";
                Session.Remove("EDIT_FSID");
                // string sc = Session["EDIT_FSID"].ToString();

                return;
            }
            else
            {
                Response.Write("-1");//失败
                return;
            }


        }

      
        public void _XHQK()
        {

            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTXH") return;
            string strtype_n = Session["CUR_T_ID"].ToString();
            string strzid_n = Session["CUR_ZID"].ToString();
            string strzpid_n = Session["CUR_PZID"].ToString();
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日
         //    $.post("../it/it_post.aspx.aspx?CMD=CURTXH&FLAG=" + type + "&XCZ=" +
         //changzhan + "&XZGZZ=" + zhuguan_zz + "&XLXGLY=" + xianlu_gl + "&XBH=" +
         //bianhao + "&XCBXXG=" + chengbao_xxg + "&XQDXZQY=" + qidian_xzqy + "&XZH=" +
         //zhuanghao + "&XZDXZQY=" + zhongdian_xzqy + "&XLC=" + licheng + "&XXHXZQY=" + xunhu_xzqy + "&XXHLC=" + xunhu_lc + "&XBZ=" + beizhu, {}, function (data) {
            string s = Session["EDIT_XHID"].ToString();
            if (Session["EDIT_XHID"].ToString() != "" && Session["EDIT_XHID"] != null)
            {
                StringBuilder UP_strSQL = new StringBuilder();
                UP_strSQL.Append("UPDATE t_xunhu set ");
                UP_strSQL.Append("x_changzhan='" + Request.QueryString["XCZ"] + "',");
                UP_strSQL.Append("x_zhuguan_zz='" + Request.QueryString["XZGZZ"] + "',");
                UP_strSQL.Append("x_xianlu_gl='" + Request.QueryString["XLXGLY"] + "',");
                //String strData = WXDBUtility.DESHelper.Encrypt_DES(m_info.Value);//简介
                UP_strSQL.Append("x_bianhao='" + Request.QueryString["XBH"] + "',");
                UP_strSQL.Append("x_chengbao_xxg='" + Request.QueryString["XCBXXG"] + "',");
                UP_strSQL.Append("x_qidian_xzqy='" + Request.QueryString["XQDXZQY"] + "',");
                UP_strSQL.Append("x_zhuanghao='" + Request.QueryString["XZH"] + "',");
                UP_strSQL.Append("x_zhongdian_xzqy='" + Request.QueryString["XZDXZQY"] + "',");

                UP_strSQL.Append("x_licheng='" + Request.QueryString["XLC"] + "',");
                UP_strSQL.Append("x_xunhu_xzqy='" + Request.QueryString["XXHXZQY"] + "',");
                UP_strSQL.Append("x_xunhu_lc='" + Request.QueryString["XXHLC"] + "',");
                UP_strSQL.Append("x_beizhu='" + Request.QueryString["XBZ"] + "',");
                UP_strSQL.Append("flag='" + Request.QueryString["FLAG"] + "'");
                UP_strSQL.Append(" where x_tid='" + Session["CUR_TID"].ToString() + "' and x_id='" + Session["EDIT_XHID"] + "' and x_time='" + strnow + "'");
                String strUP_mySQL = UP_strSQL.ToString();

                int res = WXDBUtility.SqlHelper.ExecuteSql(strUP_mySQL);
                if (res > 0)
                {
                    Response.Write("111");//成功
                    Session["EDIT_XHID"] = null;
                    Session.Remove("EDIT_XHID");
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
                strField.Append("insert into t_xunhu(");
                strValues.Append(") VALUES(");

                strField.Append("x_changzhan");
                strValues.Append("'" + Request.QueryString["XCZ"].Trim() + "',");
                strField.Append(",x_zhuguan_zz");
                strValues.Append("'" + Request.QueryString["XZGZZ"].Trim() + "',");
                strField.Append(",x_xianlu_gl");
                strValues.Append("'" + Request.QueryString["XLXGLY"] + "',");
                strField.Append(",x_bianhao");
                strValues.Append("'" + Request.QueryString["XBH"] + "',");
                strField.Append(",x_chengbao_xxg");
                strValues.Append("'" + Request.QueryString["XCBXXG"] + "',");
                strField.Append(",x_qidian_xzqy");
                strValues.Append("'" + Request.QueryString["XQDXZQY"] + "',");
                strField.Append(",x_zhuanghao");
                strValues.Append("'" + Request.QueryString["XZH"] + "',");
                strField.Append(",x_zhongdian_xzqy");
                strValues.Append("'" + Request.QueryString["XZDXZQY"] + "',");
                strField.Append(",x_licheng");
                strValues.Append("'" + Request.QueryString["XLC"] + "',");
                strField.Append(",x_xunhu_xzqy");
                strValues.Append("'" + Request.QueryString["XXHXZQY"] + "',");



                //
                strField.Append(",x_xunhu_lc");
                strValues.Append("'" + Request.QueryString["XXHLC"] + "',");
                strField.Append(",x_beizhu");
                strValues.Append("'" + Request.QueryString["XBZ"] + "',");
                strField.Append(",flag");
                strValues.Append("'" + Request.QueryString["FLAG"] + "',");
                strField.Append(",x_tid");
                strValues.Append("'" + Session["CUR_TID"].ToString() + "',");


                //11.3
                strField.Append(",ntype");
                strValues.Append("'" + strtype_n + "',");

                strField.Append(",zid");
                strValues.Append("'" + strzid_n + "',");

                strField.Append(",zpid");
                strValues.Append("'" + strzpid_n + "',");
                
               
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

        public void _SZFFF()
        {

            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTSZFFF") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日

            //11.03
            string strtype_n = Session["CUR_T_ID"].ToString();
            string strzid_n = Session["CUR_ZID"].ToString();
            string strzpid_n = Session["CUR_PZID"].ToString();
            //$.post("../it/it_post.aspx?CMD=CURTSZFFF&FLAG=" + type + "&SXQYF=" +
            //xiaqu_yf + "&SJRFF=" + jinri_ff + "&SBZ=" + bz, {}, function (data) {
            if (Session["EDIT_SZID"].ToString() != "" && Session["EDIT_SZID"] != null)
            {
                StringBuilder UP_strSQL = new StringBuilder();
                UP_strSQL.Append("UPDATE t_sanzhuangfei set ");
                UP_strSQL.Append("s_xiaqu_yf='" + Request.QueryString["SXQYF"] + "',");
                UP_strSQL.Append("s_jinri_ff='" + Request.QueryString["SJRFF"] + "',");
                UP_strSQL.Append("s_bz='" + Request.QueryString["SBZ"] + "',");
               
                UP_strSQL.Append("flag='" + Request.QueryString["FLAG"] + "'");
                UP_strSQL.Append(" where s_tid='" + Session["CUR_TID"].ToString() + "' and s_id='" + Session["EDIT_SZID"] + "' and s_time='" + strnow + "'");
                String strUP_mySQL = UP_strSQL.ToString();

                int res = WXDBUtility.SqlHelper.ExecuteSql(strUP_mySQL);
                if (res > 0)
                {
                    Response.Write("111");//成功
                    Session["EDIT_XHID"] = null;
                    Session.Remove("EDIT_XHID");
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
                strField.Append("insert into t_sanzhuangfei(");
                strValues.Append(") VALUES(");

                strField.Append("s_xiaqu_yf");
                strValues.Append("'" + Request.QueryString["SXQYF"].Trim() + "',");
                strField.Append(",s_jinri_ff");
                strValues.Append("'" + Request.QueryString["SJRFF"].Trim() + "',");
                strField.Append(",s_bz");
                strValues.Append("'" + Request.QueryString["SBZ"] + "',");
                strField.Append(",flag");
                strValues.Append("'" + Request.QueryString["FLAG"] + "',");
                strField.Append(",s_tid");
                strValues.Append("'" + Session["CUR_TID"].ToString() + "',");

                //11.3
                 strField.Append(",ntype");
                strValues.Append("'" + strtype_n  + "',");

                strField.Append(",zid");
                strValues.Append("'" +strzid_n + "',");

                strField.Append(",zpid");
                strValues.Append("'" + strzpid_n + "',");

                strField.Append(",fs_time");
                strValues.Append("'" + strnow + "')");

                strField.Append(",s_time");
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
        public void _ZLZL()
        {

            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTZLZL") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日
            //11.03
            string strtype_n = Session["CUR_T_ID"].ToString();
            string strzid_n = Session["CUR_ZID"].ToString();
            string strzpid_n = Session["CUR_PZID"].ToString();
            //$.post("../it/it_post.aspx?CMD=CURTSZFFF&FLAG=" + type + "&SXQYF=" +
            //xiaqu_yf + "&SJRFF=" + jinri_ff + "&SBZ=" + bz, {}, function (data) {
            if (Session["EDIT_ZLID"].ToString() != "" && Session["EDIT_ZLID"] != null)
            {
                StringBuilder UP_strSQL = new StringBuilder();
                UP_strSQL.Append("UPDATE t_ziliao set ");
                
                UP_strSQL.Append("z_bz='" + Request.QueryString["ZBZ"] + "',");

                UP_strSQL.Append("flag='" + Request.QueryString["FLAG"] + "'");
                UP_strSQL.Append(" where z_tid='" + Session["CUR_TID"].ToString() + "' and z_id='" + Session["EDIT_ZLID"] + "' and z_time='" + strnow + "'");
                String strUP_mySQL = UP_strSQL.ToString();

                int res = WXDBUtility.SqlHelper.ExecuteSql(strUP_mySQL);
                if (res > 0)
                {
                    Response.Write("111");//成功
                    Session["EDIT_ZLID"] = null;
                    Session.Remove("EDIT_ZLID");
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
                strField.Append("insert into t_ziliao(");
                strValues.Append(") VALUES(");

                strField.Append("z_bz");
                strValues.Append("'" + Request.QueryString["ZBZ"].Trim() + "',");
               
                strField.Append(",flag");
                strValues.Append("'" + Request.QueryString["FLAG"] + "',");
                strField.Append(",z_tid");
                strValues.Append("'" + Session["CUR_TID"].ToString() + "',");

                //11.3
                strField.Append(",ntype");
                strValues.Append("'" + strtype_n + "',");

                strField.Append(",zid");
                strValues.Append("'" + strzid_n + "',");

                strField.Append(",zpid");
                strValues.Append("'" + strzpid_n + "',");

                strField.Append(",z_time");
                strValues.Append("'" + strnow + "',");


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
        public void _QTGZ()
        {

            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "CURTQTGZ") return;
            String strnow = DateTime.Now.ToShortDateString().ToString();  //年月日

            //11.03
            string strtype_n = Session["CUR_T_ID"].ToString();
            string strzid_n = Session["CUR_ZID"].ToString();
            string strzpid_n = Session["CUR_PZID"].ToString();
            //$.post("../it/it_post.aspx?CMD=CURTSZFFF&FLAG=" + type + "&SXQYF=" +
            //xiaqu_yf + "&SJRFF=" + jinri_ff + "&SBZ=" + bz, {}, function (data) {
            if (Session["EDIT_QTID"].ToString() != "" && Session["EDIT_QTID"] != null)
            {
                StringBuilder UP_strSQL = new StringBuilder();
                UP_strSQL.Append("UPDATE t_qita set ");

                UP_strSQL.Append("q_bz='" + Request.QueryString["QBZ"] + "',");

                UP_strSQL.Append("flag='" + Request.QueryString["FLAG"] + "'");
                UP_strSQL.Append(" where q_tid='" + Session["CUR_TID"].ToString() + "' and q_id='" + Session["EDIT_QTID"] + "' and q_time='" + strnow + "'");
                String strUP_mySQL = UP_strSQL.ToString();

                int res = WXDBUtility.SqlHelper.ExecuteSql(strUP_mySQL);
                if (res > 0)
                {
                    Response.Write("111");//成功
                    Session["EDIT_QTID"] = null;
                    Session.Remove("EDIT_QTID");
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
                strField.Append("insert into t_qita(");
                strValues.Append(") VALUES(");

                strField.Append("q_bz");
                strValues.Append("'" + Request.QueryString["QBZ"].Trim() + "',");

                strField.Append(",flag");
                strValues.Append("'" + Request.QueryString["FLAG"] + "',");
                strField.Append(",q_tid");
                strValues.Append("'" + Session["CUR_TID"].ToString() + "',");

                 //11.3
                strField.Append(",ntype");
                strValues.Append("'" + strtype_n + "',");

                strField.Append(",zid");
                strValues.Append("'" + strzid_n + "',");

                strField.Append(",zpid");
                strValues.Append("'" + strzpid_n + "',");

                strField.Append(",q_time");
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
        public void _UPDATEXHQK()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "XHPOST") return;
            //CURTID
            String strsql = "UPDATE t_xunhu set flag='1' where x_id='" + Request.QueryString["CURTID"] + "'";
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

        public void _UPPOSTSZ()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "SZFPOST") return;
            //CURTID
            String strsql = "UPDATE t_sanzhuangfei set flag='1' where s_id='" + Request.QueryString["EDIT_SZID"] + "'";
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
        public void _UPPOSTZL()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "ZLPOST") return;
            //CURTID
            String strsql = "UPDATE t_ziliao set flag='1' where z_id='" + Request.QueryString["EDIT_ZLID"] + "'";
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

        public void _UPPOSTQT()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "QTPOST") return;
            //CURTID
            String strsql = "UPDATE t_qita set flag='1' where q_id='" + Request.QueryString["EDIT_QTID"] + "'";
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
        //腐蚀控制
        public void _UPPOSTFS()
        {
            string strcmd = Request.QueryString["CMD"];
            if (strcmd != "FSKZPOST") return;
            //CURTID
            String strsql = "UPDATE t_fushi set flag='1',sp1='0',sp2='0',spid1='0',spid2='0' where fs_id='" + Request.QueryString["POSTFSID"] + "'";
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
        //
    }
}