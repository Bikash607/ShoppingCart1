<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="ShoppingCart1.Admin.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlacrHolder1" runat="server">
    <div align="center" style="background-color:lightyellow; border:4px double blue">
          <div style="width:100%;background-color:chocolate;color:aliceblue">
             <asp:Label ID="lblCategories" runat="server" Text="All Products" Style="font-weight:700;font-size:25px; width:100%"></asp:Label>
         </div>
        <table align="center" >
            <tr>
                <td align="center">
                  <asp:GridView ID="gvAvailableProducts" Width="900px" runat="server" AutoGenerateColumns="false"  CellPadding="2" ForeColor="#333333"
                      GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:ButtonField DataTextField="Name" HeaderText="Product Name"  ItemStyle-Width="120" ControlStyle-Font-Underline="false"  />
                 <asp:ButtonField DataTextField="CategoryName" HeaderText="Category Name" ItemStyle-Width="130" ControlStyle-Font-Underline="false"  />
                 <asp:ButtonField DataTextField="AvailableStock" HeaderText="Available Stock" ItemStyle-Width="140" 
                     ItemStyle-Font-Bold="true" ItemStyle-Font-Size="Larger" ControlStyle-Font-Underline="false" ></asp:ButtonField>
                 <asp:ButtonField DataTextField="Price" HeaderText="Price" ItemStyle-Width="100" ControlStyle-Font-Underline="false" ItemStyle-VerticalAlign="Middle" />
                 <asp:ImageField DataImageUrlField="ImageUrl" HeaderText=" Product Image" ControlStyle-Width="300" ControlStyle-Height="200" ></asp:ImageField>
            </Columns>
             <RowStyle CssClass="text-align:center"  HorizontalAlign="Center"/>
               
        </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
