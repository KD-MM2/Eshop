<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="1-3choice.aspx.cs" Inherits="WebProject_01.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style6 {
        width: 267px;
    }
    .auto-style7 {
        width: 100px;
    }
    .auto-style8 {
        color: #3366FF;
        font-size: medium;
    }
    .auto-style9 {
        color: #990099;
    }
    .auto-style10 {
        color: #660066;
    }
        .auto-style11 {
            width: 330px;
            height: 150px;
        }
        .auto-style12 {
            text-align: left;
        }
        .auto-style13 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource_item" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDB_ConnectionString %>" SelectCommand="SELECT item_id, item_name, price * 1.1 AS PriceWithTax, imgurl
FROM item"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_order" runat="server"></asp:SqlDataSource>
<asp:DataList ID="DataList1" runat="server" DataKeyField="item_id" DataSourceID="SqlDataSource_item" RepeatColumns="2" RepeatDirection="Horizontal" CellSpacing="1" Height="150px" Width="300px">
    <ItemStyle Wrap="False" />
    <ItemTemplate>
        <table class="auto-style11" style="border-style: none none solid none; border-width: medium; border-color: #666666;">
            <tr>
                <td class="auto-style12">
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("imgurl") %>' Width="100px" ImageAlign="Left" />
                </td>
                <td class="auto-style13"><strong>
                    <asp:Label ID="item_nameLabel" runat="server" CssClass="auto-style8" Text='<%# Eval("item_name") %>' />
                    </strong>
                    <br />
                    <asp:Label ID="item_idLabel" runat="server" CssClass="auto-style9" Text='<%# Eval("item_id") %>' />
                    <br />
                    <br />
                    <strong>
                    <asp:Label ID="PriceWithTaxLabel" runat="server" CssClass="auto-style10" Text='<%# Eval("PriceWithTax", "税込価格：{0:#,###,##0}円") %>' />
                    </strong>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="カートに入れる" OnClick="Button2_Click" CssClass="auto-style1" Height="25px" Width="120px" />
                </td>
            </tr>
        </table>
<br />
    </ItemTemplate>
</asp:DataList>
<br />
</asp:Content>
