<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ProductStock.aspx.cs" Inherits="ShoppingCart1.Admin.ProductStock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlacrHolder1" runat="server">
    <div align="center">
        <asp:Label ID="lblTitle" runat="server" Style="font-weight:700">Product Stock</asp:Label>
        <hr />
    </div>
    <table align="center" cellspacing="1" style="width:100%;background-color:#FFFFFF">
        <tr>
            <td align="center">
                <asp:DropDownList ID="ddlCatagory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCatagory_SelectedIndexChanged" Width="300Px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="pnlProductStockReport" runat="server">
                    <hr />
                    <asp:RadioButtonList runat="server" ID="rblProductStock" AutoPostBack="true" RepeatDirection="Horizontal"
                         OnSelectedIndexChanged="rblProductStock_SelectedIndexChanged" Style="font-weight:700">
                        <asp:ListItem Selected="True" Value="0">Out of Stock</asp:ListItem>
                        <asp:ListItem  Value="1">Limited Stock</asp:ListItem>
                        <asp:ListItem  Value="2">Enough Stock</asp:ListItem>
                    </asp:RadioButtonList>
                    <hr />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <div id="NoRecordsToDisplay" runat="server" visible="false">
                    <asp:Label ID="Label1" runat="server" Style="font-weight:700" ForeColor="Red">No Records Available</asp:Label>
                </div>
                <asp:GridView ID="gvAvailableStock" runat="server" BorderWidth="2px" BorderStyle="Ridge" Width="100%" AutoGenerateColumns="False" 
                    CellPadding="3" CellSpacing="1" GridLines="None" BackColor="White" BorderColor="White" >
                    <Columns>
                        <asp:BoundField HeaderText="Product Name" DataField="Name" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Product Category" DataField="CategoryName" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Available Stock" DataField="AvailableStock" ItemStyle-Width="150"
                             ItemStyle-Font-Bold="true" ControlStyle-Font-Size="Large" >
<ControlStyle Font-Size="Large"></ControlStyle>

<ItemStyle Font-Bold="True" Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Price" DataField="Price" ItemStyle-Width="100" >
<ItemStyle Width="100px"></ItemStyle>
                        </asp:BoundField>
                       <asp:ImageField DataImageUrlField="ImageUrl" HeaderText="Product Image" ControlStyle-Width="150">
<ControlStyle Width="150px"></ControlStyle>
                        </asp:ImageField>
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
