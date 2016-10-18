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
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                GetCategories();
            }
        }
        private void GetCategories()
        {
            ShoppingCart k = new ShoppingCart();
            DataTable dt= k.GetCategories();
            if(dt.Rows.Count>0)
            {
                gvAvailableCategories.DataSource = dt;
                gvAvailableCategories.DataBind();
            }
        }
    }
}