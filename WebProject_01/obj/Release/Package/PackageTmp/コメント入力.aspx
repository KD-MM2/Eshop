<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="コメント入力.aspx.cs" Inherits="WebProject_01.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style4 {
            height: 23px;
            width: 503px;
            table-layout: auto;
        }
        .auto-style7 {
            font-size: x-large;
            color: #FF0000;
        }
        .auto-style9 {
            width: 503px;
            height: 31px;
        }
        .auto-style10 {
            width: 503px;
            height: 31px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span style="color: rgb(0, 0, 0); font-family: Meiryo; font-size: x-large; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">グルメスポット[コメント入力]<br />
            </span>
            <table class="auto-style4" style="padding: inherit; border-style: solid; border-width: thin; background-color: #99CCFF; border-collapse: collapse; border-spacing: inherit; line-height: normal; vertical-align: inherit; text-align: inherit;">
                <tr>
                    <td class="auto-style9" style="border: thin dotted #999999; background-color: #0099FF;">店舗コード</td>
                    <td class="auto-style9" style="border: thin dotted #999999; background-color: #0099FF;">
                        <asp:Label ID="Label_店舗コード" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" style="border: thin dotted #999999; background-color: #0099FF;">店舗名</td>
                    <td class="auto-style9" style="border: thin dotted #999999; background-color: #0099FF;">
                        <asp:Label ID="Label_店舗名" runat="server" Text="Label" CssClass="auto-style7"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" style="border: thin dotted #999999; background-color: #0099FF;">評価</td>
                    <td class="auto-style9" style="border: thin dotted #999999; background-color: #0099FF;">
                        <asp:ListBox ID="ListBox1" runat="server" Height="133px" Width="216px">
                            <asp:ListItem Value="0">0 : 評価なし</asp:ListItem>
                            <asp:ListItem Value="1">1 : あまりお勧めしません</asp:ListItem>
                            <asp:ListItem Value="2">2 : 普通だった</asp:ListItem>
                            <asp:ListItem Value="3">3 : 美味しいが高い</asp:ListItem>
                            <asp:ListItem Value="4">4 : 私は気に入った</asp:ListItem>
                            <asp:ListItem Value="5">5 : 絶対お勧め</asp:ListItem>
                        </asp:ListBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" style="border: thin dotted #999999; background-color: #0099FF;">コメント</td>
                    <td class="auto-style9" style="border: thin dotted #999999; background-color: #0099FF;">
                        <asp:TextBox ID="TextBox4" runat="server" Width="256px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10" colspan="2" style="border: thin dotted #999999; background-color: #0099FF;">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="戻る" Height="30px" Width="65px" />
&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="登録" Height="30px" OnClick="Button2_Click" Width="65px" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:グルメDB_ConnectionString %>" SelectCommand="SELECT * FROM グルメテーブル WHERE 店舗コード=@店舗コード ORDER BY 評価" UpdateCommand="UPDATE グルメテーブル SET 評価=@評価, コメント=@コメント WHERE 店舗コード=@店舗コード">
                <SelectParameters>
                    <asp:Parameter Name="店舗コード" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="評価" />
                    <asp:Parameter Name="コメント" />
                    <asp:Parameter Name="店舗コード" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
