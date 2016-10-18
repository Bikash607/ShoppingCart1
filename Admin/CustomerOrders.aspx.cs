using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ShoppingCart1.BusinessLayer;

namespace ShoppingCart1.Admin
{
    public partial class CustomerOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                GetOrdersList();
            }
        }
        private void GetOrdersList()
        {
            ShoppingCart k = new ShoppingCart
            {
                Flag = 0
            };
            DataTable dt = k.GetOrdersList();
            gvCustomerOrders.DataSource = dt;
            gvCustomerOrders.DataBind();
        }
    }
}