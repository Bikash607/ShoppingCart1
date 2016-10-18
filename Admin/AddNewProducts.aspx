<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddNewProducts.aspx.cs" Inherits="ShoppingCart1.Admin.AddNewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlacrHolder1" runat="server">
    <div align="center">
       <h4> Add New Products</h4>
        <hr />
     </div>
        <table cellspacing="1" style="width:100%;background-color:#FFFFFF;">
            <tr>
                <td align="left" style="width:50%;padding-left:100px;">Product Name:</td>
                <td align="left" style="width:50%">
                    <asp:TextBox ID="txtProductName" runat="server" Width="212px"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td align="left" style="width:50%;padding-left:100px;">
                    &nbsp;
                </td>
                <td align="left" style="width:50%;">
                    &nbsp;
                </td>
            </tr>
             <tr>
                <td align="left" style="width:50%;padding-left:100px;">Product Catagory:</td>
                <td align="left" style="width:50%;">
                    <asp:DropDownList runat="server" ID="ddlCatagory" Width="212px"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="width:50%;">
                    &nbsp;
                </td>
                <td align="left" style="width:50%;">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="left" style="width:50%;padding-left:100px;">Product Description:</td>
                <td align="left" style="width:50%;">
                    <asp:TextBox ID="txtProductDescription" runat="server" TextMode="MultiLine" Width="212px" Height="80px"></asp:TextBox> 
                </td>
            </tr>
             <tr>
                <td align="left" style="width:50%;padding-left:100px;"> Product Image:</td>
                <td align="left" style="width:50%">
                    <asp:FileUpload ID="uploadPodutPhoto" runat="server" />
                </td>
            </tr>
             <tr>
                <td align="left" style="width:50%;">
                    &nbsp;
                </td>
                <td align="left" style="width:50%">
                    &nbsp;
                </td>
            </tr>
              <tr>
                <td align="left" style="width:50%;padding-left:100px;"> Product Price:</td>
                <td align="left" style="width:50%;">
                    <asp:TextBox ID="txtProductPrice" runat="server" Width="212px"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td align="left" style="width:50%;">
                    &nbsp;
                </td>
                <td align="left" style="width:50%;">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="left" style="width:50%;padding-left:100px;"> Product Quantity:</td>
                <td align="left" style="width:50%;">
                    <asp:TextBox ID="txtProductQuantity" runat="server" Width="212px"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td align="left" style="width:50%;">
                    &nbsp;
                </td>
                <td align="left" style="width:50%;">
                    &nbsp;
                </td>
            </tr>
             <tr>
                <td align="left" style="width:50%;">
                    &nbsp;
                </td>
                <td align="left" style="width:50%;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="100px" Height="30px" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
</asp:Content>
