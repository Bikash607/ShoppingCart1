using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using ShoppingCart1.BusinessLayer;

namespace ShoppingCart1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                lblProducts.Text = "Products";
                lblCategoryName.Text = "Papular Products at Shopping Cart";
                GetCategory();
                GetProducts(0);
            }
        }
        private void GetCategory()
        {
            ShoppingCart k = new ShoppingCart();
            dlCategories.DataSource = null;
            dlCategories.DataSource = k.GetCategories();
            dlCategories.DataBind();
        }
        private void GetProducts(int CategoryID)
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryID = CategoryID
            };
            dlProducts.DataSource = null;
            dlProducts.DataSource = k.GetAllProducets();
            dlProducts.DataBind();
        }
        protected void lbtnCategory_Click(object sender, EventArgs e)
        {
            pnlMyCart.Visible = false;
            pnlProducts.Visible = true;
            int CategoryID = Convert.ToInt32((((LinkButton)sender).CommandArgument));
            GetProducts(CategoryID);
            HeighlightProducts();
        }
        protected void lblLogo_Click(object sender, EventArgs e)
        {
            lblProducts.Text = "Products";
            lblCategoryName.Text = "Papular Products at Shopping Cart";

            pnlCategories.Visible = true;
            pnlProducts.Visible = true;
            pnlMyCart.Visible = false;
            pnlEmptyCart.Visible = false;
            pnlCheckOut.Visible = false;
            pnlOrderPlacedSucessfully.Visible = false;
            GetProducts(0);
            HeighlightProducts();
        }
        private DataTable GetData(string Query)
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);
            SqlCommand cmd=new SqlCommand(Query,cn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dTable = new DataTable();
            try
            {
                da.Fill(dTable);
            }
            catch (Exception ex)
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
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            //Getting Product Id of Clicked Product from CommandArgument Property of Button through Sender Object
            string ProductID = Convert.ToInt32((((Button)sender).CommandArgument)).ToString();
            string ProductQuantity = "1";

            //Finding the DatalistItem  of DataList in which Button Controler Present using NamingContainer Property of Sender
            DataListItem currentItem = (sender as Button).NamingContainer as DataListItem;

            //From DataListItem Finding the "lblAvailableStock"  Label 
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;
            if (Session["MyCart"] != null)
            {
                //Assinging Shoping Cart Table Present In  Session Obeject to Datatable Object
                DataTable dt = (DataTable)Session["MyCart"];

                //Checking the ProductID related product Is Present In Session Cart Table or Not
                var checkProduct = dt.AsEnumerable().Where(r => r.Field<string>("ProductID") == ProductID);
                if(checkProduct.Count()==0)
                {
                    string query = "select * from Products where ProductID=" + ProductID+"";

                    //Getting a new Product From DataBase related to New ProductId
                    DataTable dtProducts = GetData(query);

                    //Creating a New Row Of Session Object Tables Format
                    DataRow dr = dt.NewRow();

                    //Assigning Value to New row of Session table from the Database Data Table
                    dr["ProductID"] = ProductID;
                    dr["Name"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                    dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);
                    dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                    dr["ImageUrl"] = Convert.ToString(dtProducts.Rows[0]["ImageUrl"]);
                    dr["ProductQuantity"] = ProductQuantity;
                    dr["AvailableStock"] = lblAvailableStock.Text;

                    //Adding Table Row to Session Table And Adding table again to Session object
                    dt.Rows.Add(dr);
                    Session["MyCart"] = dt;

                    //Incrementing the Counter Value to Show How many  Product Is Present In the Cart
                    btnShoppingCart.Text = dt.Rows.Count.ToString();
                    HeighlightProducts();
                }
            }
            else
            {
                string query = "Select * from Products where ProductID=" + ProductID + "";
                DataTable dtProducts = GetData(query);
                DataTable dt = new DataTable();
                dt.Columns.Add("ProductID", typeof(string));
                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("Description", typeof(string));
                dt.Columns.Add("Price", typeof(string));
                dt.Columns.Add("ImageUrl", typeof(string));
                dt.Columns.Add("ProductQuantity", typeof(string));
                dt.Columns.Add("AvailableStock", typeof(string));

                DataRow dr = dt.NewRow();
                dr["ProductID"] = ProductID;
                dr["Name"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);
                dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                dr["ImageUrl"] = Convert.ToString(dtProducts.Rows[0]["ImageUrl"]);
                dr["ProductQuantity"] = ProductQuantity;
                dr["AvailableStock"] = lblAvailableStock.Text;
                dt.Rows.Add(dr);
                Session["MyCart"] = dt;
                btnShoppingCart.Text = dt.Rows.Count.ToString();
                HeighlightProducts();
            }

        }
        private void HeighlightProducts()
        {
            if(Session["MyCart"]!=null)
            {
                DataTable dtProductsAddedToCart = (DataTable)Session["MyCart"];
                if(dtProductsAddedToCart.Rows.Count>0)
                {
                    foreach (DataListItem item in dlProducts.Items)
                    {
                        HiddenField hfProductID = (HiddenField)item.FindControl("hfProductID");
                        if(dtProductsAddedToCart.AsEnumerable().Any(row=>hfProductID.Value==row.Field<string>("ProductID")))
                        {
                            Button btnAddToCart = item.FindControl("btnAddToCart") as Button;
                            btnAddToCart.BackColor = System.Drawing.Color.Green;
                            btnAddToCart.Text = "Added To Cart";
                            Image imgStar = item.FindControl("imgStar") as Image;
                            imgStar.Visible = true;
                        }
                    }
                }
            }
        }
        protected void btnShoppingCart_Click(object sender, EventArgs e)
        {
         
            lblCategoryName.Text = "Products In Shopping Cart";
            lblProducts.Text = "Customer Details";
            GetMyCart();
        }
        private void GetMyCart()
        {
            DataTable dlProducts;
            if(Session["MyCart"]!=null)
            {
                dlProducts = (DataTable)Session["MyCart"];
            }
            else
            {
                dlProducts = new DataTable();
            }
            if (dlProducts.Rows.Count > 0)
            {
                txtTotalProducts.Text = dlProducts.Rows.Count.ToString();
                btnShoppingCart.Text = dlProducts.Rows.Count.ToString();
                dlCartProducts.DataSource = dlProducts;
                dlCartProducts.DataBind();
                UpdateTotalBill();

                pnlMyCart.Visible = true;
                pnlCheckOut.Visible = true;
                pnlEmptyCart.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
                pnlOrderPlacedSucessfully.Visible = false;       
            }
            else
            {
                pnlEmptyCart.Visible = true;
                pnlMyCart.Visible = false;
                pnlCheckOut.Visible = false;
                pnlOrderPlacedSucessfully.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;

                dlCartProducts.DataSource = null;
                dlCartProducts.DataBind();
                btnShoppingCart.Text = "0";
                txtTotalPrice.Text = "0";
                txtTotalProducts.Text = "0";

                lblCategoryName.Text = "Your Shopping Cart is Empty";
                lblProducts.Text = " ";
            }
        }
        protected void txtProductQuantity_TextChanged(object sender, EventArgs e)
        {
            TextBox txtQuantity = (sender as TextBox);
            DataListItem currentItem = txtQuantity.NamingContainer as DataListItem;
            HiddenField ProductID = currentItem.FindControl("hfProductID") as HiddenField;
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;

            //Setting Default Value for these Values
            if(txtQuantity.Text==string.Empty ||txtQuantity.Text=="0"||txtQuantity.Text=="1")
            {
                txtQuantity.Text = "1";
            }
            else
            {
                //Checking whearher product is present in Cart table or Session
                if(Session["MyCart"]!=null)
                {
                    //Checking wheather entered Quantity is less than available stock or Not
                    if(Convert.ToInt32(txtQuantity.Text)<=Convert.ToInt32(lblAvailableStock.Text))
                    {
                        lblAvailableStockAlert.Text = " ";
                        //Updating Session table for Updaing to Database
                        DataTable dt = Session["MyCart"] as DataTable;
                        //Getting row of selected products by matching product id 
                        DataRow[] rows = dt.Select("ProductID='" + ProductID.Value + "'");
                        //Getting row index
                        int index = dt.Rows.IndexOf(rows[0]);
                        //Updting the Product Quantity in Session table 
                        dt.Rows[index]["ProductQuantity"] = txtQuantity.Text;
                        //Restoring the Value to Session Object
                        Session["MyCart"] = dt;

                    }
                    else
                    {
                        lblAvailableStockAlert.Text = "Alert:Product Quantity is More than Stock!!!";
                        txtQuantity.Text = "1";
                    }
                }
            }
            UpdateTotalBill();
        }
        private void UpdateTotalBill()
        {
            long totalPrice = 0;
            long totalProducts=0;
            foreach(DataListItem item in dlCartProducts.Items)
            {
                Label lblPrice = (Label)item.FindControl("lblPrice");
                TextBox txtProductQuantity = (TextBox)item.FindControl("txtProductQuantity");
                long productPrice = Convert.ToInt32(lblPrice.Text) * Convert.ToInt32(txtProductQuantity.Text);
                totalPrice = totalPrice + productPrice;
                totalProducts = totalProducts + Convert.ToInt32(txtProductQuantity.Text);
            }
            txtTotalPrice.Text =Convert.ToString(totalPrice);
            txtTotalProducts.Text = Convert.ToString(totalProducts);
        }
        protected void btnRemoveFromCart_Click(object sender, EventArgs e)
        {
            string ProductID = Convert.ToInt32((((Button)sender).CommandArgument)).ToString();
            if(Session["MyCart"]!=null)
            {
                DataTable dt = (DataTable)Session["MyCart"];
                DataRow drr = dt.Select("ProductID="+ ProductID+ " ").SingleOrDefault();
                if(drr!=null)
                {
                    dt.Rows.Remove(drr);
                }
                Session["MyCart"] = dt;
            }
            GetMyCart();
        }
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            string productids = string.Empty;
            DataTable dt;
            if (Session["MyCart"] != null)
            {
                dt = (DataTable)Session["MyCart"];

                ShoppingCart k = new ShoppingCart()
                {
                    CustomerName = txtCustomerName.Text,
                    CustomerEmailID = txtCustomerEmailID.Text,
                    CustomerAddress = txtCustomerAddress.Text,
                    CustomerPhoneNo = txtCustomerPnoneNo.Text,
                    TotalProducts = Convert.ToInt32(txtTotalProducts.Text),
                    TotalPrice = Convert.ToInt32(txtTotalPrice.Text),
                    ProductList = productids,
                    PaymentMethod = rblPaymentMethod.SelectedItem.Text
                };
                DataTable dtResults = k.SaveCustomerDetails();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ShoppingCart SaveProducts = new ShoppingCart()
                    {
                        //Customer Id is Used to Identify Which Cutomer Ordered Which Product //maintains a link between customerDetails and ProductDetails Table 
                        CustomerID = Convert.ToInt32(dtResults.Rows[0][0]),

                        ProductID = Convert.ToInt32(dt.Rows[i]["ProductID"]),
                        TotalProducts = Convert.ToInt32(dt.Rows[i]["ProductQuantity"])
                    };
                    SaveProducts.SaveCutomerProducts();
                }
                Session.Clear();
                GetMyCart();

                lblTransationNo.Text = "Your Transaction No :-" + dtResults.Rows[0][0];

                pnlOrderPlacedSucessfully.Visible = true;
                pnlEmptyCart.Visible = false;
                pnlMyCart.Visible = false;
                pnlCheckOut.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;

                SendOrderPlaceAllert(txtCustomerName.Text,txtCustomerEmailID.Text,Convert.ToString(dtResults.Rows[0][0]));

                txtCustomerAddress.Text = string.Empty;
                txtCustomerName.Text = string.Empty;
                txtCustomerEmailID.Text = string.Empty;
                txtCustomerPnoneNo.Text = string.Empty;
                txtTotalPrice.Text = "0";
                txtTotalProducts.Text = "0";
            }
        }
        private string PapulateOrderEmailBody(string customerName, string transactionNo)
        {
            string body = string.Empty;
            //we are peaking the order Template.html usin streareader
            using(StreamReader reader=new StreamReader(Server.MapPath("~/OrderTemplate.html")))
            {  
                //Putting entire design of html into body 
               body=reader.ReadToEnd();
            }
            body = body.Replace("{CutomerName}", customerName);
            body=body.Replace("{OrderNo}",transactionNo);
            body = body.Replace("{TransationURL}", "http://localhost:12449/TrackYourOrder.aspx?Id=" + transactionNo);
            return body;
        }

        private void SendOrderPlaceAllert(string CustomerName,string CustomerEmailID,string TransactionNo)
        {
            string body = this.PapulateOrderEmailBody(CustomerName, TransactionNo);
            EmailEngine.SendEmail(CustomerEmailID, "Shopping Cart--Your OrderDetails", body);
        }
    }
}