using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MarketInfo.wd_dzrz.wd_dtfx
{
    public partial class wd_hislist : System.Web.UI.Page
    {
        public DataTable dt_1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CUR_TID"] != null)
                { _DataBind(); }
            }
        }
        public void _DataBind()
        {
           // string StrSql = "select  * from dbo.t_dongtaifengxian where t_id='"+ Session["CUR_TID"] + "' and fx_sfwg='是' and flag='1' order by id desc";
            string StrSql = "";
            if (Request.QueryString["UTID"] != "" && Request.QueryString["UTID"] != null)
            {
                this.HideID.Value = Request.QueryString["UTID"];
                StrSql = "select  a.*,b.zname,c.T_NAME from dbo.t_dongtaifengxian a ,T_ZYQ_INFO b,T_USER_INFO c where a.t_id='" + Request.QueryString["UTID"] + "' and a.sp1<>'0' and a.spid1<>'0' and a.flag='1' and a.zpid=b.zid and c.T_ID=a.t_id order by a.id desc";           

            }
            else {
                string strtpe = Session["CUR_T_ID"].ToString();
                if (strtpe == "2")//站长
                {
                    StrSql = "select a.*,b.zname,c.T_NAME from dbo.t_dongtaifengxian a,T_ZYQ_INFO b,T_USER_INFO c  where a.ntype='3' and a.zpid='" + Session["CUR_ZID"].ToString() + "' and  a.flag='1' and a.sp1<>'0' and a.zpid=b.zid and c.T_ID=a.t_id";
                }
                if (strtpe == "1")
                {
                    String sql = "select zid from t_user_info where zpid='" + Session["CUR_ZID"].ToString() + "'";
                    DataTable tb1 = WXDBUtility.SqlHelper.GetDataTable(sql);
                    string where = "";
                    if (tb1 != null)
                    {
                        string[] arr = new string[tb1.Rows.Count];
                        for (int i = 0; i < tb1.Rows.Count; i++)
                        {
                            arr[i] = tb1.Rows[i]["zid"].ToString();
                            int len = arr.Length;

                        }
                        string tid = "";
                        for (int j = 0; j < arr.Length; j++)
                        {
                            tid += arr[j].ToString() + ",";
                        }
                        tid = tid.TrimEnd(',');

                        where = "  a.zid IN ( " + tid + ") ";
                        where = "and (" + where + " or a.zpid in ( " + tid + "))";
                    }
                    StrSql = "select  a.*,b.zname,c.T_NAME  from t_dongtaifengxian a,T_ZYQ_INFO b,T_USER_INFO c where a.flag='1' and a.sp1<>'0' and a.spid1<>'0' and a.sp2<>'0' and a.spid2<>'0' and  a.zpid=b.zid and c.T_ID=a.t_id " + where;
            
                }
                if (strtpe == "0")
                {
                    StrSql = "select a.*,b.zname,c.T_NAME  from dbo.t_dongtaifengxian a,T_ZYQ_INFO b,T_USER_INFO c where a.sp2<>'0' and a.spid2<>'0' and  a.flag='1' and  a.zpid=b.zid and c.T_ID=a.t_id  ";

                }
                //StrSql = "select  * from dbo.t_dongtaifengxian where t_id='" + Session["CUR_TID"] + "' and sp1<>'0' and spid1<>'0' and flag='1' order by id desc";           
            
            }
            dt_1 = WXDBUtility.SqlHelper.GetDataTable(StrSql);
        }
    }
}