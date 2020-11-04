using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarketInfo.wd_dzrz.wd_zfxc
{
    public partial class CheUser : System.Web.UI.Page
    {
        public DataTable dt = null;
        public string title = "标题", role = string.Empty;
        public List<string> listid = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["TYPEID"] != null)
                {
                    title = GetType(Request.QueryString["TYPEID"].ToString()) + "人员";
                    DateBind(Request.QueryString["TYPEID"].ToString());
                    if (Request.QueryString["ROLE"] != null)
                    {
                        role = Request.QueryString["ROLE"] as string;
                        listid.Clear();
                        listid = new List<string>(role.Split(','));
                    }
                }
            }
        }
        /// <summary>
        /// 绑定数据
        /// </summary>
        protected void DateBind(string types)
        {
            string strsql = "select  * from dbo.T_XCZF_User where  type='" + GetType(types) + "'";
            dt = WXDBUtility.SqlHelper.GetDataTable(strsql);
        }
        /// <summary>
        /// 分类
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        protected string GetType(string type)
        {
            switch (type)
            {
                case "1":
                    return "机械手";
                case "2":
                    return "信息员";
                case "3":
                    return "农田户主";
                default:
                    return "";
            }
        }


        #region 导入
        protected void btnImport_Click(object sender, EventArgs e)
        {
            List<string> listName = new List<string>();
            string result = "";
            string res = "";
            string stamp = GetTimeStamp();//时间戳
            //string dy = "";
            if (FileUpload1.HasFile == false)//HasFile用来检查FileUpload是否有指定文件
            {
                //Response.Write("<script>alert('请您选择Excel文件')</script> ");
                this.lblhint.InnerHtml = "请您选择Excel文件";
                if (Request.QueryString["TYPEID"] != null)
                {
                    DateBind(Request.QueryString["TYPEID"].ToString());
                }

                return;//当无文件时,返回
            }
            string IsXls = System.IO.Path.GetExtension(FileUpload1.FileName).ToString().ToLower();//System.IO.Path.GetExtension获得文件的扩展名
            if (IsXls != ".xls")
            {
                this.lblhint.InnerHtml = "只可以选择.xls文件";
                if (Request.QueryString["TYPEID"] != null)
                {
                    DateBind(Request.QueryString["TYPEID"].ToString());
                }
                return;//当选择的不是Excel文件时,返回
            }
            string filename = stamp + FileUpload1.FileName;              //获取Execle文件名  DateTime日期函数
            string savePath = Server.MapPath(("upfiles\\") + filename);//Server.MapPath 获得虚拟服务器相对路径
            FileUpload1.SaveAs(savePath);                        //SaveAs 将上传的文件内容保存在服务器上
            DataSet ds = ExcelSqlConnection(savePath, filename);           //调用自定义方法
            if (ds != null)
            {
                DataTable dt = ds.Tables[0];
                //DataRow[] dr = ds.Tables[0].Select();            //定义一个DataRow数组
                int rowsnum = ds.Tables[0].Rows.Count;
                if (rowsnum == 0)
                {
                    this.lblhint.InnerHtml = "Excel表为空表,无数据!";
                    if (Request.QueryString["TYPEID"] != null)
                    {
                        DateBind(Request.QueryString["TYPEID"].ToString());
                    }
                }
                else
                {
                    if (ds.Tables[0].Columns.Count > 1 || ds.Tables[0].Columns[0].ColumnName != "姓名")
                    {
                        this.lblhint.InnerHtml = "Excle表中数据不匹配";
                        if (Request.QueryString["TYPEID"] != null)
                        {
                            DateBind(Request.QueryString["TYPEID"].ToString());
                        }
                    }
                    else
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            //前面除了你需要在建立一个“upfiles”的文件夹外，其他的都不用管了，你只需要通过下面的方式获取Excel的值，然后再将这些值用你的方式去插入到数据库里面
                            if (dt.Rows[i]["姓名"] != null && dt.Rows[i]["姓名"].ToString() != "")
                            {
                                string name = dt.Rows[i]["姓名"].ToString();
                                if (!listName.Contains(name))
                                {
                                    res += dt.Rows[i]["姓名"].ToString() + ",";
                                    listName.Add(dt.Rows[i]["姓名"].ToString());
                                }
                                else
                                {
                                    result += (i + 1) + "、";
                                }
                            }
                        }
                        if (result == "")
                        {
                            //DateBind(res.TrimEnd(','));
                            string getdata = string.Empty;//提示信息
                            string[] arr = res.TrimEnd(',').Split(',');//ex表中的所有姓名
                            listid.Clear();
                            string _Res = string.Empty;
                            if (Request.QueryString["TYPEID"] != null)
                            {
                                foreach (string item in arr)
                                {
                                    if (!string.IsNullOrWhiteSpace(item))
                                    {
                                        _Res = IsCount(item);
                                        if (_Res != "0")
                                        {
                                            getdata += _Res + "，";
                                        }
                                    }
                                }
                            }
                            else
                            {
                                getdata = "未获取到人员类型";
                            }
                            if (string.IsNullOrWhiteSpace(getdata))
                            {
                                this.lblhint.InnerHtml = "导入成功";
                                if (Request.QueryString["TYPEID"] != null)
                                {
                                    DateBind(Request.QueryString["TYPEID"].ToString());
                                }
                            }
                            else
                            {
                                this.lblhint.InnerHtml = GetType(Request.QueryString["TYPEID"].ToString()) + "类型中" + getdata.TrimEnd('，');
                                if (Request.QueryString["TYPEID"] != null)
                                {
                                    DateBind(Request.QueryString["TYPEID"].ToString());
                                }
                            }

                        }
                        else
                        {
                            string getdata = string.Empty;//提示信息
                            string[] arr = res.TrimEnd(',').Split(',');//ex表中的所有姓名
                            listid.Clear();
                            string _Res = string.Empty;
                            if (Request.QueryString["TYPEID"] != null)
                            {
                                foreach (string item in arr)
                                {
                                    if (!string.IsNullOrWhiteSpace(item))
                                    {
                                        _Res = IsCount(item);
                                        if (_Res != "0")
                                        {
                                            getdata += _Res + "，";
                                        }
                                    }
                                }
                            }
                            else
                            {
                                getdata = "未获取到人员类型";
                            }
                            if (string.IsNullOrWhiteSpace(getdata))
                            {
                                this.lblhint.InnerHtml = "Excel表中第" + result.TrimEnd('、') + "行数据与之前重复";
                                if (Request.QueryString["TYPEID"] != null)
                                {
                                    DateBind(Request.QueryString["TYPEID"].ToString());
                                }
                            }
                            else
                            {
                                this.lblhint.InnerHtml = "Excel表中第" + result.TrimEnd('、') + "行数据与之前重复,数据库中" +
                                    GetType(Request.QueryString["TYPEID"].ToString()) + "类型中" + getdata.TrimEnd('，');
                                if (Request.QueryString["TYPEID"] != null)
                                {
                                    DateBind(Request.QueryString["TYPEID"].ToString());
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                this.lblhint.InnerHtml = "Excel无内容或无法解析，请下载模板使用";
                if (Request.QueryString["TYPEID"] != null)
                {
                    DateBind(Request.QueryString["TYPEID"].ToString());
                }
            }
            DropExcel(filename);
        }

        #region 连接Excel  读取Excel数据   并返回DataSet数据集合
        /// <summary>
        /// 连接Excel  读取Excel数据   并返回DataSet数据集合
        /// </summary>
        /// <param name="filepath">Excel服务器路径</param>
        /// <param name="tableName">Excel表名称</param>
        /// <returns></returns>
        public static System.Data.DataSet ExcelSqlConnection(string filepath, string tableName)
        {
            string strCon = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filepath + ";Extended Properties='Excel 8.0;HDR=YES;IMEX=1'";
            OleDbConnection ExcelConn = new OleDbConnection(strCon);
            try
            {
                string strCom = string.Format("SELECT * FROM [Sheet1$]");
                ExcelConn.Open();
                OleDbDataAdapter myCommand = new OleDbDataAdapter(strCom, ExcelConn);
                DataSet ds = new DataSet();
                myCommand.Fill(ds, "[" + tableName + "$]");
                ExcelConn.Close();
                return ds;
            }
            catch
            {
                ExcelConn.Close();
                return null;
            }
        }
        #endregion

        /// <summary>
        /// 判断ex表中信息
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        protected string IsCount(string name)
        {
            string result = string.Empty;
            string strsql = string.Empty;
            try
            {
                strsql = "select count(name) from dbo.T_XCZF_User where name='" + name + "' and  type='" + GetType(Request.QueryString["TYPEID"].ToString()) + "'";
                int res = int.Parse(WXDBUtility.SqlHelper.GetSingle(strsql).ToString());
                if (res > 1)
                {
                    GetID(name, "0");
                    result = "名称为【" + name + "】的人员有“" + res + "”个";
                    ;
                }
                else if (res == 0)
                {
                    GetID(name, "1");
                    result = "查询不到名称为【" + name + "】的人员";
                }
                else
                {
                    GetID(name, "0");
                    result = "0";
                }
            }
            catch (Exception ex)
            {
                result = "查询名称为【" + name + "】的人员时出错";
            }
            return result;
        }
        /// <summary>
        /// 根据name获取id
        /// </summary>
        /// <param name="name"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        protected void GetID(string name, string type)
        {
            string strsql = string.Empty;
            switch (type)
            {
                case "0":
                    strsql = "select top 1 *  from dbo.T_XCZF_User where name='" + name + "' and  type='" + GetType(Request.QueryString["TYPEID"].ToString()) + "'";
                    break;
                case "1":
                    strsql = string.Empty;
                    break;
                default:
                    strsql = "select * from dbo.T_XCZF_User where name='" + name + "' and  type='" + GetType(Request.QueryString["TYPEID"].ToString()) + "'";
                    break;
            }
            try
            {
                if (!string.IsNullOrEmpty(strsql))
                {
                    listid.Add(WXDBUtility.SqlHelper.GetSingle(strsql).ToString());
                }
            }
            catch (Exception ex)
            {

            }
        }
        /// <summary>
        /// 删除文件
        /// </summary>
        /// <param name="_Path"></param>
        protected void DropExcel(string _Path)
        {

            FileInfo file = new FileInfo(Server.MapPath(("upfiles\\")+_Path));//指定文件路径
            if (file.Exists)//判断文件是否存bai在
            {
                file.Attributes = FileAttributes.Normal;//将文件属性设置为普通du,比方说只读文件设置为普通
                file.Delete();//删除文zhi件
            }
        } 
        /// <summary>
        /// 获取时间戳
        /// </summary>
        /// <returns></returns>
        public static string GetTimeStamp()
        {
            TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            return Convert.ToInt64(ts.TotalSeconds).ToString();
        }

        #endregion


    }
}