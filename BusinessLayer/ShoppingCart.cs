using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using ShoppingCart1.DataLayer;
namespace ShoppingCart1.BusinessLayer
{
    public class ShoppingCart
    {
        public string CategoryName { get; set; }
        public int CategoryID { get; set; }
        public int CustomerID { get; set; }


        public string ProductName { set; get; }
        public int ProductID { get; set; }
        public string ProductImage { get; set; }
        public string ProductDescription { get; set; }
        public string ProductPrice { get; set; }
        public int ProductQuantity { get; set; }


        public string CustomerName { get; set; }
        public string CustomerEmailID { get; set; }
        public string CustomerPhoneNo { get; set; }
        public string CustomerAddress { get; set; }
        public string ProductList { get; set; }
        public string PaymentMethod { get; set; }


        public int TotalProducts { get; set; }
        public int TotalPrice { get; set; }
        public int StockType { get; set; }
        public int Flag { get; set; }


        public void AddNewCategory()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@CategoryName",CategoryName, SqlDbType.VarChar, 200);
            DataTable dt = DataAccess.ExecutDTByProcedure("SP_AddNewCategory", parameters);
        }
        public DataTable GetCategories()
        {
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable dt = DataAccess.ExecutDTByProcedure("SP_GetAllCategories", parameters);
            return dt;
        }
        internal DataTable SaveCustomerDetails()
        {
            SqlParameter[] parameters = new SqlParameter[7];
            parameters[0] = DataAccess.AddParameter("@CustomerName", CustomerName, SqlDbType.VarChar, 100);
            parameters[1] = DataAccess.AddParameter("@CustomerEmailID", CustomerEmailID, SqlDbType.VarChar, 100);
            parameters[2] = DataAccess.AddParameter("@CustomerPhoneNo", CustomerPhoneNo, SqlDbType.VarChar, 10);
            parameters[3] = DataAccess.AddParameter("@CustomerAddress", CustomerAddress, SqlDbType.VarChar, 500);
            parameters[4] = DataAccess.AddParameter("@TotalProducts", TotalProducts, SqlDbType.Int, 100);
            parameters[5] = DataAccess.AddParameter("@TotalPrice", TotalPrice, SqlDbType.Int, 100);
            parameters[6] = DataAccess.AddParameter("@PaymentMethod", PaymentMethod, SqlDbType.VarChar, 100);

            DataTable dt = DataAccess.ExecutDTByProcedure("SP_SaveCustomerDetails", parameters);

            return dt;
        }
        internal DataTable GetOrdersList()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataAccess.AddParameter("@Flag", Flag, System.Data.SqlDbType.Int, 20);
            DataTable dt = DataAccess.ExecutDTByProcedure("SP_GetOrdersList", parameters);
            return dt;
        }
        internal void SaveCutomerProducts()
        {
            SqlParameter[] parametrs = new SqlParameter[3];
            parametrs[0] = DataAccess.AddParameter("@CustomerID",CustomerID, SqlDbType.Int, 20);
            parametrs[1] = DataAccess.AddParameter("@ProductID", ProductID, SqlDbType.Int, 20);
            parametrs[2] = DataAccess.AddParameter("TotalProduct", TotalProducts, SqlDbType.Int, 10);
            DataTable dt = DataAccess.ExecutDTByProcedure("SP_SaveCustomerProducts", parametrs);
        }
        internal DataTable GetAvailableStock()
        {
            SqlParameter[] parameter = new SqlParameter[2];
            parameter[1] = DataAccess.AddParameter("@StockType",StockType, SqlDbType.Int, 10);
            parameter[0] = DataAccess.AddParameter("@CategoryID", CategoryID, SqlDbType.Int, 10);
            DataTable dt = DataAccess.ExecutDTByProcedure("SP_GetAvailableStock", parameter);
            return dt;
        }
        public void AddNewProduct()
        {
            SqlParameter[] parameters = new SqlParameter[6];
            parameters[0] = DataAccess.AddParameter("@ProductName", ProductName, SqlDbType.VarChar, 300);
            parameters[1] = DataAccess.AddParameter("@ProductDescription", ProductDescription, SqlDbType.VarChar, 1000);
            parameters[2] = DataAccess.AddParameter("@ProductPrice", ProductPrice, SqlDbType.Int, 100);
            parameters[3]=DataAccess.AddParameter("@ProductImage", ProductImage, SqlDbType.VarChar, 500);
            parameters[4] = DataAccess.AddParameter("@CategoryID", CategoryID, SqlDbType.Int, 100);
            parameters[5] = DataAccess.AddParameter("@ProductQuantity", ProductQuantity, SqlDbType.Int, 100);

            DataTable dt = DataAccess.ExecutDTByProcedure("SP_AddNewProduct", parameters);
        }
        public DataTable GetAllProducets()
        {
            SqlParameter[] parameter = new SqlParameter[1];
            parameter[0] = DataAccess.AddParameter("@CategoryID", CategoryID, SqlDbType.Int, 20);
            DataTable dt = DataAccess.ExecutDTByProcedure("SP_GetAllProducts", parameter); 
            return dt;
        }
    }
}