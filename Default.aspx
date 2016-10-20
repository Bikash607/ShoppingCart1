<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShoppingCart1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
      .style1
      {
          width:900px;
      }

      .style2
      {
           width:633px;
           text-align:left;
      }
      .style3
      {
           width:257px;
           text-align:center;
      }
      .style4
      {
          width:185px;
          text-align:center;
      }
     .style6
      {    
          width: 260px;
          text-align:left;
      }
     .style7
     {
         width:427px;
         text-align:center;
     }
     .style8
     {
         width:108px;
         text-align:center; 
     }
        .auto-style1 {
            height: 39px;
        }
    </style>
</head>
<body>
<div></div>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePaPanel3" runat="server">
            <ContentTemplate>
                <table align="center" class="style1">
                    <tr>
                        <td>
                            <table  align="center" class="style1" style="border-bottom-style:ridge;border-bottom-width:medium; border-color:#9933ff">
                                <tr>
                                  <td align="center"  class="style8" rowspan="2">
                                     <asp:Image ID="img1" runat="server" ImageUrl="~/Images/fevicon.jpg" Height="53px" Width="72px" />
                                          &nbsp;
                                  </td>
                                  <td  class="style6" rowspan="2" >
                                      <asp:LinkButton ID="lblLogo" OnClick="lblLogo_Click" CausesValidation="false" runat="server" Text="ShoppingCart" Font-Size="20pt"  Font-Names="Eras Demi ITC" ForeColor="#0660CC"></asp:LinkButton>
                                       <br />
                                       For Those Who Love Shopping...!
                                  </td>
                                 <td align="center" rowspan="2"  class="style7">
                                     <asp:Image ID="img2" ImageUrl="~/Images/slide1.jpg" runat="server" Width="282px" Height="67px" />
                                 </td>
                                 <td align="right"  rowspan="2" >
                                     <asp:Image ID="Image1" ImageUrl="~/Images/box-img4.png" runat="server"  Width="70px" Height="67px"  />
                                 </td>
                                 <td align="left" class="auto-style1">
                                     <asp:LinkButton ID="btnShoppingCart" runat="server" Font-Underline="false" Font-Size="20px" ForeColor="red" OnClick="btnShoppingCart_Click">0</asp:LinkButton>
                                 </td>
                                </tr>
                                <tr>
                                     <td valign="middle" class="style3">
                                         &nbsp;
                                     </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="center" class="style1" style="border:thin ridge #9900FF">
                                <tr>
                                    <td class="style2">
                                        &nbsp;
                                        <asp:Label ID="lblCategoryName" runat="server" Font-Size="16pt" ForeColor="#6600CC"></asp:Label>
                                    </td>
                                    <td class="style3" style="border-left-style:ridge;border-width:thin;border-color:#9900FF">
                                           &nbsp;
                                        <asp:Label ID="lblProducts" runat="server" Font-Size="15pt" ForeColor="#6600CC"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="center" class="style1">
                                <tr> 
                                    <td class="style2" valign="top">
                                        <asp:Panel ID="pnlProducts" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px">
                                            <asp:DataList ID="dlProducts" runat="server" RepeatColumns="3"  Font-Bold="false" Font-Italic="false"
                                                 Font-Overline="false" Font-Underline="false">
                                                <ItemTemplate>
                                                    <div align="left">
                                                        <table  cellspacing="1" class="style4" style="border:1px ridge #9900FF">
                                                            <tr>
                                                                <td style="border-bottom-style:ridge;border-width:1px;border-color:#000000">
                                                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name")%>' Style="font-weight:700"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <img alt="" src='<%# Eval("ImageUrl") %>' runat="server" id="imgProductPhoto" style="border:ridge 1px black; width:173px;height:160px;" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    Price:<asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                                                                    <asp:Image ID="imgStar" runat="server" ImageUrl="~/Images/star.png" Visible="false"  />
                                                                    Stock:&nbsp;
                                                                    <asp:Label ID="lblAvailableStock" runat="server" Text='<%#Eval("AvailableStock")%>' ToolTip="Available Stock" 
                                                                       ForeColor="Red" Font-Bold="true"></asp:Label>
                                                                    <asp:HiddenField ID="hfProductID" runat="server" Value='<%#Eval("ProductID") %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="btnAddToCart" runat="server" CommandArgument='<%#Eval("ProductID") %>' OnClick="btnAddToCart_Click"
                                                                     Text="Add To Cart"    Width="100%" CausesValidation="false"  BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                                <ItemStyle Width="33%" />
                                            </asp:DataList>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlMyCart" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                             BorderStyle="Inset" BorderWidth="1px" Visible="false" >
                                            <table align="center" cellspacing="1">
                                                <tr>
                                                    <td align="center">
                                                        <asp:Label ID="lblAvailableStockAlert" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                        <asp:DataList ID="dlCartProducts" runat="server" RepeatColumns="3" Font-Bold="false" Font-Italic="false"
                                                        Font-Overline="false" Font-Underline="false" Width="551px">
                                                            <ItemTemplate>
                                                              <div align="left">
                                                                  <table class="style4" cellspacing="1" style="border:1px ridge #9900FF;text-align:center;width:172px;">
                                                                     <tr>
                                                                         <td style="border-bottom-style:ridge;border-width:1px;border-color:#000000">
                                                                             <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name")%>' Style="font-weight:700"></asp:Label>
                                                                        </td>
                                                                     </tr>
                                                                     <tr>
                                                                         <td>
                                                                           <img alt="" src='<%# Bind("ImageUrl") %>' runat="server" id="imgProductPhoto" style="border:ridge 1px black; width:173px;height:160px;" />
                                                                        </td>
                                                                     </tr>
                                                                    <tr>
                                                                       <td> 
                                                                            AvailableStock:&nbsp;
                                                                            <asp:Label ID="lblAvailableStock" runat="server" Text='<%#Eval("AvailableStock")%>' ToolTip="Available Stock" 
                                                                       ForeColor="Red" Font-Bold="true"></asp:Label>
                                                                            <br />
                                                                          Price:<asp:Label ID="lblPrice" runat="server" Text='<%#Bind("Price") %>'></asp:Label>
                                                                           &nbsp;*&nbsp;
                                                                           
                                                                           <asp:TextBox ID="txtProductQuantity" runat="server" Width="15px" Height="10px" MaxLength="2" 
                                                                               OnTextChanged="txtProductQuantity_TextChanged" AutoPostBack="true" Text='<%#Eval("ProductQuantity") %>'></asp:TextBox>
                                                                           <asp:HiddenField ID="hfProductID" runat="server" Value='<%#Eval("ProductID") %>' />
                                                                       </td>
                                                                     </tr>
                                                                      <tr>
                                                                          <td>
                                                                               <asp:Button ID="btnRemoveFromCart" runat="server" Text="Remove From Cart" CommandArgument='<%#Eval("ProductID") %>'
                                                                                   OnClick="btnRemoveFromCart_Click" Width="100%" CausesValidation="false"  BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" />
                                                                          </td>
                                                                      </tr>
                                                                   </table>
                                                               </div>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="33%" />
                                                        </asp:DataList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                    <td class="style3" valign="top" align="center">
                                        <asp:Panel ID="pnlCategories" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                             BorderStyle="Inset" BorderWidth="1px">
                                            <asp:DataList ID="dlCategories" runat="server" BorderColor="#CCCCCC" BackColor="White" ForeColor="Black" CellPadding="4"
                                               BorderStyle="None" BorderWidth="1px" Width="252px" GridLines="Horizontal">
                                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                <HeaderStyle BackColor="#333333" Font-Bold="true" ForeColor="White" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnCategory" runat="server" Text='<%#Bind("CategoryName") %>' Font-Underline="false" Font-Size="20px" 
                                                     OnClick="lbtnCategory_Click" CommandArgument='<%#Bind("CategoryID")%>'></asp:LinkButton>
                                                </ItemTemplate>
                                                <SelectedItemStyle BackColor="#CC3333" Font-Bold="true" ForeColor="White" />
                                            </asp:DataList>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlCheckOut" runat="server"  ScrollBars="Auto" Height="500px" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" Visible="false" >
                                            <table style="width:250px;">
                                                <tr>
                                                    <td align="left">
                                                        Name:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCustomerName" runat="server" Width="225px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="txtCustomerName"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td align="left">
                                                        Phone No:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCustomerPnoneNo" runat="server" Width="225px" MaxLength="10" ></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustomerPnoneNo"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td align="left">
                                                        Email ID:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCustomerEmailID" runat="server" Width="225px"  ></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCustomerEmailID"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        Address:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtCustomerAddress" runat="server" Width="225px" Height="80px" TextMode="MultiLine" ></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCustomerAddress"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td align="left">
                                                        Total Products:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtTotalProducts" runat="server" ReadOnly="true" Width="225px" ></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTotalProducts"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td align="left">
                                                        Total Price:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtTotalPrice" runat="server" ReadOnly="true" Width="225px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="txtTotalPrice"
                                                             ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td align="left">
                                                        Payment Mode:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:RadioButtonList ID="rblPaymentMethod" runat="server" >
                                                            <asp:ListItem Selected="True" Value="1">1.Cash on Delivery</asp:ListItem>
                                                            <asp:ListItem  Value="2">2.Payment Gateway</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" 
                                                            Width="90px" Style="font-weight:700" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ControlToValidate="txtCustomerEmailID" 
                                                             ErrorMessage="Please Enter Valid Email ID" ForeColor="Red"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false">
                                            <div style="text-align:center">
                                                <br />
                                                <br />
                                                <br />
                                                 <br />
                                                <br />
                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/empty-cart.gif" Width="500px" />
                                                <br />
                                                 <br />
                                                <br />
                                                <br />
                                                 <br />
                                            </div>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlOrderPlacedSucessfully" runat="server" Visible="false">
                                            <div style="text-align:center;">
                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/image1.jpeg" Width="500px" /><br />
                                                <br />
                                                <label>Order Placed Sucessfully.</label>
                                                <br />
                                                <br />
                                                Transation Details Are Sent At Email Provided By You<br />
                                                <br /><br />
                                                <asp:Label ID="lblTransationNo" runat="server" Style="font-weight:700"></asp:Label>
                                                <br />
                                                <a href="TrackYourOrder.aspx" target="_blank">Track Your Transation Details Here</a>
                                                <br /><br />
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" style="border:thin ridge #9900FF">
                                          &nbsp;&copy;<a href="Default.aspx">MyShoppingCar.blogspot.com</a>||
                                        <a href="Admin/Login.aspx">AdminPanel</a>||
                                        <a href="TrackYourOrder.aspx" target="_blank">Track Your Order</a><br /><br /><br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
 </body>
</html>
