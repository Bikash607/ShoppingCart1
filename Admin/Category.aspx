﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="ShoppingCart1.Admin.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlacrHolder1" runat="server">
    <div align="center" style="background-color:lightyellow;border:4px double blue">

        <div style="width:100%;background-color:chocolate;color:aliceblue">
             <asp:Label ID="lblCategories" runat="server" Text="All Categories" Style="font-weight:700;font-size:25px; width:100%"></asp:Label>
        </div>
        <asp:GridView ID="gvAvailableCategories" runat="server" ShowHeader="true" Width="40%"  CellPadding="10" CellSpacing="5"  
            AutoGenerateDeleteButton="false" AutoGenerateEditButton="false" AutoGenerateSelectButton="false">
            <HeaderStyle BackColor="YellowGreen"  ForeColor="White"  Font-Size="20px" Font-Names="Vedena" />
            <AlternatingRowStyle  ForeColor="DarkBlue" BackColor="LightSalmon" />
            <RowStyle BackColor="Lime" ForeColor="DarkBlue" BorderColor="LightYellow" />
        </asp:GridView>

    </div>
</asp:Content>
