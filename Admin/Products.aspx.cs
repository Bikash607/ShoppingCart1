using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using ShoppingCart1.BusinessLayer;
namespace ShoppingCart1.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetProducts(0);
            }
        }
        private void GetProducts(int CategoryID)
        {
            ShoppingCart k = new ShoppingCart()
                {
                   CategoryID=CategoryID
                };
            DataTable dt = k.GetAllProducets();
            if(dt.Rows.Count>0)
            {
                gvAvailableProducts.DataSource = dt;
                gvAvailableProducts.DataBind();
            }
        }
    }
}