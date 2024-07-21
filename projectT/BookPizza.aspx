<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="BookPizza.aspx.cs" Inherits="projectT.BookPizza" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');

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
            color: #cc0000;
        }

        .form-container {
            width: 80%;
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .form-row {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .form-label {
            flex: 1;
            font-weight: bold;
            font-size: 1.1em;
            color: #cc0000;
        }

        .form-input {
            flex: 2;
        }

        .form-input input,
        .form-input select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
        }

        .form-button {
            text-align: center;
            margin-top: 20px;
        }

        .form-button input,
        .form-button button {
            padding: 10px 20px;
            background-color: #cc0000;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }

        .form-button input:hover,
        .form-button button:hover {
            background-color: #ff3333;
        }

        .gridview-container {
            margin: 40px auto;
            width: 90%;
            max-width: 800px;
        }

        .gridview-container .header {
            background-color: #cc0000;
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

        .form-message {
            text-align: center;
            color: #cc0000;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="page-title">PICK UP YOUR PIZZA</h1>
    <div class="form-container">
        <div class="form-row">
            <div class="form-label">
                <asp:Label ID="Label10" runat="server" Text="Pick up date:"></asp:Label>
            </div>
            <div class="form-input">
                <asp:TextBox ID="pickupdate" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            </div>
        </div>
        <div class="form-row">
            <div class="form-label">
                <asp:Label ID="Label11" runat="server" Text="Pick up branch:"></asp:Label>
            </div>
            <div class="form-input">
                <asp:DropDownList ID="DDLbranch" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Branch]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="form-row form-message">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <div class="form-row form-button">
            <asp:Button ID="ok" runat="server" OnClick="ok_Click" Text="OK" />
        </div>
    </div>
    <div class="gridview-container">
        <asp:GridView ID="GridViewMenu" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Name" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:CommandField ButtonType="Button" HeaderText="Choose" ShowHeader="True" ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle CssClass="header" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle CssClass="row" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Menuu]"></asp:SqlDataSource>
    </div>
    <div class="form-container">
        <div class="form-row">
            <div class="form-label">
                <asp:Label ID="Label12" runat="server" Text="Name of Reservation:"></asp:Label>
            </div>
            <div class="form-input">
                <asp:TextBox ID="nameOfReservationTxt" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="form-row form-button">
            <asp:Button ID="reserve" runat="server" Text="Reserve" OnClick="Button2_Click" />
        </div>
    </div>
    <div class="gridview-container">
                <asp:Label ID="Label13" runat="server" Text="Order History:" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
            <br />
        <asp:GridView ID="GridViewOrders" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle CssClass="header" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle CssClass="row" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </div>
    <div class="form-row form-button">
        <asp:Button ID="btnConfirm" runat="server" Text="Confirm Order" OnClick="btnConfirm_Click" />
    </div>
    <div class="form-row form-message">
        <asp:Label ID="lblCurrent" runat="server"></asp:Label>
    </div>
</asp:Content>