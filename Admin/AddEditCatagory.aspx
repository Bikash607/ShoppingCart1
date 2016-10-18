<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddEditCatagory.aspx.cs" Inherits="ShoppingCart1.Admin.AddEditCatagory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlacrHolder1" runat="server">
    <div align="center">
      <h4> Add New Catagory</h4> 
        <hr />
    </div>
    <table cellspacing="1" align="center" style="width:900px;">
        <tr>
            <td align="left" style="padding-left:100px;width:50%">
                Add Catagory:
            </td>
           <td align="left" style="width:50%">
               <asp:TextBox ID="txtCatagoryName" runat="server" Width="212px"></asp:TextBox>
           </td>
        </tr>
          <tr>
            <td align="left" style="padding-left:100px;width:50%">
                &nbsp;
            </td>
           <td align="left" style="width:50%">
             <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Width="100px" Height="30px" />
           </td>
        </tr>
         <tr>
            <td align="left" style="padding-left:100px;width:50%">
                &nbsp;
            </td>
           <td align="left" style="width:50%">
           &nbsp;
           </td>
        </tr>
         <tr>
            <td align="left" style="padding-left:100px;width:50%">
                &nbsp;
            </td>
           <td align="left" style="width:50%">
            &nbsp;
           </td>
        </tr>
    </table>
</asp:Content>
