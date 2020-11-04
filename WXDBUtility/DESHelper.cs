using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WXDBUtility
{
    public class DESHelper
    {
        private static readonly String strDesKey = "gaoguanj";//加密所需8位密匙
        ///
        /// DES加密
        ///

        /// 要加密字符串
        /// 返回加密后字符串
        public static String Encrypt_DES(String str)
        {
            if (str.Trim()=="")
            {
                return "";
            }
            try
            {
                System.Security.Cryptography.DESCryptoServiceProvider des = new System.Security.Cryptography.DESCryptoServiceProvider();
                Byte[] inputByteArray = System.Text.Encoding.Default.GetBytes(str);
                des.Key = System.Text.ASCIIEncoding.ASCII.GetBytes(strDesKey);
                des.IV = System.Text.ASCIIEncoding.ASCII.GetBytes(strDesKey);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                System.Security.Cryptography.CryptoStream cs = new System.Security.Cryptography.CryptoStream(ms, des.CreateEncryptor(), System.Security.Cryptography.CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                foreach (Byte b in ms.ToArray())
                sb.AppendFormat("{0:X2}", b);
                return sb.ToString();
            }
            catch (System.Exception ex)
            {
                return "";
            }
        }

        ///
        /// DES解密
        ///
        /// 要解密字符串
        /// 返回解密后字符串
        public static String Decrypt_DES(String str)
        {
            if (str.Trim() == "")
            {
                return "";
            }
            try
            {
                System.Security.Cryptography.DESCryptoServiceProvider des = new System.Security.Cryptography.DESCryptoServiceProvider();
                Int32 x;
                Byte[] inputByteArray = new Byte[str.Length / 2];
                for (x = 0; x < str.Length / 2; x++)
                    inputByteArray[x] = (Byte)(Convert.ToInt32(str.Substring(x * 2, 2), 16));
                des.Key = System.Text.ASCIIEncoding.ASCII.GetBytes(strDesKey);
                des.IV = System.Text.ASCIIEncoding.ASCII.GetBytes(strDesKey);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                System.Security.Cryptography.CryptoStream cs = new System.Security.Cryptography.CryptoStream(ms, des.CreateDecryptor(), System.Security.Cryptography.CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                System.Text.StringBuilder ret = new System.Text.StringBuilder();
                return System.Text.Encoding.Default.GetString(ms.ToArray());
            }
            catch (System.Exception ex)
            {
                return "";
            }
            
        }

        public static String GetLenStr(String str,int iLen)
        {
            if (str.Length < iLen)
            {
                //return str;
            }
            else
            {
                str = str.Substring(0, iLen) + "...";
            }
            return str;
        }

        
    }
}