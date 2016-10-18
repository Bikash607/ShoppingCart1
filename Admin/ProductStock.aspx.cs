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
    public partial class ProductStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                GetCatagories();
                GetAvailableStock();
            }
        }
        private void GetCatagories()
        {
            ShoppingCart k = new ShoppingCart();
            DataTable dt = k.GetCategories();
            if(dt.Rows.Count>0)
            {
                ddlCatagory.DataTextField = "CategoryName";
                ddlCatagory.DataValueField = "CategoryID";
                ddlCatagory.DataSource = dt;
                ddlCatagory.DataBind();
                ddlCatagory.Items.Add(new ListItem("All Produts", "0",true));
                ddlCatagory.SelectedValue = "0"; 
            }
        }
        private void GetAvailableStock()
        {
            ShoppingCart k = new ShoppingCart
            {
                CategoryID=Convert.ToInt32(ddlCatagory.SelectedValue),
                StockType=Convert.ToInt32(rblProductStock.SelectedValue)
            };
            DataTable dt = k.GetAvailableStock();
            if(dt.Rows.Count>0)
            {
                gvAvailableStock.DataSource = dt;
                gvAvailableStock.DataBind();
                gvAvailableStock.Visible = true;
                NoRecordsToDisplay.Visible = false;
            }
            else
            {
                NoRecordsToDisplay.Visible = true;
                gvAvailableStock.Visible = false;
            }
        }

        protected void ddlCatagory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAvailableStock();
        }

        protected void rblProductStock_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAvailableStock();
        }
    }
}