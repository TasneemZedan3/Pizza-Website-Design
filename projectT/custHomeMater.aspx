<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="custHomeMater.aspx.cs" Inherits="projectT.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .content {
            background-image: url('sowar/bgg.jpg'); /* Replace with the actual path to your background image */
            background-repeat: no-repeat;
            background-size: cover;
            padding: 150px; /* Add some padding for better spacing */
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
        <!-- Add some spacing -->
        <br />
        <br />
        <br />
        <br />
        <!-- Button with improved styling -->
        <asp:Button ID="Button1" CssClass="order-button" runat="server" Text="ORDER NOW!" OnClick="Button1_Click1" />
    </div>
</asp:Content>