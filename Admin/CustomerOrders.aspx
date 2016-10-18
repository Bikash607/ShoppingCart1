<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CustomerOrders.aspx.cs" Inherits="ShoppingCart1.Admin.CustomerOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlacrHolder1" runat="server">
    <div align="center">
        <asp:Label runat="server" ID="lblTitle" Style="font-weight:700">Customer Orders</asp:Label>
    </div>
    <table align="center" cellspacing="1" style="width:100%;background-color:#FFFFFF">
        <tr>
            <td align="center">

                <asp:GridView ID="gvCustomerOrders" runat="server" AutoGenerateColumns="false" Width="100%"
                     BackColor="White" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1">
                   <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID"   ItemStyle-Width="100" />
                        <asp:BoundField DataField="CustomerName" HeaderText="Name" ItemStyle-Width="150" />
                        <asp:BoundField DataField="CustomerPhoneNo" HeaderText="PhoneNo" ItemStyle-Width="20" />
                        <asp:BoundField DataField="TotalProducts" HeaderText="Products" ItemStyle-Width="150" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Price" ItemStyle-Width="150" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("ID","~/Admin/OrderDetails.aspx?Id={0}")%>'
                                     Text="View Details" Target="_blank">
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                   </Columns>
                    <HeaderStyle BackColor="#0066ff" ForeColor="#ff0000" />
                    <FooterStyle BackColor="#99ff33" ForeColor="#cc00cc" />
                    <RowStyle BackColor="#ffff99" ForeColor="Blue" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="#66ccff" ForeColor="#ff3300" HorizontalAlign="Center" />

                </asp:GridView>
            </td>
        </tr>

    </table>
</asp:Content>
