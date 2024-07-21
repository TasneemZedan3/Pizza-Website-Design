<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="modifyMenu.aspx.cs" Inherits="projectT.modifyMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Pacifico&family=Roboto:wght@400;500;700&display=swap');
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css');

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #fffbf3;
            color: #333333;
            margin: 0;
            padding: 0;
        }

        .page-title {
            text-align: center;
            font-size: 2em;
            margin-top: 20px;
            font-family: 'Pacifico', cursive;
            color: #d35400;
        }

        .page-title .emoji {
            font-size: 1.5em;
            margin-right: 10px;
        }

        .menu-table {
            width: 80%;
            max-width: 800px;
            margin: 40px auto;
            border-collapse: collapse;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .menu-table th, .menu-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .menu-table th {
            background-color: #d35400;
            color: white;
            font-weight: 700;
        }

        .menu-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .menu-table tr:hover {
            background-color: #ffe6cc;
        }

        .header-label {
            font-size: 1.2em;
            font-weight: bold;
            color: #d35400;
            padding-left: 15px;
        }

        .dropdown-list {
            width: 100%;
            max-width: 220px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-left: 15px;
        }

        .gridview-container {
            margin: 20px auto;
            width: 90%;
            max-width: 800px;
        }

        .gridview-container .header {
            background-color: #d35400;
            color: white;
            font-weight: bold;
            text-align: center;
        }

        .gridview-container .row {
            background-color: #fffbd6;
            color: #333333;
        }

        .gridview-container .row:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview-container .row:hover {
            background-color: #ffcc99;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="page-title"><span class="emoji">🍕</span>Modify Menu<span class="emoji">🍕</span></h1>

    <table class="menu-table">
        <tr>
            <td class="header-label">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Choose The Pizza Type:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="typeDDL" runat="server" CssClass="dropdown-list" DataSourceID="SqlDataSource2" DataTextField="Type" DataValueField="Type" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
    </table>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Type] FROM [PizzaTypee]"></asp:SqlDataSource>

    <div class="gridview-container">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Name" DataSourceID="SqlDataSource1" GridLines="None" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />
                <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
            </Columns>
            <FooterStyle CssClass="footer-style" />
            <HeaderStyle CssClass="header" />
            <PagerStyle CssClass="footer-style" HorizontalAlign="Center" />
            <RowStyle CssClass="row" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Menuu] WHERE [Name] = @Name" 
        InsertCommand="INSERT INTO [Menuu] ([Name], [Price], [Stock], [Type]) VALUES (@Name, @Price, @Stock, @Type)" 
        SelectCommand="SELECT * FROM [Menuu] WHERE ([Type] = @Type)" 
        UpdateCommand="UPDATE [Menuu] SET [Price] = @Price, [Stock] = @Stock, [Type] = @Type WHERE [Name] = @Name">
        <DeleteParameters>
            <asp:Parameter Name="Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="String" />
            <asp:Parameter Name="Stock" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="typeDDL" Name="Type" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Price" Type="String" />
            <asp:Parameter Name="Stock" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>