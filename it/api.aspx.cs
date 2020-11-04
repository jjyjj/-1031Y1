using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Configuration;
using System.Net;
using System.IO;
using System.Text;
using System.Threading;

namespace MarketInfo.it
{
    public partial class api : System.Web.UI.Page
    {
        public static string Server_IP = ConfigurationManager.ConnectionStrings["Server_IP"].ToString();
        public static string m_MKT = ConfigurationManager.ConnectionStrings["MKT"].ToString();
        public static string m_XiaoTu = ConfigurationManager.ConnectionStrings["XIAOTU"].ToString();
        public static string m_DaTu = ConfigurationManager.ConnectionStrings["DATU"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            _SetOpen();
            _DelTempSFZ();
            _SendCMD();
            _SendOK();
            _QianRu();
            _OutputMap();
            _FaBu();
            _DelTempRoad();
            _OutMapAllMap();
        }

        public void _SetOpen()
        {
            //CMD=OPENCLOSE&TYPE
            if (Request.QueryString["CMD"] != null)
            {
                if (Request.QueryString["CMD"] != "OPENCLOSE") return;
                String strSQL = "Update T_ITZL_OK set ITOK=" + Request.QueryString["TYPE"];
                int ires = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
                Response.Write(ires.ToString());
            }
        }

        public void _DelTempSFZ()
        {
            //CMD=OPENCLOSE&TYPE
            if (Request.QueryString["CMD"] != null)
            {
                if (Request.QueryString["CMD"] != "DELSFZ") return;
                String strSQL = "Update T_ITZL_OK set ITOK=" + Request.QueryString["IDX"];
                if (Session["CUR_SFZCMD"] != null)
                {
                    ArrayList list = (ArrayList)Session["CUR_SFZCMD"];
                    list.RemoveAt(int.Parse(Request.QueryString["IDX"]));
                    Session["CUR_SFZCMD"] = list;
                    Response.Redirect("wd_sfz_al.aspx");
                }
            }
        }

        public void _DelTempRoad()
        {
            //CMD=OPENCLOSE&TYPE
            if (Request.QueryString["CMD"] != null)
            {
                if (Request.QueryString["CMD"] != "DELROAD") return;
                String strSQL = "Update T_ITZL_OK set ITOK=" + Request.QueryString["IDX"];
                if (Session["CUR_ROADCMD"] != null)
                {
                    ArrayList list = (ArrayList)Session["CUR_ROADCMD"];
                    list.RemoveAt(int.Parse(Request.QueryString["IDX"]));
                    Session["CUR_ROADCMD"] = list;
                    Response.Redirect("wd_road_al.aspx");
                }
            }
        }

        public void _SendCMD()
        {
            //CMD=OPENCLOSE&TYPE
            if (Request.QueryString["CMD"] != null)
            {
                if (Request.QueryString["CMD"] != "SENDCMD") return;
                //将收费站管制指令存储到数据库中
                String strSFZ = "";
                if (Session["CUR_SFZCMD"] != null)
                {
                    ArrayList list = (ArrayList)Session["CUR_SFZCMD"];
                    for (int i = 0; i < list.Count; i++)
                    {
                        if (i == 0)
                        {
                            strSFZ = list[i].ToString();
                        }
                        else
                        {
                            strSFZ = strSFZ + " " + list[i].ToString();
                        }
                    }
                }
                String strSFZ_ALL = "";
                if (Session["CUR_SFZCMD_ALL"] != null)
                {
                    strSFZ_ALL = Session["CUR_SFZCMD_ALL"].ToString();
                }

                //路段的信息添加功能


                String strUser = "";
                if (Session["U_LoginName"] != null)
                {
                    strUser = Session["U_LoginName"].ToString();
                }

                String strMsg = _GetMsg(strSFZ_ALL, strSFZ);

                String strSQL = "Insert into T_ZL_INFO_MAN(ZL_MAN,ZL_SFZ_ALL,ZL_SFZ,ZL_MSG) VALUES('"
                    + strUser + "','" + strSFZ_ALL + "','" + strSFZ + "','" + strMsg + "')";
                int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
                if (res > 0)
                {
                    Response.Write("1");
                }
                else
                {
                    Response.Write("0");
                }

                Session["CUR_SFZCMD"] = null;
                Session["CUR_SFZCMD_ALL"] = null;
                Session["CUR_ROADCMD"] = null;
                Session["CUR_ROADCMD_ALL"] = null;
            }
        }

        public String _GetMsg(String strSFZ_ALL, String strSFZ)
        {
            String strRes = "";
            if (strSFZ_ALL != "")
            {
                //2,8
                String[] strAllSFZCMD = strSFZ_ALL.Split(',');
                for (int i = 0; i < strAllSFZCMD.Length; i++)
                {
                    strRes = strRes + PB.wc_pub._GetZL(strAllSFZCMD[i]) + ",";
                }
            }

            ArrayList list = new ArrayList();
            if (strSFZ != "")
            {
                //2,8
                String[] strSFZCMD = strSFZ.Split(' ');
                for (int i = 0; i < strSFZCMD.Length; i++)
                {
                    string[] strSFZS = strSFZCMD[i].ToString().Split('|');
                    if (strSFZS.Length == 2)
                    {
                        string[] strData = strSFZS[1].Split('$');
                        //$88$89$90$91$92$93$95$96$97$
                        for (int k = 0; k < strData.Length; k++)
                        {
                            String strLXCode = _GetSFZNameAPI(strData[k]);
                            if (strLXCode != "")
                            {
                                String strGSName = _GetLXName_API(strLXCode);
                                PB.wc_pub.STR_SFZ_DATA data = new PB.wc_pub.STR_SFZ_DATA();
                                data.control_reason = "";
                                data.control_state = strSFZS[0];
                                data.roadcode = strLXCode;
                                data.roadname = strGSName;
                                data.sfzdm = strData[k];
                                data.sfzmc = _GetSFZName(strData[k]);
                                list.Add(data);
                            }
                        }
                    }
                }
            }

            String strZLS=_GetZLMsg(list);
            strRes = strRes +"<BR/>"+ strZLS;
            return strRes;
        }

        public void _GetLX_API()
        {
            String strSQL = "select gid,name,lxbm from l_gaosu";
            DataTable sfztb = WXDBUtility.PostgreSQLHelper.GetDataTable(strSQL);
            Session["SFZ_GSRD_API"] = sfztb;
        }

        public string _GetLXName_API(String gscode)
        {
            string strRes = "";
            if (Session["SFZ_GSRD_API"] == null)
            {
                _GetLX_API();
            }
            DataTable sfztb = (DataTable)Session["SFZ_GSRD_API"];
            if (sfztb != null)
            {
                for (int i = 0; i < sfztb.Rows.Count; i++)
                {
                    if (sfztb.Rows[i]["lxbm"].ToString().ToUpper() == gscode.ToUpper())
                    {
                        strRes = sfztb.Rows[i]["name"].ToString();
                        break;
                    }
                }
            }
            return strRes;
        }

        public void _GetSFZ_API()
        {
            String strSQL = "select gid,name,lxbm from p_shoufeizhan";
            DataTable sfztb = WXDBUtility.PostgreSQLHelper.GetDataTable(strSQL);
            Session["SFZ_DB_API"] = sfztb;
        }

        public string _GetSFZNameAPI(String strgid)
        {
            string strRes = "";
            if (Session["SFZ_DB_API"] == null)
            {
                _GetSFZ_API();
            }
            DataTable sfztb = (DataTable)Session["SFZ_DB_API"];
            if (sfztb != null)
            {
                for (int i = 0; i < sfztb.Rows.Count; i++)
                {
                    if (sfztb.Rows[i]["gid"].ToString() == strgid)
                    {
                        strRes = sfztb.Rows[i]["lxbm"].ToString();
                        break;
                    }
                }
            }
            return strRes;
        }

        public void _SendOK()
        {
            //CMD=OPENCLOSE&TYPE
            if (Request.QueryString["CMD"] == null) return;
            if (Request.QueryString["CMD"] != "SENDOK") return;
            String strUser = "";
            if (Session["U_LoginName"] != null)
            {
                strUser = Session["U_LoginName"].ToString();
            }

            String strSQL = "Insert into T_ZL_INFO_MAN(ZL_MAN,ZL_SFZ_ALL,ZL_ROAD_ALL) VALUES('" + strUser + "','0','0')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            if (res > 0)
            {
                Response.Write("1");
            }
            else
            {
                Response.Write("0");
            }

            Session["CUR_SFZCMD"] = null;
            Session["CUR_SFZCMD_ALL"] = null;

        }
        public void _QianRu()
        {
            if (Request.QueryString["CMD"] == null) return;
            if (Request.QueryString["CMD"] != "QIANRU") return;
            String strZL_ID = Request.QueryString["ZL_ID"];
            String strSQL = "Select * from T_ZL_INFO_MAN where ZL_ID=" + strZL_ID;
            Session["CUR_SFZCMD"] = null;
            Session["CUR_SFZCMD_ALL"] = null;
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null)
            {
                Response.Write("0");
                return;
            }
            String strSFZALL = tb.Rows[0]["ZL_SFZ_ALL"].ToString();
            Session["CUR_SFZCMD_ALL"] = strSFZALL;
            String[] strSFZData = tb.Rows[0]["ZL_SFZ"].ToString().Split(' ');
            ArrayList list = new ArrayList();
            for (int i = 0; i < strSFZData.Length; i++)
            {
                list.Add(strSFZData[i]);
            }
            Session["CUR_SFZCMD"] = list;


            String RoadAll = tb.Rows[0]["ZL_ROAD_ALL"].ToString().Trim();
            Session["CUR_ROADCMD_ALL"] = RoadAll;

            String strRoad = tb.Rows[0]["ZL_ROAD"].ToString().Trim();
            String[] strRdData = strRoad.Split(' ');
            ArrayList rdlist = new ArrayList();
            for (int i = 0; i < strRdData.Length; i++)
            {
                rdlist.Add(strRdData[i]);
            }
            Session["CUR_ROADCMD"] = rdlist;

            //String strSQL = "Insert into T_ZL_INFO_MAN(ZL_MAN,ZL_SFZ_ALL,ZL_ROAD_ALL) VALUES('" + strUser + "','0','0')";
            int res = 1; //WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            if (res > 0)
            {
                Response.Write("1");
            }
            else
            {
                Response.Write("0");
            }

        }
        public void _OutputMap()
        {
            //CMD=OUTPUTMAP&ZL_ID
            //这段代码需要修改，需要形成一个以收费站为主体的地图生成模式
            if (Request.QueryString["CMD"] == null) return;
            if (Request.QueryString["CMD"] != "OUTPUTMAP") return;
            String strZL_ID = Request.QueryString["ZL_ID"];
            String strSQL = "Select * from T_ZL_INFO_MAN where ZL_ID=" + strZL_ID;
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null)
            {
                Response.Write("0");
                return;
            }

            _SetSFZStatus0();

            //1、先执行全省收费站的操作指令
            String strSFZALL = tb.Rows[0]["ZL_SFZ_ALL"].ToString();
            String strInfo = tb.Rows[0]["ZL_MSG"].ToString();
            if (strSFZALL != "")
            {
                String[] strSFZAllData = strSFZALL.Split(',');
                if (strSFZAllData.Length == 1)
                {
                    //单条指令
                    String strOneSQL = "Update p_shoufeizhan set status=" + strSFZAllData[0];
                    int m_res = WXDBUtility.PostgreSQLHelper.ExecuteScalar(strOneSQL);

                    String strRDSQL = "Update l_gsroad set lk_type=" + strSFZAllData[0];
                    m_res = WXDBUtility.PostgreSQLHelper.ExecuteScalar(strRDSQL);
                }
                else
                {
                    //多条指令
                    //判定有没有组合指令2+8，将其替换成10,或8+9，将其替换成17
                    ArrayList m_data = _GetCMDS(new ArrayList(strSFZAllData), "2", "8");
                    m_data = _GetCMDS(m_data, "9", "8");
                    foreach (String strCMD in m_data)
                    {
                        String strOneSQL = "Update p_shoufeizhan set status=" + strCMD;
                        int m_res = WXDBUtility.PostgreSQLHelper.ExecuteScalar(strOneSQL);

                        String strRDSQL = "Update l_gsroad set lk_type=" + strCMD;
                        m_res = WXDBUtility.PostgreSQLHelper.ExecuteScalar(strRDSQL);

                    }
                }
            }

            //2、后执行单个收费站的操作指令
            //8|124$113$347$164$343 2|1$2$3$4$5$6$7$8$9$10$263$11$283$358$13$364$14$15$16$18$17$19$20$21$22$23$24$25$26$365$384$27$376$28$29$30$383 1|264$265$266$267$268$269$270$271
            String strm_SFZ = tb.Rows[0]["ZL_SFZ"].ToString();
            if (strm_SFZ != "")
            {
                //说明收费站列表有数据
                String[] strSFZData = strm_SFZ.Split(' ');
                for (int i = 0; i < strSFZData.Length; i++)
                {
                    //8|124$113$347$164$343
                    String[] strArrSFZ = strSFZData[i].Split('|');
                    _UpdateSFZ_AndRoad_Status(strArrSFZ[0], strArrSFZ[1]);
                }
            }

            String strUser = "";
            if (Session["U_LoginName"] != null)
            {
                strUser = Session["U_LoginName"].ToString();
            }
            if (strInfo.Length >= 2000)
            {
                strInfo = strInfo.Substring(0, 2000);
            }

            String strSQLUpTime = "update p_uptime set m_user='"
                + strUser + "',m_time='" + System.DateTime.Now.ToString()
                + "',m_info='" + strInfo + "'";
            int iures = WXDBUtility.PostgreSQLHelper.ExecuteScalar(strSQLUpTime);
            Response.Write("1");
        }

        public ArrayList _GetCMDS(ArrayList res, string str2, string str89)
        {
            bool is2 = false;
            bool is89 = false;
            for (int i = 0; i < res.Count; i++)
            {
                if (res[i].ToString() == str2)
                {
                    is2 = true;
                }
                if (res[i].ToString() == str89)
                {
                    is89 = true;
                }
            }

            if (is2 || is89)
            {
                String strCMDS = (int.Parse(str2) + int.Parse(str89)).ToString();
                for (int i = 0; i < res.Count; i++)
                {
                    if (res[i].ToString() == str2)
                    {
                        res.RemoveAt(i);
                        break;
                    }
                }
                for (int i = 0; i < res.Count; i++)
                {
                    if (res[i].ToString() == str89)
                    {
                        res.RemoveAt(i);
                        break;
                    }
                }
                res.Add(strCMDS);
            }
            return res;
        }

        public void _SetSFZStatus0()
        {
            String strSQL = "update p_shoufeizhan set status=0";
            int res = WXDBUtility.PostgreSQLHelper.ExecuteScalar(strSQL);

            //将高速公路的路况也修改了一下
            strSQL = "update l_gsroad set lk_type=0";
            res = WXDBUtility.PostgreSQLHelper.ExecuteScalar(strSQL);

        }

        public void _UpdateSFZ_AndRoad_Status(String strCMD, String strSFZStr)
        {
            String[] arryCMD = strCMD.Split(',');
            //多指令的需要进行控制
            for (int i = 0; i < arryCMD.Length; i++)
            {
                _UpdateSFZS(arryCMD[i], strSFZStr);
                _UpdateRoadS_ByAuto(arryCMD[i], strSFZStr);
            }
        }

        public String _UpdateRdStatus(String strCMD, String strRdStr)
        {
            //9|S8311,0,全段
            //8|G3001,0,315,139
            String strRes = "0";
            String[] arryCMD = strCMD.Split(',');

            if (arryCMD.Length == 1)
            {
                int res = _UpdateOneRD(arryCMD[0], strRdStr);
                strRes = res.ToString();
            }
            else
            {
                //多指令的需要进行控制
                ArrayList m_data = _GetCMDS(new ArrayList(arryCMD), "2", "8");
                m_data = _GetCMDS(m_data, "9", "8");
                foreach (String str1CMD in m_data)
                {
                    int res = _UpdateOneRD(str1CMD, strRdStr);
                    strRes = res.ToString();
                }
            }
            return strRes;
        }

        public int _UpdateOneRD(String strOneCMD, String strRoads)
        {
            //9|G30,0,全段$G3001,0,全段$G35,0,全段
            String[] arrS = strRoads.Split('$');
            for (int i = 0; i < arrS.Length; i++)
            {
                string[] arrOne = arrS[i].Split(',');
                if (arrOne.Length < 3) continue;
                //G3001,0,全段
                String strFX = "";
                if (arrOne[1] == "1")
                {
                    strFX = "上行";
                }
                else if (arrOne[1] == "2")
                {
                    strFX = "下行";
                }
                else
                {
                    strFX = "";
                }

                String strSQL = "";
                if (arrOne.Length == 3)
                {
                    String AndSQL = " gsid='" + arrOne[0] + "' and direct like '%" + strFX + "%'";
                    strSQL = "Update l_gsroad set lk_type=" + strOneCMD + " where" + AndSQL;

                }
                else
                {
                    //含有起止点
                    //G36,0,190,194
                    float[] sfzidx = _GetQZSfz(arrOne[2], arrOne[3]);
                    if (sfzidx == null)
                    {
                        return 0;
                    }
                    String AndSQL = " gsid='" + arrOne[0] + "' and direct like '%" + strFX + "%'";
                    strSQL = "Update l_gsroad set lk_type=" + strOneCMD + " where qd_index>="
                        + sfzidx[0].ToString() + " and zd_index<=" + sfzidx[1].ToString() + " and" + AndSQL;

                }
                int res = WXDBUtility.PostgreSQLHelper.ExecuteScalar(strSQL);
            }
            return arrS.Length;
        }

        public float[] _GetQZSfz(String strSFZID1, String strSFZID2)
        {
            float[] res = new float[2];
            String strSQL = "Select * from p_shoufeizhan where gid=" + strSFZID1 + " or gid=" + strSFZID2 + " order by m_index asc";
            DataTable tb = WXDBUtility.PostgreSQLHelper.GetDataTable(strSQL);
            if (tb == null) return null;
            if (tb.Rows.Count != 2) return null;
            float iZH1 = float.Parse(tb.Rows[0]["m_index"].ToString());
            float iZH2 = float.Parse(tb.Rows[1]["m_index"].ToString());
            if (iZH1 == iZH2)
            {
                return null;
            }

            if (iZH1 < iZH2)
            {
                res[0] = iZH1;
                res[1] = iZH2;
            }
            else
            {
                res[0] = iZH2;
                res[1] = iZH1;
            }
            return res;
        }

        public void _UpdateSFZS(String strOneCMD, String strSFZStr)
        {
            //124$113$347$164$343
            String[] arrSFZ = strSFZStr.Split('$');
            for (int i = 0; i < arrSFZ.Length; i++)
            {
                String strSQL = "update p_shoufeizhan set status=" + strOneCMD + " where gid=" + arrSFZ[i];
                int res = WXDBUtility.PostgreSQLHelper.ExecuteScalar(strSQL);
            }
        }

        public void _FaBu()
        {
            //FABU&GID
            if (Request.QueryString["CMD"] == null) return;
            if (Request.QueryString["CMD"] != "FABU") return;
            String GID = Request.QueryString["GID"];
            _CrtMap(GID);
            //Response.Write(GID);
        }

        public void _CrtMap(string strGID)
        {
            //
            string strSQL = "select * from T_ITZL_INFO where GID='" + strGID + "'";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;
            String strSFZJson = PB.wc_pub.Decrypt_DES(tb.Rows[0]["IT_ZL_SFZ"].ToString());
            ArrayList sfzlist = PB.wc_pub._GetSFZ_Array(strSFZJson);

            String strRoadJson = PB.wc_pub.Decrypt_DES(tb.Rows[0]["IT_ZL_ROAD"].ToString());
            ArrayList roadlist = PB.wc_pub._GetROAD_Array(strRoadJson);

            if (sfzlist.Count == 0 && roadlist.Count == 0)
            {
                _SetMapOK(strGID);
                return;
            }

            //获取收费站数据库表
            DataTable sfztb = _GetSFZTable();
            //要把所有的指令都存储在sfzzldata中
            //一个收费站多种管制状态，返回的数据是一条。
            //单个管制类型的数值都是在10一下，如果89同时管制，数据返回的就是89。
            String strDataSFZ = "";
            for (int i = 0; i < sfzlist.Count; i++)
            {
                PB.wc_pub.STR_SFZ_DATA data = (PB.wc_pub.STR_SFZ_DATA)sfzlist[i];
                String strsfzgid = _GetSFZGIDByCodeOrName(data.sfzdm, data.sfzmc, sfztb);
                if (strsfzgid == "")
                {
                    continue;
                }
                //重组一下指令
                //data.control_state
                String newCMD = "0";
                if (data.control_state.Trim() != "")
                {
                    newCMD = _GetOneSFZZl(data.control_state);
                }

                if (newCMD=="")
                {
                    newCMD = "1";
                }

                if (i == 0)
                {
                    strDataSFZ = newCMD + "|" + strsfzgid;
                }
                else
                {
                    strDataSFZ = strDataSFZ + " " + newCMD + "|" + strsfzgid;
                }
            }
            string strMsg = _GetZLMsg(sfzlist);
            strGID = Guid.NewGuid().ToString();
            String strAddSQL = "Insert into T_ZL_INFO_MAN(ZL_SFZ,ZL_ROAD,ZL_MAN,GID,ZL_MSG) Values('" +
                strDataSFZ + "','','接口','" + strGID + "','" + strMsg + "')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strAddSQL);
            if (res > 0)
            {
                //_CrtMapByGID(strGID);
                _CrtMapAuto(strGID);
            }
        }

        public String _GetZLMsg(ArrayList sfzlist)
        {
            String strRes = "";
            ArrayList hw = new ArrayList();
            for (int i = 0; i < sfzlist.Count; i++)
            {
                PB.wc_pub.STR_SFZ_DATA data = (PB.wc_pub.STR_SFZ_DATA)sfzlist[i];
                hw = _GetAddHighwayList(hw, data.roadcode + data.roadname);
            }

            for (int n = 0; n < hw.Count; n++)
            {
                string strOneHW = hw[n].ToString() + "：";
                int k = 0;
                for (int i = 0; i < sfzlist.Count; i++)
                {
                    PB.wc_pub.STR_SFZ_DATA data = (PB.wc_pub.STR_SFZ_DATA)sfzlist[i];
                    if (data.roadcode + data.roadname == hw[n].ToString())
                    {
                        strOneHW = strOneHW + "";
                        if (k == 0)
                        {
                            strOneHW = strOneHW + data.sfzmc;//+"("+data.control_reason+")"
                        }
                        else
                        {
                            strOneHW = strOneHW + "，" + data.sfzmc;//+"("+data.control_reason+")"
                        }
                        k++;
                    }
                }
                if (n == 0)
                {
                    strRes = "[" + (n + 1).ToString() + "]" + strOneHW;
                }
                else
                {
                    strRes = strRes + "<BR/>" + "[" + (n + 1).ToString() + "]" + strOneHW;
                }

            }

            return strRes;
        }

        public ArrayList _GetAddHighwayList(ArrayList hw, String strHwName)
        {
            bool yes = false;
            for (int i = 0; i < hw.Count; i++)
            {
                if (hw[i].ToString() == strHwName)
                {
                    yes = true;
                    break;
                }
            }
            if (!yes)
            {
                hw.Add(strHwName);
            }
            return hw;
        }


        public String _GetZLGID(String strGID)
        {
            String strSQL = "Select * from T_ZL_INFO_MAN where GID='" + strGID + "'";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null)
            {
                return tb.Rows[0]["ZL_ID"].ToString();
            }
            else
            {
                return "";
            }
        }

        public void _CrtMapAuto(String strGID)
        {
            String strSQL = "Select * from T_ZL_INFO_MAN where GID='" + strGID + "'";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb == null) return;
            String strZL_ID = tb.Rows[0]["ZL_ID"].ToString();
            _SetSFZStatus0();
            //2、后执行单个收费站的操作指令
            //8|124$113$347$164$343 2|1$2$3$4$5$6$7$8$9$10$263$11$283$358$13$364$14$15$16$18$17$19$20$21$22$23$24$25$26$365$384$27$376$28$29$30$383 1|264$265$266$267$268$269$270$271
            String strm_SFZ = tb.Rows[0]["ZL_SFZ"].ToString();
            String strInfo = tb.Rows[0]["ZL_MSG"].ToString();
            if (strm_SFZ != "")
            {
                //说明收费站列表有数据
                String[] strSFZData = strm_SFZ.Split(' ');
                for (int i = 0; i < strSFZData.Length; i++)
                {
                    //8|124$113$347$164$343
                    String[] strArrSFZ = strSFZData[i].Split('|');
                    _UpdateSFZSAndRoadtatus_ByAuto(strArrSFZ[0], strArrSFZ[1]);
                    //
                }
            }

            String strUser = "";

            if (Session["U_LoginName"] != null)
            {
                strUser = Session["U_LoginName"].ToString();
            }

            if (strInfo.Length >= 2000)
            {
                strInfo = strInfo.Substring(0, 2000);
            }

            String strSQLUpTime = "update p_uptime set m_user='"
                + strUser + "',m_time='" + System.DateTime.Now.ToString()
                + "',m_info='" + strInfo + "'";
            int iures = WXDBUtility.PostgreSQLHelper.ExecuteScalar(strSQLUpTime);

            //然后在这里生成两张地图
            _SetMapOutPro();
            Response.Write("1");

        }

        public void _OutMapAllMap()
        {
            if (Request.QueryString["CMD"] == null) return;
            if (Request.QueryString["CMD"] != "OUTPUTMAPALL") return;
            _SetMapOutPro();
            Response.Write("1");
        }

        public void _SetMapOutPro()
        {
            Thread threadS = new Thread(HttpPostS);
            threadS.Start();
            Thread threadB = new Thread(HttpPostB);
            threadB.Start();
        }

        public static void HttpPostS()
        {
            string Url = Server_IP + "/mapwms.aspx?MAP=" + m_MKT + m_XiaoTu;
            try
            {
                HttpWebResponse resp;
                HttpWebRequest req = (HttpWebRequest)HttpWebRequest.Create(Url);
                req.Timeout = 300000;
                resp = (HttpWebResponse)req.GetResponse();

            }
            catch (System.Exception ex)
            {

            }
        }

        public static void HttpPostB()
        {
            String Url = Server_IP + "/mapwms.aspx?MAP=" + m_MKT + m_DaTu;
            try
            {
                HttpWebResponse resp;
                HttpWebRequest req = (HttpWebRequest)HttpWebRequest.Create(Url);
                req.Timeout = 300000;
                resp = (HttpWebResponse)req.GetResponse();

            }
            catch (System.Exception ex)
            {

            }
        }

        //修改收费站和道路的状态
        public void _UpdateSFZSAndRoadtatus_ByAuto(String strCMD, String strSFZStr)
        {
            String[] arryCMD = strCMD.Split(',');
            //多指令的需要进行控制
            for (int i = 0; i < arryCMD.Length; i++)
            {
                _UpdateSFZS(arryCMD[i], strSFZStr);
                _UpdateRoadS_ByAuto(arryCMD[i], strSFZStr);
            }
        }

        public void _GetSFZDataSession()
        {
            String strSQL = "select gid,name from p_shoufeizhan";
            DataTable sfztb = WXDBUtility.PostgreSQLHelper.GetDataTable(strSQL);
            Session["SFZ_DB"] = sfztb;
        }

        public string _GetSFZName(String strgid)
        {
            string strRes = "";
            if (Session["SFZ_DB"] == null)
            {
                _GetSFZDataSession();
            }
            DataTable sfztb = (DataTable)Session["SFZ_DB"];
            if (sfztb != null)
            {
                for (int i = 0; i < sfztb.Rows.Count; i++)
                {
                    if (sfztb.Rows[i]["gid"].ToString() == strgid)
                    {
                        strRes = sfztb.Rows[i]["name"].ToString();
                        break;
                    }
                }
            }
            return strRes;
        }

        public void _UpdateRoadS_ByAuto(String strCMD, String strSFZStr)
        {
            String[] arrSFZ = strSFZStr.Split('$');
            for (int i = 0; i < arrSFZ.Length; i++)
            {
                String strSFZGID = arrSFZ[i];
                String strSQL = "Select * from p_shoufeizhan where gid=" + strSFZGID;
                DataTable tb = WXDBUtility.PostgreSQLHelper.GetDataTable(strSQL);
                if (tb == null) continue;
                String strGSID = tb.Rows[0]["lxbm"].ToString();
                String m_index = tb.Rows[0]["m_index"].ToString();
                String strUpSQL = "Update l_gsroad set lk_type=" + strCMD + " where (qd_index=" + m_index + " or zd_index=" + m_index + ") and gsid='" + strGSID + "'";
                int res = WXDBUtility.PostgreSQLHelper.ExecuteScalar(strUpSQL);
            }
        }

        public String _GetOneSFZZl(String strCMD)
        {
            String list = "0";
            //首先将代码5去除掉
            strCMD = strCMD.Replace("5", "1");
            //一个收费站多种管制状态，返回的数据是一条。
            //单个管制类型的数值都是在10一下，如果89同时管制，数据返回的就是89。
            //12589
            //1289
            if (strCMD.IndexOf("1") >= 0)
            {
                return "1";
            }
            else
            {
                //就剩下289
                if (strCMD.Length == 1)
                {
                    list = strCMD;
                }
                else if (strCMD.Length == 2)
                {
                    if (strCMD.IndexOf("2") >= 0 && strCMD.IndexOf("8") >= 0)
                    {
                        //指的是混合指令了
                        return "10";
                    }

                    //含有8和9
                    if (strCMD.IndexOf("9") >= 0 && strCMD.IndexOf("8") >= 0)
                    {
                        //指的是混合指令了
                        return "17";
                    }

                    //含有2和9
                    if (strCMD.IndexOf("2") >= 0 && strCMD.IndexOf("9") >= 0)
                    {
                        //指的是混合指令了
                        return "2";
                    }
                }
                else///三位数了
                {
                    //剩下的289三位数，就好弄了
                    return "10";
                }

            }

            return list;
        }

        public String _GetSFZGIDByCodeOrName(String strCode, String strName, DataTable tb)
        {
            try
            {
                //去掉前面的0
                strCode = (int.Parse(strCode)).ToString();
            }
            catch (System.Exception ex)
            {

            }
            String strRes = "";
            if (tb == null) return strRes;
            for (int i = 0; i < tb.Rows.Count; i++)
            {
                String strGID = tb.Rows[i]["gid"].ToString();
                String strRowCode = tb.Rows[i]["sfz_code"].ToString();
                String strRowName = tb.Rows[i]["name"].ToString();
                if (strRowCode == strCode || strRowName == strName || strRowName + "站" == strName)
                {
                    strRes = strGID;
                    break;
                }
            }
            return strRes;
        }

        public DataTable _GetSFZTable()
        {
            String strSQL = "Select gid,name,sfz_code from p_shoufeizhan";
            return WXDBUtility.PostgreSQLHelper.GetDataTable(strSQL);
        }

        public ArrayList _GetZL(ArrayList sfzlist)
        {
            ArrayList zl = new ArrayList();
            for (int i = 0; i < sfzlist.Count; i++)
            {
                PB.wc_pub.STR_SFZ_DATA data = (PB.wc_pub.STR_SFZ_DATA)sfzlist[i];
                if (zl.Count < 1)
                {
                    PB.wc_pub.STR_ZL_DATA zldata = new PB.wc_pub.STR_ZL_DATA();
                    zldata.zl_code = data.control_state;
                    zldata.zl_content = "";
                    zl.Add(zldata);
                }
                else
                {
                    bool yes = false;
                    foreach (PB.wc_pub.STR_ZL_DATA strVa in zl)
                    {
                        if (data.control_state == strVa.zl_code)
                        {
                            yes = true;
                            break;
                        }
                    }
                    if (!yes)
                    {
                        PB.wc_pub.STR_ZL_DATA zldata = new PB.wc_pub.STR_ZL_DATA();
                        zldata.zl_code = data.control_state;
                        zldata.zl_content = "";
                        zl.Add(zldata);
                    }
                }
            }
            return zl;

        }

        public void _SetMapOK(String strGID)
        {
            String strSQL = "Insert into T_ZL_INFO_MAN(ZL_SFZ_ALL,ZL_ROAD_ALL,ZL_MAN,GID) Values('0','0','接口','" + strGID + "')";
            int res = WXDBUtility.SqlHelper.ExecuteSql(strSQL);
            if (res > 0)
            {
                //_CrtMapByGID(strGID);
                _CrtMapAuto(strGID);
            }
        }

        public void _CrtMapByGID(String strGID)
        {
            String strSQL = "Select * from T_ZL_INFO_MAN where GID='" + strGID + "'";
            DataTable tb = WXDBUtility.SqlHelper.GetDataTable(strSQL);
            if (tb != null)
            {
                Response.Redirect("api.aspx?CMD=OUTPUTMAP&ZL_ID=" + tb.Rows[0]["ZL_ID"].ToString());
            }
        }
    }
}