<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="店舗一覧.aspx.cs" Inherits="WebProject_01.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 43%;
        }
        .auto-style2 {
            width: 127px;
            text-align: right;
            height: 33px;
            background-color: #66FFFF;
        }
        .auto-style5 {
            text-align: center;
            height: 39px;
        }
        .auto-style6 {
            height: 33px;
            background-color: #66FFFF;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>グルメスポット</h2>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#FFFF66" BorderColor="#FF3300" BorderStyle="Solid" ForeColor="Red" Width="592px" />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">店舗コード</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox_店舗コード" runat="server" Width="93px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_店舗コード" runat="server" ControlToValidate="TextBox_店舗コード" ErrorMessage="店舗コードは必ず入力してください。" Display="None" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">店舗名</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TextBox_店舗名" runat="server" Width="230px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_店舗名" runat="server" ErrorMessage="店舗名が入力されていません。" ControlToValidate="TextBox_店舗名" CssClass="auto-style8" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="2">
                        <asp:Button ID="Button_登録" runat="server" CssClass="auto-style5" Height="27px" OnClick="Button1_Click" Text="登録" Width="77px" />
                    </td>
                </tr>
            </table>
            <br />
            <h2>店舗一覧</h2>
            <div class="auto-style7">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="店舗コード" DataSourceID="SqlDataSource_グルメテーブル" GridLines="None" Width="640px" OnRowCommand="GridView1_RowCommand" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="店舗コード" HeaderText="店舗コード" ReadOnly="True" SortExpression="店舗コード" />
                    <asp:BoundField DataField="店舗名" HeaderText="店舗名" SortExpression="店舗名" />
                    <asp:TemplateField HeaderText="評価" SortExpression="評価">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("評価") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Hyouka(Convert.ToInt32(Eval("評価 "))) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="コメント" HeaderText="コメント" SortExpression="コメント" />
                    <asp:ButtonField ButtonType="Button" CommandName="cmd_Select" HeaderText="選択" ShowHeader="True" Text="選択" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            </div>
            <br />
            <asp:SqlDataSource ID="SqlDataSource_グルメテーブル" runat="server" ConnectionString="<%$ ConnectionStrings:グルメDB_ConnectionString %>" InsertCommand="INSERT INTO グルメテーブル (店舗コード, 店舗名, 評価, コメント)
VALUES (@店舗コード, @店舗名, @評価, @コメント)" SelectCommand="SELECT * FROM グルメテーブル
ORDER BY 評価 DESC">
                <InsertParameters>
                    <asp:Parameter Name="店舗コード" />
                    <asp:Parameter Name="店舗名" />
                    <asp:Parameter Name="評価" />
                    <asp:Parameter Name="コメント" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
