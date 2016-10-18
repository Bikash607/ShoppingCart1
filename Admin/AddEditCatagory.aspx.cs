using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ShoppingCart1.BusinessLayer;
namespace ShoppingCart1.Admin
{
    public partial class AddEditCatagory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryName = txtCatagoryName.Text
            };
            k.AddNewCategory();
            txtCatagoryName.Text = string.Empty;
            Response.Redirect("~/Admin/AddNewProducts.aspx");
        }
    }
}