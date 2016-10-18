using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ShoppingCart1.BusinessLayer;
using ShoppingCart1.DataLayer;
namespace ShoppingCart1.Admin
{
    public partial class AddNewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                GetCategories();

                AddSubmitEvent();
                if(Request.QueryString["alert"]=="sucess")
                {
                    Response.Write("<Script>alert('Record Saved Sucessfully')</Script>");
                }
            }
        }
        /*Update Pannel is present in Admin Master.so postback will not occur.so to get allret after insertin record
      bellow a trigger is addad
      */
        
        private void AddSubmitEvent()
        {
            UpdatePanel updatePanel = Page.Master.FindControl("AdminUpdatePanel") as UpdatePanel;
            UpdatePanelControlTrigger trigger = new PostBackTrigger();
            trigger.ControlID = btnSubmit.UniqueID;
            //this will force the page to get refresh only for this page.rest of pages will not get refresh evenif there is a post back
            updatePanel.Triggers.Add(trigger);
        }
       private void GetCategories()
        {
            ShoppingCart k = new ShoppingCart();
            DataTable dt = k.GetCategories();
           if(dt.Rows.Count>0)
           {
               ddlCatagory.DataSource = dt;
               ddlCatagory.DataValueField = "CategoryID";
               ddlCatagory.DataTextField = "CategoryName";
               ddlCatagory.DataBind();
               ddlCatagory.Items.Insert(0, new ListItem("Select Item", "-1"));
           }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(uploadPodutPhoto.PostedFile!=null)
            {
                SaveProductPhoto();
                ShoppingCart k = new ShoppingCart()
                {
                    ProductName = txtProductName.Text,
                    ProductDescription = txtProductDescription.Text,
                    ProductPrice = txtProductPrice.Text,
                    ProductImage = "~/ProductImages/" + uploadPodutPhoto.FileName, 
                    CategoryID=Convert.ToInt32(ddlCatagory.SelectedValue),
                    ProductQuantity=Convert.ToInt32(txtProductQuantity.Text)
                };
                k.AddNewProduct();
                ClearText();
                Response.Redirect("~/Admin/AddNewProducts.aspx?alert=sucess");
            }
            else
            {
                Response.Write("<Script>alert('Please Upload Photo')</Script>");
            }
           
        }
        private void ClearText()
        {
            uploadPodutPhoto = null;
            txtProductName.Text = string.Empty;
            txtProductPrice.Text = string.Empty;
            txtProductDescription.Text = string.Empty;
            txtProductQuantity.Text = string.Empty;
            ddlCatagory.SelectedIndex = ddlCatagory.Items.IndexOf(ddlCatagory.Items.FindByValue("-1"));
        }
        private void SaveProductPhoto()
        {
            if(uploadPodutPhoto.PostedFile!=null)
            {
                string filename = uploadPodutPhoto.FileName.ToString();
                string fileExt = System.IO.Path.GetExtension(uploadPodutPhoto.FileName);
                //if(filename.Length>100)
                //{
                    
                //}
                //else if(fileExt!=".jpeg"&&fileExt!=".jpg"&&fileExt!=".png"&&fileExt!=".bmp")
                //{

                //}
                //else if(uploadPodutPhoto.PostedFile.ContentLength>40000)
                //{

                //}
                //else
                //{
                uploadPodutPhoto.SaveAs(Server.MapPath("~/ProductImages/" + filename));
                //}
            }
        }
    }
}