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
    <asp:SqlDataSource ID="SqlDataSource_order" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDB_ConnectionString %>" InsertCommand="INSERT INTO [order] VALUES order_no=@order_no, customer_id=@customer_id, date=@date, order_sts=@order_sts" SelectCommand="SELECT MAX(order_no) AS order_no_max FROM [order]">
        <InsertParameters>
            <asp:Parameter Name="order_no" />
            <asp:Parameter Name="customer_id" />
            <asp:Parameter Name="date" />
            <asp:Parameter Name="order_sts" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_order_detail" runat="server" ConnectionString="<%$ ConnectionStrings:eshopDB_ConnectionString %>" InsertCommand="INSERT INTO [order_detail]
VALUES order_no=@order_no, item_id=@item_id, quantity=@quantity
WHERE order_no=@order_no, item_id=@item_id" SelectCommand="SELECT order_no, item_id, quantity 
FROM order_detail
WHERE order_no=@order_no AND item_id=@item_id" UpdateCommand="UPDATE [order_detail] 
SET quantity=@quantity 
WHERE order_no=@order_no AND order_item=@order_item">
        <InsertParameters>
            <asp:SessionParameter Name="order_no" SessionField="order_no" />
            <asp:Parameter Name="item_id" />
            <asp:Parameter Name="quantity" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="order_no" />
            <asp:Parameter Name="item_id" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="quantity" />
            <asp:SessionParameter Name="order_no" SessionField="order_no" />
            <asp:Parameter Name="order_item" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
<asp:DataList ID="DataList1" runat="server" DataKeyField="item_id" DataSourceID="SqlDataSource_item" RepeatColumns="2" RepeatDirection="Horizontal" CellSpacing="1" Height="150px" Width="300px" OnItemCommand="DataList1_ItemCommand">
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
                    <asp:Button ID="Button2" runat="server" Text="カートに入れる" OnClick="Button2_Click" CssClass="auto-style1" Height="25px" Width="120px" CommandArgument='<%# Eval("item_id") %>' />
                </td>
            </tr>
        </table>
<br />
    </ItemTemplate>
</asp:DataList>
<br />
</asp:Content>
