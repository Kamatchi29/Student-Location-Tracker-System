<%@ Page Language="C#" MasterPageFile="~/staffhome.master" AutoEventWireup="true" CodeFile="updatestudent.aspx.cs" Inherits="updatestudent" Title="Untitled Page" %>

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
    background:#c9302c;
    padding: 20px 0;
    font-size: 140%;
    font-weight: 300;
    text-align: center;
    color: White;
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
    background:#c9302c;
    border-bottom: 2px solid #30C29E;
    border-top-style: none;
    border-right-style: none;
    border-left-style: none;   
    color: #fff;
}
.form-style-6 input[type="submit"]:hover,
.form-style-6 input[type="button"]:hover{
    background:#c9302c;
}
</style>
 <script language="javascript" type="text/javascript">
     function accept(id)
    {
    location.href='updatestudent.aspx?id='+id;
    }
      function view(id1)
    {
    location.href='updatestudent.aspx?id1='+id1;
    }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div class="form-style-6">
<h1>Update Student</h1>
<form>
<asp:TextBox ID="TextBox1" runat="server" placeholder="Student Name"></asp:TextBox>
<asp:TextBox ID="TextBox3" runat="server" placeholder="Student Rollno"></asp:TextBox>
<asp:TextBox ID="TextBox2" runat="server" placeholder="Password" ></asp:TextBox>

<asp:DropDownList ID="DropDownList2" runat="server">
<asp:ListItem Text="Select Department"></asp:ListItem>

<asp:ListItem Text="B.Sc(CS)"></asp:ListItem>
<asp:ListItem Text="B.Sc(IT)"></asp:ListItem>
<asp:ListItem Text="BCA"></asp:ListItem>
<asp:ListItem Text="M.Sc(CS)"></asp:ListItem>
<asp:ListItem Text="MCA"></asp:ListItem>
</asp:DropDownList>


<asp:TextBox ID="TextBox4" runat="server" placeholder="Phoneno"></asp:TextBox>
<asp:TextBox ID="TextBox5" runat="server" placeholder="Emailid"></asp:TextBox>
<asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click1"/>

</form>
</div>
 <div id = "dvGrid" style ="padding:10px;width:100%; overflow:scroll; height:100%">

<asp:GridView ID="GridView1" runat="server" BackColor="White" AutoGenerateColumns="False"
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="762px" 
        onselectedindexchanged="GridView1_SelectedIndexChanged1" Height="148px" 
                            OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True"
       PageSize="3" >
            <RowStyle BackColor="White" ForeColor="#003399" />
            <Columns>
             <asp:BoundField DataField="id" HeaderText="ID" />
             <asp:BoundField DataField="studentname" HeaderText="Student Name" />   
             <asp:BoundField DataField="studentrollno" HeaderText="Rollno" />                
             <asp:BoundField DataField="department" HeaderText="Department" />      
             <asp:BoundField DataField="phoneno" HeaderText="Phoneno" /> 
             <asp:BoundField DataField="emailid" HeaderText="Email ID" /> 
               
             <asp:TemplateField HeaderText="">
                 <ItemTemplate>
                    <a href="javascript:accept('<%# DataBinder.Eval(Container.DataItem,"id")%>')" ><h3 style="color:black">
                         View</h3></a>
                      </ItemTemplate>
             </asp:TemplateField>
                 <asp:TemplateField HeaderText="">
                 <ItemTemplate>
                    <a href="javascript:view('<%# DataBinder.Eval(Container.DataItem,"id")%>')" ><h3 style="color:black">
                         Delete</h3></a>
                      </ItemTemplate>
             </asp:TemplateField>
             </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        </asp:GridView>
   
</div>

</asp:Content>

