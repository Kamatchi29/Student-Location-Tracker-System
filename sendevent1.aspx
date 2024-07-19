<%@ Page Language="C#" MasterPageFile="~/studenthome.master" AutoEventWireup="true" CodeFile="sendevent1.aspx.cs" Inherits="sendevent" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
.form-style-6{
    font: 75% Arial, Helvetica, sans-serif;
    max-width: 400px;
    margin: 10px auto;
    padding: 16px;
    background: #F7F7F7;
}
.form-style-6 h1{
    background:#87A96B;
    padding: 20px 0;
    font-size: 140%;
    font-weight: 300;
    text-align: center;
    color: #fff;
    margin: -16px -16px 16px -16px;
}
.form-style-6 input[type="text"],
.form-style-6 input[type="password"],
.form-style-6 input[type="date"],
.form-style-6 input[type="datetime"],
.form-style-6 input[type="email"],
.form-style-6 input[type="number"],
.form-style-6 input[type="search"],
.form-style-6 input[type="time"],
.form-style-6 input[type="url"],
.form-style-6 textarea,
.form-style-6 select
{
    -webkit-transition: all 0.30s ease-in-out;
    -moz-transition: all 0.30s ease-in-out;
    -ms-transition: all 0.30s ease-in-out;
    -o-transition: all 0.30s ease-in-out;
    outline: none;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 100%;
    background: #fff;
    margin-bottom: 4%;
    border: 1px solid #ccc;
    padding: 3%;
    color: #555;
    font: 95% Arial, Helvetica, sans-serif;
}
.form-style-6 input[type="text"]:focus,
.form-style-6 input[type="password"]:focus,
.form-style-6 input[type="date"]:focus,
.form-style-6 input[type="datetime"]:focus,
.form-style-6 input[type="email"]:focus,
.form-style-6 input[type="number"]:focus,
.form-style-6 input[type="search"]:focus,
.form-style-6 input[type="time"]:focus,
.form-style-6 input[type="url"]:focus,
.form-style-6 textarea:focus,
.form-style-6 select:focus
{
    box-shadow: 0 0 5px #87A96B;
    padding: 3%;
    border: 1px solid #43D1AF;
}
.form-style-6 input[type="submit"],
.form-style-6 input[type="button"]{
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 100%;
    padding: 3%;
    background:#87A96B;
    border-bottom: 2px solid #30C29E;
    border-top-style: none;
    border-right-style: none;
    border-left-style: none;   
    color: #fff;
}
.form-style-6 input[type="submit"]:hover,
.form-style-6 input[type="button"]:hover{
    background:#87A96B;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div class="form-style-6">
<h1>Student Details</h1>
<form>
<asp:TextBox ID="TextBox1" runat="server" placeholder="Student Name" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" ValidationGroup="admin"></asp:RequiredFieldValidator>
<asp:TextBox ID="TextBox2" runat="server" placeholder="Student Rollno" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" ValidationGroup="admin"></asp:RequiredFieldValidator>

<asp:TextBox ID="TextBox3" runat="server" placeholder="Department" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="TextBox3" ValidationGroup="admin"></asp:RequiredFieldValidator>


<asp:DropDownList ID="DropDownList2" runat="server" ValidationGroup="admin">
<asp:ListItem Text="Select Semester"></asp:ListItem>
<asp:ListItem Text="I"></asp:ListItem>
<asp:ListItem Text="II"></asp:ListItem>
<asp:ListItem Text="III"></asp:ListItem>
<asp:ListItem Text="IV"></asp:ListItem>
<asp:ListItem Text="V"></asp:ListItem>
<asp:ListItem Text="VI"></asp:ListItem>
<asp:ListItem Text="VII"></asp:ListItem>
<asp:ListItem Text="VIII"></asp:ListItem>
</asp:DropDownList>

<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="DropDownList2" ValidationGroup="admin"></asp:RequiredFieldValidator>

<asp:TextBox ID="TextBox4" runat="server" placeholder="Phoneno" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="TextBox4" ValidationGroup="admin"></asp:RequiredFieldValidator>

<asp:TextBox ID="TextBox5" runat="server" placeholder="Emailid" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="TextBox5" ValidationGroup="admin"></asp:RequiredFieldValidator>

<asp:TextBox ID="TextBox6" runat="server" placeholder="Event Place" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="TextBox6" ValidationGroup="admin"></asp:RequiredFieldValidator>

<asp:TextBox ID="TextBox7" runat="server" placeholder="Event Name" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="TextBox7" ValidationGroup="admin"></asp:RequiredFieldValidator>

<asp:TextBox ID="TextBox8" runat="server" placeholder="No of Participate" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="TextBox8" ValidationGroup="admin"></asp:RequiredFieldValidator>

<asp:TextBox ID="TextBox9" runat="server" placeholder="Participate Details" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="TextBox9" ValidationGroup="admin"></asp:RequiredFieldValidator>
<asp:TextBox ID="TextBox10" runat="server" placeholder="Event Date" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="TextBox10" ValidationGroup="admin"></asp:RequiredFieldValidator>

<asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click1" ValidationGroup="admin" />
</form>
</div></asp:Content>

