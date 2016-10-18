<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="IncomeReport.aspx.cs" Inherits="ShoppingCart1.Admin.IncomeReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlacrHolder1" runat="server">
    <div align="center">
        <asp:Label ID="lblTitle" runat ="server" Style="font-weight:700">Income Report</asp:Label>
    </div>
    <table align="center" cellspacing="1" style="width:100%;background-color:#FFFFFF" >
        <tr>
            <td align="center">
                 <asp:RadioButtonList runat="server" ID="rblIncomeFilter" AutoPostBack="true" RepeatDirection="Horizontal"
                         OnSelectedIndexChanged="rblIncomeFilter_SelectedIndexChanged" Style="font-weight:700">
                     <asp:ListItem Selected="True" Value="1">Today</asp:ListItem>
                      <asp:ListItem  Value="2">This Month</asp:ListItem>
                      <asp:ListItem  Value="3">This Year</asp:ListItem>
                 </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblIncome" runat ="server" ForeColor="Red" Style="font-weight:700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:GridView runat="server" ID="gvIncomeReport" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="CustomerName" HeaderText="Name" ItemStyle-Width="20" >
<ItemStyle Width="20px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="CustomerPnoneNo" HeaderText="Phone No" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalProducts" HeaderText="Total Products" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" ItemStyle-Width="150" >
<ItemStyle Width="150px"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>