<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="adminHomeMaster.aspx.cs" Inherits="projectT.adminHomeMaster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .content {
            background-image: url('sowar/HBG.jpg'); /* Replace with the actual path to your background image */
            background-repeat: no-repeat;
            background-size: cover;
            padding: 200px; /* Add some padding for better spacing */
        }
        
        .order-button {
            display: block;
            width: 200px;
            margin: 0 auto; /* Center the button */
            padding: 15px;
            background-color: #CC0000;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease; /* Add smooth transition on hover */
        }
        
        .order-button:hover {
            background-color: #FF3333; /* Change color on hover */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="Medium" Font-Underline="True" Text="Custmores Data:"></asp:Label>
            <br />
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Username" DataSourceID="SqlDataSource1" Height="271px" Width="466px">
                <Columns>
                    <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                    <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Firstname], [Username], [Email], [Lastname], [Phone], [City] FROM [Users] ORDER BY [Firstname]"></asp:SqlDataSource>
        </p>
    </div>
</asp:Content>
