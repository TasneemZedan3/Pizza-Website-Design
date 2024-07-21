<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignInPage.aspx.cs" Inherits="projectT.SignInPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In</title>
    <style type="text/css">
        body {
            background-image: url('sowar/bgg.jpg');
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: antiquewhite;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .container h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group input[type="password"] {
            font-family: 'Courier New', Courier, monospace;
        }
        .btn {
            display: inline-block;
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: dimgrey;
        }
        .message {
            color: red;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>PLEASE SIGN IN TO YOUR ACCOUNT</h1>
            <div class="form-group">
                <label for="signInTxt1">Username:</label>
                <asp:TextBox ID="signInTxt1" runat="server" CssClass="form-control" Width="380px" />
            </div>
            <div class="form-group">
                <label for="Txt2">Password:</label>
                <asp:TextBox ID="Txt2" runat="server" TextMode="Password" CssClass="form-control" Width="380px" />
            </div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SIGN IN" CssClass="btn" />
            <asp:Label ID="lm" runat="server" CssClass="message"></asp:Label>
        </div>
    </form>
</body>
</html>
