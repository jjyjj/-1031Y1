using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Converters;
using System.Text;
using System.Web.Script.Serialization;
using System.IO;

namespace WXDBUtility
{
    public class TOJSON
    {
        public static string GetRoutesByOrder(string strtype)
        {
            string strJson = "";
            string jsonArr = "";
            DataTable dt = null;
            if (strtype == "0")
            {
                dt = ROUTESSer.GetList("").Tables[0];
            }
            if (strtype == "1")
            {
                dt = ROUTESSer.GetListARR("").Tables[0];
            }
            if (dt != null && dt.Rows.Count > 0)
            {
                jsonArr = ToJson(dt);
            }
            else
            {
                jsonArr = "";
                return "000";
            }
            string strCount = dt.Rows.Count.ToString();
            strJson = new JObject(
                new JProperty("count", dt.Rows.Count),
                new JProperty("records", JArray.Parse(jsonArr))).ToString();
            return strJson;
        }
        public static string DataTableToJson(DataTable dt)
        {
            string strArr = "";
            if (dt != null && dt.Rows.Count > 0)
            {
                JArray arrSingle = new JArray();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    JObject objSingle = new JObject();
                    foreach (DataColumn col in dt.Columns)
                    {
                        objSingle.Add(new JProperty(col.ColumnName, dt.Rows[i][col.ColumnName]));
                    }
                    arrSingle.Add(objSingle);
                }
                strArr = arrSingle.ToString();
            }
            return strArr;
        }


        public static string ToJson(DataTable dt)
        {
            StringBuilder jsonString = new StringBuilder();
            jsonString.Append("[");


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                jsonString.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    string strKey = dt.Columns[j].ColumnName;
                    string strValue = dt.Rows[i][j].ToString();
                    Type type = dt.Columns[j].DataType;
                    jsonString.Append("\"" + strKey + "\":\"");
                    strValue = String.Format(strValue, type);
                    if (j < dt.Columns.Count - 1)
                    {
                        jsonString.Append(strValue + "\",");
                    }
                    else
                    {
                        jsonString.Append(strValue);
                    }
                }
                jsonString.Append("\"},");
            }
            jsonString.Remove(jsonString.Length - 1, 1);
            jsonString.Append("]");
            if (jsonString.Length == 1)
            {
                return "[]";
            }
            return jsonString.ToString();
        }

       
    }
}