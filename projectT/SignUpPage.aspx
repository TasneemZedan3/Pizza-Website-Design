<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpPage.aspx.cs" Inherits="projectT.SignUpPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <style type="text/css">
        body {
            background-image: url('sowar/bgg.jpg');
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }
        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input,
        .form-group select {
            width: calc(100% - 10px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group .error-message {
            color: red;
            font-size: 0.9em;
            margin-top: 5px;
        }
        .form-group .file-upload {
            border: none;
            padding-left: 0;
        }
        .form-group .submit-btn {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #5cb85c;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        .form-group .submit-btn:hover {
            background-color: #4cae4c;
        }
        .message {
            text-align: center;
            margin-top: 20px;
            font-size: 1.2em;
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h1>Sign Up</h1>
            <div class="form-group">
                <label for="TextBox1USER">Username:</label>
                <asp:TextBox ID="TextBox1USER" runat="server" CssClass="input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1USER" ErrorMessage="This Field is Required" CssClass="error-message"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox1USER" ErrorMessage="Must be 8 characters or more!" ValidationExpression="\w{8,}" CssClass="error-message"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="TextBox2">First name:</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="This Field is Required" CssClass="error-message"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="First Letter must be Capital" ValidationExpression="([A-Z][a-z]*)" CssClass="error-message"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="TextBox3">Last name:</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="This Field is Required" CssClass="error-message"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="First Letter must be Capital" ValidationExpression="([A-Z][a-z]*)" CssClass="error-message"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="TextBox4">Email:</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="This Field is Required" CssClass="error-message"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="TextBox5">Phone:</label>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="This Field is Required" CssClass="error-message"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="DropDownList1">City:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="input">
                    <asp:ListItem>Cairo</asp:ListItem>
                    <asp:ListItem>Alexandria</asp:ListItem>
                    <asp:ListItem>Kafr El Sheikh</asp:ListItem>
                    <asp:ListItem>Portsaid</asp:ListItem>
                    <asp:ListItem>Tanta</asp:ListItem>
                    <asp:ListItem>Sharm El Sheikh</asp:ListItem>
                    <asp:ListItem>Al Menya</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="TextBox8">Password:</label>
                <asp:TextBox ID="TextBox8" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox8" ErrorMessage="This Field is Required" CssClass="error-message"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox8" ErrorMessage="Must be from 8 to 12 Characters" ValidationExpression="\w{8,12}" CssClass="error-message"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group file-upload">
                <label for="FUP1">Upload photo:</label>
                <asp:FileUpload ID="FUP1" runat="server" CssClass="input" />
            </div>
            <div class="form-group">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SIGN UP" CssClass="submit-btn" />
            </div>
            <div class="message">
                <asp:Label ID="Lmssg" runat="server"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>