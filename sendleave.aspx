<%@ Page Language="C#" MasterPageFile="~/studenthome.master" AutoEventWireup="true" CodeFile="sendleave.aspx.cs" Inherits="sendleave" Title="Untitled Page" %>


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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(p) {
            var LatLng = new google.maps.LatLng(p.coords.latitude, p.coords.longitude);
            var mapOptions = {
                center: LatLng,
                zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);


            document.getElementById('lblResult').innerHTML = p.coords.latitude;
            document.getElementById('lblResult1').innerHTML = p.coords.longitude;
            var getVal = document.getElementById("<%=lblResult.ClientID %>").innerHTML
            var getVal1 = document.getElementById("<%=lblResult1.ClientID %>").innerHTML

            document.getElementById('TextBox10').value = getVal;
            document.getElementById('TextBox11').value = getVal1;
            var marker = new google.maps.Marker({
                position: LatLng,
                map: map,
                title: "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: " + p.coords.latitude + "<br />Longitude: " + p.coords.longitude

            });
            google.maps.event.addListener(marker, "click", function(e) {
                var infoWindow = new google.maps.InfoWindow();
                infoWindow.setContent(marker.title);
                infoWindow.open(map, marker);
                document.write(p.coords.latitude);
            });

        });
    } else {
        alert('Geo Location feature is not supported in this browser.');
    }
</script>
 <div class="form-style-6">
<h1>Student Details</h1>
<asp:Label ID="lblResult" runat="server"  ></asp:Label>
    <asp:Label ID="lblResult1" runat="server" ></asp:Label>
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

<asp:TextBox ID="TextBox6" runat="server" placeholder="Leave Place" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ControlToValidate="TextBox6" ValidationGroup="admin"></asp:RequiredFieldValidator>

<asp:TextBox ID="TextBox7" runat="server" placeholder="Leave Reason" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="TextBox7" ValidationGroup="admin"></asp:RequiredFieldValidator>

<asp:TextBox ID="TextBox8" runat="server" placeholder="No of Days" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="TextBox8" ValidationGroup="admin"></asp:RequiredFieldValidator>

<asp:TextBox ID="TextBox9" runat="server" placeholder="Leave Date" ValidationGroup="admin"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="TextBox9" ValidationGroup="admin"></asp:RequiredFieldValidator>
<asp:TextBox ID="TextBox10" runat="server" ></asp:TextBox>
<asp:TextBox ID="TextBox11" runat="server" ></asp:TextBox>

<asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click1" ValidationGroup="admin" />
<div id="dvMap" style="width: 200px; height: 200px">

     
      
</div>
</form>
</div>

</asp:Content>

