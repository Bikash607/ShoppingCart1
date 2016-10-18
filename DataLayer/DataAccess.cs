using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace ShoppingCart1.DataLayer
{
    public class DataAccess
    {
        public static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString.ToString();
            }
        }
        public static SqlParameter AddParameter(string parameterName,object value,SqlDbType DbType,int size)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = parameterName;
            param.Value = value.ToString();
            param.SqlDbType = DbType;
            param.Size = size;
            param.Direction = ParameterDirection.Input;
            return param;
        }
        public static DataTable ExecutDTByProcedure(string ProcedureName,SqlParameter[] Params)
        {
            SqlConnection cn = new SqlConnection (ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = ProcedureName;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddRange(Params);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataTable dTable=new DataTable();
            try
            {
                da.Fill(dTable);
            }
            catch(Exception ex)
            {

            }
            finally
            {
                da.Dispose();
                cmd.Parameters.Clear();
                cmd.Dispose();
                cn.Dispose();
            }
            return dTable;
        }
    }
}