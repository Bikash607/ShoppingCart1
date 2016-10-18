<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShoppingCart1.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:200px">
       <table  align="center" style="border:2px solid blue;width:450px;">
           <tr  style="border:2px solid blue">
               <td align="center" colspan="2">
                   <asp:Label ID="lable1" runat="server" Text="ShopingCart-Admin" style="color:blue;font-family:Verdana;font-size:20px;"></asp:Label>
                   <hr />
               </td>
           </tr>
           <tr>
               <td></td>
           </tr>
           <tr>
               <td align="center" style="width:50%"> Login ID:</td>  
               <td>
                   <asp:TextBox ID="txtLoginId" runat="server" ></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td align="center" style="width:50%">Password:</td>

               <td>
                   <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
               </td>
           </tr>
           <tr >
               <td align="center" style="width:50%"></td>
               <td>
                   <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
               </td>
           </tr>
            <tr >
               <td align="center" style="color:blue;font-family:Verdana;"  colspan="2">
                   <hr />
                   <asp:Label ID="lblAlert" runat="server" ForeColor="Red"></asp:Label>
               </td>
           </tr>
       </table>
    </div>
    </form>
</body>
</html>
