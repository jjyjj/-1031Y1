using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_dtfx
{
    public partial class wd_dtfxlist : System.Web.UI.Page
    {
        public DataTable dt = null;
        public DataTable dt_1 = null;
        public DataTable dt_2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CUR_TID"] != null) 
                {
                    this.hideFid.Value = Session["CUR_TID"].ToString();
                   
                }
               
                _DataBind();
                _DataBind("0");
                _DataBind(1);
            }
            
        }
        public void filesa(HttpPostedFile file,String flag)
        {
            string strpath = string.Empty;
            string filetitle = string.Empty;
            //this.txtzq.Value = dt.Rows[0]["fx_zq"].ToString();
            string strtype= this.txttype.Value;
            string strxzzh=this.txtxzzh.Value;
            string strgcm=this.txtgcm.Value;
            string strgdgl=this.txtgdgl.Value;
            string strisag=this.txtagcqk_and_gdgx.Value;
            // this.txtgk.Value = dt.Rows[0]["fx_gk"].ToString();
            string strjrsg=this.txtjrsg.Value;
            string strmrjh=this.txtmrjh.Value;
            //this.txtxzjh.Value = dt.Rows[0]["fx_xzjh"].ToString();
            string strname=this.txtname.Value;
           string strremark= this.txtaremark.Value;
            string strtid = this.hideFid.Value;

          string  strtxtzh= this.txtzh.Value;//8.26新增桩号字段
          
           string strisok= this.Select2.Value;//8.26新增桩号字段
            strpath = System.AppDomain.CurrentDomain.BaseDirectory.ToString() + "file_fangan\\" + strtid + "\\";
            if (!System.IO.Directory.Exists(strpath))
            {
                System.IO.Directory.CreateDirectory(strpath);
            }
            string datatime = ConvertToTimestamp(DateTime.Now).ToString();
            filetitle = datatime + "_" + file.FileName;
            String strtpe = Session["CUR_T_ID"].ToString();

          //  strtype_n = Session["CUR_T_ID"].ToString();
            String strzid_n = Session["CUR_ZID"].ToString();
            String strzpid_n = Session["CUR_PZID"].ToString();
            file.SaveAs(strpath + filetitle);
            string StrSql = "";
            if (strtpe == "2")
            {
                //11.03 新增插入字段
                StrSql = "insert t_dongtaifengxian(fx_type,fx_xzzh,fx_gcm,fx_gdgl,fx_gcqk_and_gdgx,fx_jrsg,fx_mrjh,fx_name,fx_remark,flag,t_id,fx_zh,fx_sfwg,path,file_title,sp1,spid1,ntype,zid,zpid,reason1) values";
                StrSql += "('" + strtype + "','" + strxzzh + "','" + strgcm + "','" + strgdgl + "','" + strisag + "','" + strjrsg + "','" + strmrjh + "','" + strname + "'";
                StrSql += ",'" + strremark + "','" + flag + "','" + strtid + "','" + strtxtzh + "','" + strisok + "','" + strpath + "','" + filetitle + "','1','" + strtid + "','" + strtpe + "','" + strzid_n + "','" + strzpid_n + "','本人直接提交！')";

            }
            else {
                //11.03 新增插入字段
                StrSql = "insert t_dongtaifengxian(fx_type,fx_xzzh,fx_gcm,fx_gdgl,fx_gcqk_and_gdgx,fx_jrsg,fx_mrjh,fx_name,fx_remark,flag,t_id,fx_zh,fx_sfwg,path,ntype,zid,zpid,file_title,ntype,zid,zpid) values";
            StrSql += "('" + strtype + "','" + strxzzh + "','" + strgcm + "','" + strgdgl + "','" + strisag + "','" + strjrsg + "','" + strmrjh + "','" + strname + "'";
            StrSql += ",'" + strremark + "','" + flag + "','" + strtid + "','" + strtxtzh + "','" + strisok + "','" + strpath + "','" + filetitle + "','" + strtpe + "','" + strzid_n + "','" + strzpid_n + "')";
            }
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                //if (res > 0)
                //{
                //    Response.Redirect("wd_dtfxlist.aspx");
                //}
            }
            catch (Exception ex)
            {

            }
        }
        public static long ConvertToTimestamp(DateTime time)
        {

            DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
            return (long)(time - startTime).TotalSeconds * 1000;

        }
        /// <summary>
        /// 绑定 TOP1
        /// </summary>
        public void _DataBind()
        {
            string StrSql = "select top 1 * from dbo.t_dongtaifengxian where fx_sfwg='否'order by id desc";
            dt = WXDBUtility.SqlHelper.GetDataTable(StrSql);
            if (dt != null)
            {
                //this.txtzq.Value = dt.Rows[0]["fx_zq"].ToString();
                this.txttype.Value = dt.Rows[0]["fx_type"].ToString();
                
                this.txtxzzh.Value = dt.Rows[0]["fx_xzzh"].ToString();
                this.txtgcm.Value = dt.Rows[0]["fx_gcm"].ToString();
                this.txtgdgl.Value = dt.Rows[0]["fx_gdgl"].ToString();
                this.txtagcqk_and_gdgx.Value = dt.Rows[0]["fx_gcqk_and_gdgx"].ToString();
               // this.txtgk.Value = dt.Rows[0]["fx_gk"].ToString();
                this.txtjrsg.Value = dt.Rows[0]["fx_jrsg"].ToString();
                this.txtmrjh.Value = dt.Rows[0]["fx_mrjh"].ToString();
                //this.txtxzjh.Value = dt.Rows[0]["fx_xzjh"].ToString();
                this.txtname.Value = dt.Rows[0]["fx_name"].ToString();
                this.txtaremark.Value = dt.Rows[0]["fx_remark"].ToString();
                  this.txtzh.Value = dt.Rows[0]["fx_zh"].ToString();//8.26新增桩号字段
                this.Select2.Value = dt.Rows[0]["fx_sfwg"].ToString();

            }
        }

        /// <summary>
        /// 绑定/暂存
        /// </summary>
        public void _DataBind(string AisB)
        {
            string StrSql = "select * from dbo.t_dongtaifengxian WHERE flag='" + AisB + "' and t_id=" + this.hideFid.Value + " order by id desc";
            dt_1 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
        /// <summary>
        /// 绑定/保存
        /// </summary>
        public void _DataBind(int AisB)
        {
            string StrSql = "select * from dbo.t_dongtaifengxian WHERE flag='" + AisB + "' and t_id=" + this.hideFid.Value + "  order by id desc";
            dt_2 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            //先将基本信息插入到数据库
           string strmsg= _Insert("1");
            if (strmsg != "0") {
                HttpFileCollection files = Request.Files;
                string title1 = string.Empty;
                if (files.Count > 0)
                {
                    for (int i = 0; i < files.Count; i++)
                    {
                        HttpPostedFile file = files[i];
                        title1+= filesa_2(file, strmsg) + ",";
                    }
                    if (title1 != "")
                    {
                        string title = title1.TrimEnd(',');//tid.TrimEnd(',');
                        string[] sArray = title.Split(',');
                        if (sArray.Length > 1)
                        {
                            String update = "update t_dongtaifengxian set file_title='" + sArray[0].ToString() + "',img_title='" + sArray[1].ToString() + "' where id=" + strmsg;
                            int re = WXDBUtility.SqlHelper.ExecuteSql(update);
                            Response.Redirect("wd_dtfxlist.aspx");
                        }
                    }
                    else {
                        Response.Redirect("wd_dtfxlist.aspx");


                    }

                    // title = title.Split(',');
                }

            }
           
        }


        public String _Insert(String flag)
        {
            string msg = "0";
            string strpath = string.Empty;
            string filetitle = string.Empty;
            //this.txtzq.Value = dt.Rows[0]["fx_zq"].ToString();
            string strtype = this.txttype.Value;
            string strxzzh = this.txtxzzh.Value;
            string strgcm = this.txtgcm.Value;
            string strgdgl = this.txtgdgl.Value;
            string strisag = this.txtagcqk_and_gdgx.Value;
            // this.txtgk.Value = dt.Rows[0]["fx_gk"].ToString();
            string strjrsg = this.txtjrsg.Value;
            string strmrjh = this.txtmrjh.Value;
            //this.txtxzjh.Value = dt.Rows[0]["fx_xzjh"].ToString();
            string strname = this.txtname.Value;
            string strremark = this.txtaremark.Value;
            string strtid = this.hideFid.Value;
            string strtxtzh = this.txtzh.Value;//8.26新增桩号字段
            string strisok = this.Select2.Value;//8.26新增桩号字段
            String strtpe = Session["CUR_T_ID"].ToString();

            //  strtype_n = Session["CUR_T_ID"].ToString();
            String strzid_n = Session["CUR_ZID"].ToString();
            String strzpid_n = Session["CUR_PZID"].ToString();
            string StrSql = "";
            if (strtpe == "2")
            {
                StrSql = "insert t_dongtaifengxian(fx_type,fx_xzzh,fx_gcm,fx_gdgl,fx_gcqk_and_gdgx,fx_jrsg,fx_mrjh,fx_name,fx_remark,flag,t_id,fx_zh,fx_sfwg,path,file_title,sp1,spid1,reason1,ntype,zid,zpid) values";
                StrSql += "('" + strtype + "','" + strxzzh + "','" + strgcm + "','" + strgdgl + "','" + strisag + "','" + strjrsg + "','" + strmrjh + "','" + strname + "'";
                StrSql += ",'" + strremark + "','" + flag + "','" + strtid + "','" + strtxtzh + "','" + strisok + "','" + strpath + "','" + filetitle + "','1','" + strtid + "','本人直接提交！','" + strtpe + "','" + strzid_n + "','" + strzpid_n + "')";

                             

            }
            else
            {
                StrSql = "insert t_dongtaifengxian(fx_type,fx_xzzh,fx_gcm,fx_gdgl,fx_gcqk_and_gdgx,fx_jrsg,fx_mrjh,fx_name,fx_remark,flag,t_id,fx_zh,fx_sfwg,path,file_title,ntype,zid,zpid) values";
                StrSql += "('" + strtype + "','" + strxzzh + "','" + strgcm + "','" + strgdgl + "','" + strisag + "','" + strjrsg + "','" + strmrjh + "','" + strname + "'";
                StrSql += ",'" + strremark + "','" + flag + "','" + strtid + "','" + strtxtzh + "','" + strisok + "','" + strpath + "','" + filetitle + "','" + strtpe + "','" + strzid_n + "','" + strzpid_n + "')";

                
            }
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);

                if (res > 0)
                {
                    
                    String sqlone = "select top 1  id from t_dongtaifengxian where t_id='" + strtid + "' order by setTime desc";
                    DataTable tbone = WXDBUtility.SqlHelper.GetDataTable(sqlone);
                    if (tbone != null)
                    {
                        msg = tbone.Rows[0]["id"].ToString();

                    }
                    //Response.Redirect("wd_dtfxlist.aspx");
                    //msg = "1";
                }
            }
            catch (Exception ex)
            {
                msg = "0";
            }
            return msg;
        }
        public String  filesa_2(HttpPostedFile file, String id)
        {
            //if (file.FileName == null || file.FileName =="")
            //{
            //    return "";
            //}
                string strpath = string.Empty;
            string filetitle = string.Empty;
            //this.txtzq.Value = dt.Rows[0]["fx_zq"].ToString();
            string strtid = this.hideFid.Value;
            strpath = System.AppDomain.CurrentDomain.BaseDirectory.ToString() + "file_fangan\\" + strtid + "\\";
            if (!System.IO.Directory.Exists(strpath))
            {
                System.IO.Directory.CreateDirectory(strpath);
            }
            string datatime = ConvertToTimestamp(DateTime.Now).ToString();
           
            if (file.FileName != null && file.FileName!="") {
                filetitle = datatime + "_" + file.FileName;
                file.SaveAs(strpath + filetitle);
            }
            string StrSql = "update t_dongtaifengxian set path='" + strpath + "'  where id=" + id;
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {
                    return filetitle;
                }
            }
            catch (Exception ex)
            {
                return "0";
            }
            return filetitle;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string strmsg = _Insert("0");
            if (strmsg != "0")
            {
                HttpFileCollection files = Request.Files;
                string title1 = string.Empty;
                if (files.Count > 0)
                {
                    for (int i = 0; i < files.Count; i++)
                    {
                        HttpPostedFile file = files[i];
                        title1 += filesa_2(file, strmsg) + ",";
                    }
                    if (title1 != "")
                    {
                        string title = title1.TrimEnd(',');//tid.TrimEnd(',');
                        string[] sArray = title.Split(',');
                        if (sArray.Length > 1)
                        {
                            String update = "update t_dongtaifengxian set file_title='" + sArray[0].ToString() + "',img_title='" + sArray[1].ToString() + "' where id=" + strmsg;
                            int re = WXDBUtility.SqlHelper.ExecuteSql(update);
                            Response.Redirect("wd_dtfxlist.aspx");
                        }
                        else
                        {
                            Response.Redirect("wd_dtfxlist.aspx");


                        }
                    }
                    else
                    {
                        Response.Redirect("wd_dtfxlist.aspx");


                    }

                    // title = title.Split(',');
                }

            }



        }
        protected void btn_uptj_Click(object sender, EventArgs e)
        {
            string strmsg = update("1");
            string strid = this.hide_id.Value; //hide_id
            if (strmsg != "0" && strid!="" && strid!=null) {
                HttpFileCollection files = Request.Files;
                string title1 = string.Empty;
                if (files.Count > 0)
                {
                    for (int i = 0; i < files.Count; i++)
                    {
                        HttpPostedFile file = files[i];
                        title1 += filesa_2(file, strid) + ",";                       
                        
                    }
                    if (title1 != "") {                    
                    string title = title1.TrimEnd(',');//tid.TrimEnd(',');
                        title = title.Replace(",,", "");
                        string[] sArray = title.Split(',');
                    if (sArray.Length > 1)
                    {
                        String sqlupdate = "update t_dongtaifengxian set file_title='" + sArray[0].ToString() + "',img_title='" + sArray[1].ToString() + "' where id=" + strid;
                        int re = WXDBUtility.SqlHelper.ExecuteSql(sqlupdate);
                        Response.Redirect("wd_dtfxlist.aspx");
                    }
                    }
                    else
                    {
                        Response.Redirect("wd_dtfxlist.aspx");
                    }

                    // title = title.Split(',');
                }
            }
            
         }

        protected void btn_upzc_Click(object sender, EventArgs e)
        {


            string strmsg = update("0");
            string strid = this.hide_id.Value; //hide_id
            if (strmsg != "0" && strid!="" && strid!=null)
            {
                HttpFileCollection files = Request.Files;
                string title1 = string.Empty;
                if (files.Count > 0)
                {
                    for (int i = 0; i < files.Count; i++)
                    {
                        HttpPostedFile file = files[i];
                        title1 += filesa_2(file, strid) + ",";                      
                        
                    }
                    if (title1 != "")
                    {
                       
                        string title = title1.TrimEnd(',');//tid.TrimEnd(',');
                        title = title.Replace(",,","");
                        string[] sArray = title.Split(',');
                        if (sArray.Length > 1)
                        {
                            String updatesql = "update t_dongtaifengxian set file_title='" + sArray[0].ToString() + "',img_title='" + sArray[1].ToString() + "' where id=" + strid;
                            int re = WXDBUtility.SqlHelper.ExecuteSql(updatesql);
                            Response.Redirect("wd_dtfxlist.aspx");
                        }
                        else
                        {
                            Response.Redirect("wd_dtfxlist.aspx");
                        }
                    }
                    else {
                        Response.Redirect("wd_dtfxlist.aspx");

                    }
                    // title = title.Split(',');
                }
            }
            //HttpFileCollection files = Request.Files;
            //if (files.Count > 0)
            //{
            //    for (int i = 0; i < files.Count; i++)
            //    {
            //        HttpPostedFile file = files[i];

            //        if (file.FileName == "") {
            //            //不更新方案
            //            update("0");
            //        }
            //        filesaup(file, "0");
            //    }
            //}
        }
        public void filesaup(HttpPostedFile file, String flag)
        {
            string strpath = string.Empty;
            string filetitle = string.Empty;
            //this.txtzq.Value = dt.Rows[0]["fx_zq"].ToString();
            string strtype = this.txttypeup.Value;

            string strxzzh = this.txtxzzhup.Value;
            string strgcm = this.txtgcmup.Value;
            string strgdgl = this.txtgdglup.Value;
            string strisag = this.txtagcqk_and_gdgxup.Value;
            // this.txtgk.Value = dt.Rows[0]["fx_gk"].ToString();
            string strjrsg = this.txtjrsgup.Value;
            string strmrjh = this.txtmrjhup.Value;
            //this.txtxzjh.Value = dt.Rows[0]["fx_xzjh"].ToString();
            string strname = this.txtnameup.Value;//现场监护人姓名
            string strremark = this.txtaremarkup.Value;
            string strtid = this.hideFid.Value;
            string strid = this.hide_id.Value; //hide_id
            string strtxtzh = this.txtzhup.Value;//8.26新增桩号字段

            string strisok = this.Select1.Value;//8.26新增桩号字段
            strpath = System.AppDomain.CurrentDomain.BaseDirectory.ToString() + "file_fangan\\" + strtid + "\\";
            if (!System.IO.Directory.Exists(strpath))
            {
                System.IO.Directory.CreateDirectory(strpath);
            }
            string datatime = ConvertToTimestamp(DateTime.Now).ToString();
            filetitle = datatime + "_" + file.FileName;
            string StrSql = "update t_dongtaifengxian set fx_xzzh='" + strxzzh + "',fx_gcm='" + strgcm + "',fx_gdgl='" + strgdgl + "',fx_type='" + strtype + "',";
            StrSql += "fx_gcqk_and_gdgx='" + strisag + "',fx_jrsg='" + strjrsg + "',fx_mrjh='" + strmrjh + "',fx_name='" + strname + "',";
            StrSql += "fx_remark='" + strremark + "',flag='" + flag + "',t_id='" + strtid + "',fx_zh='" + strtxtzh + "',fx_sfwg='"+ strisok + "',path='"+ strpath + "',file_title='"+ filetitle + "'  where id=" + strid;
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {

                    file.SaveAs(strpath + filetitle);
                    Response.Redirect("wd_dtfxlist.aspx");
                }
            }
            catch (Exception ex)
            {

            }
        }


        public String update(String flag) {
            string resmsg = "0";
            string strtype = this.txttypeup.Value;

            string strxzzh = this.txtxzzhup.Value;
            string strgcm = this.txtgcmup.Value;
            string strgdgl = this.txtgdglup.Value;
            string strisag = this.txtagcqk_and_gdgxup.Value;
            // this.txtgk.Value = dt.Rows[0]["fx_gk"].ToString();
            string strjrsg = this.txtjrsgup.Value;
            string strmrjh = this.txtmrjhup.Value;
            //this.txtxzjh.Value = dt.Rows[0]["fx_xzjh"].ToString();
            string strname = this.txtnameup.Value;//现场监护人姓名
            string strremark = this.txtaremarkup.Value;
            string strtid = this.hideFid.Value;
            string strid = this.hide_id.Value; //hide_id
            string strtxtzh = this.txtzhup.Value;//8.26新增桩号字段

            string strisok = this.Select1.Value;//8.26新增桩号字段
            string StrSql = "update t_dongtaifengxian set fx_xzzh='" + strxzzh + "',fx_gcm='" + strgcm + "',fx_gdgl='" + strgdgl + "',fx_type='" + strtype + "',";
            StrSql += "fx_gcqk_and_gdgx='" + strisag + "',fx_jrsg='" + strjrsg + "',fx_mrjh='" + strmrjh + "',fx_name='" + strname + "',";
            StrSql += "fx_remark='" + strremark + "',flag='" + flag + "',t_id='" + strtid + "',fx_zh='" + strtxtzh + "',fx_sfwg='" + strisok + "',sp1='0',sp2='0',spid1='0',spid2='0'  where id=" + strid;
            try
            {
                int res = WXDBUtility.SqlHelper.ExecuteSql(StrSql);
                if (res > 0)
                {
                    resmsg = "1";
                  //  file.SaveAs(strpath + filetitle);
                   // Response.Redirect("wd_dtfxlist.aspx");
                }
            }
            catch (Exception ex)
            {
                resmsg = "0";
            }
            return resmsg;
        }
    }
}
