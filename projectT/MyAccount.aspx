<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="projectT.MyAccount" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* Simplified CSS */
        .form-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .form-container input[type=text] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box; /* Ensure that padding and border are included in the element's total width and height */
        }
        .form-container input[type=button] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: none;
            border-radius: 3px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        .form-container input[type=button]:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <asp:Label ID="Label9" runat="server" Text="Username"></asp:Label>:<asp:TextBox ID="txtUsername" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Firstname"></asp:Label>:<asp:TextBox ID="txtFname" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Lastname"></asp:Label>:<asp:TextBox ID="txtLname" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>:<asp:TextBox ID="txtEmail" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        <asp:Label ID="Label4" runat="server" Text="Phone"></asp:Label>:<asp:TextBox ID="txtPhone" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        <asp:Label ID="Label5" runat="server" Text="City"></asp:Label>:<asp:TextBox ID="txtCity" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" CssClass="btn-edit" />
        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" CssClass="btn-save" />
        <asp:Label ID="Label11" runat="server"></asp:Label>
        <asp:Label ID="Label12" runat="server"></asp:Label>
    </div>
</asp:Content>