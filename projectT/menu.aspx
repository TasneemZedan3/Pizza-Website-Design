<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="projectT.menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            text-align: center;
            height: 41px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style2">
            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#CC0000" Text="MENU"></asp:Label>
            <br />
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="(view only to order please sign up/in first)"></asp:Label>
            <br />
            <table cellpadding="5" cellspacing="5" class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="Image1" runat="server" Height="240px" ImageUrl="~/sowar/chickenranch.png" Width="240px" />
                        <br />
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Chicken Ranch"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Image ID="Image2" runat="server" Height="240px" ImageUrl="~/sowar/bbqchicken.png" Width="240px" />
                        <br />
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="BBQ Chicken"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Image ID="Image3" runat="server" Height="240px" ImageUrl="~/sowar/Hot-Dog.png" Width="240px" />
                        <br />
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Hot Dog"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label14" runat="server" Font-Bold="True" Text="125 EGP"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="125 EGP"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Text="130 EGP"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="Image4" runat="server" Height="240px" ImageUrl="~/sowar/mixedcheese.png" Width="240px" />
                        <br />
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Mixed Cheese"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Image ID="Image5" runat="server" Height="240px" ImageUrl="~/sowar/Western.png" Width="240px" />
                        <br />
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Western Burger Pizza"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Image ID="Image6" runat="server" Height="240px" ImageUrl="~/sowar/Super-Sriracha.png" Width="240px" />
                        <br />
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Super Siracha"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="125 EGP"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="135 EGP"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text=" 145 EGP"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
