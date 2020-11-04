using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Npgsql;
using System.Data;
using System.Data.OleDb;
using System.IO;

namespace WXDBUtility
{
    public class PostgreSQLHelper
    {
        public static string strConn = System.Configuration.ConfigurationManager.ConnectionStrings["ConnToPOSTGIS"].ToString();
        public static DataSet GetDataSet(string sql)
        {
            IDbConnection dbCon;
            dbCon = new NpgsqlConnection(strConn);

            NpgsqlDataAdapter adpt = new NpgsqlDataAdapter(sql, strConn);
            DataSet ds = new DataSet();
            adpt.Fill(ds);

            return ds;
        }

        public static DataTable GetDataTable(string sql)
        {
            try
            {
                IDbConnection dbCon;
                dbCon = new NpgsqlConnection(strConn);
                NpgsqlDataAdapter adpt = new NpgsqlDataAdapter(sql, strConn);
                DataSet ds = new DataSet();
                adpt.Fill(ds);
                if (ds == null)
                {
                    return null;
                }
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count < 1)
                    {
                        return null;
                    }
                    else
                    {
                        return ds.Tables[0];
                    }
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public static int ExecuteScalar(string sql)
        {
            try
            {
                IDbConnection dbcon;
                dbcon = new NpgsqlConnection(strConn);

                using (dbcon)
                {
                    dbcon.Open();

                    IDbCommand dbcmd = dbcon.CreateCommand();
                    dbcmd.CommandText = sql;

                    int obj = dbcmd.ExecuteNonQuery();
                    dbcon.Close();
                    return obj;
                }
            }
            catch (System.Exception ex)
            {
                return 0;
            }

        }
        public static int ExecuteScalar1(string sql)
        {
            try
            {
                IDbConnection dbcon;
                dbcon = new NpgsqlConnection(strConn);

                using (dbcon)
                {
                    dbcon.Open();

                    IDbCommand dbcmd = dbcon.CreateCommand();
                    dbcmd.CommandText = sql;

                    int obj = dbcmd.ExecuteNonQuery();
                    dbcon.Close();
                    return obj;
                }
            }
            catch (System.Exception ex)
            {
                return 0;
            }

        }

        public static int ExecuteCommand(string sql)
        {
            IDbConnection dbcon = new NpgsqlConnection(strConn);
            IDbCommand cmd = dbcon.CreateCommand();
            using (dbcon)
            {
                try
                {
                    dbcon.Open();
                    cmd.CommandText = sql;
                }
                catch (Exception ex)
                {

                }
                return cmd.ExecuteNonQuery();
            }
        }
        //删除地图的缓存
        public static void _ClearMapCache()
        {
            string strPath = System.Configuration.ConfigurationManager.ConnectionStrings["MapCacheFolder"].ToString();
            if (Directory.Exists(strPath))
            {
                //
                Directory.Delete(strPath, true);
            }
        }
    }
}
