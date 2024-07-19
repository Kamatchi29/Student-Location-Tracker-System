<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sendevents.aspx.cs" Inherits="sendevents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    
   
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Student Location Tracker System in Android</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">                                   
    <link rel="stylesheet" href="css/templatemo-style.css">    
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

            document.getElementById('TextBox11').value = getVal;
            document.getElementById('TextBox12').value = getVal1;
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
</head>
<body>
    <form id="form1" runat="server">
 <div>
    
        <div class="tm-header">
            <div class="container-fluid">
                <div class="tm-header-inner">
                    
                    <!-- navbar -->
                    <nav class="navbar tm-main-nav">

                        <button class="navbar-toggler hidden-md-up" type="button" data-toggle="collapse" data-target="#tmNavbar">
                            &#9776;
                        </button>
                        
                        <div class="collapse navbar-toggleable-sm" id="tmNavbar">
                            <ul class="nav navbar-nav">
                                <li class="nav-item">
                                    <a href="viewprofile.aspx" class="nav-link">Profile</a>
                                </li>
                                   <li class="nav-item">
                                    <a href="sendleave.aspx" class="nav-link">Send Leave</a>
                                </li>
                                <li class="nav-item">
                                    <a href="sendevent.aspx" class="nav-link">Send Event</a>
                                </li>
                                <li class="nav-item">
                                    <a href="leavestatus.aspx" class="nav-link">Leave Status</a>
                                 </li>
                                  <li class="nav-item">
                                    <a href="eventstatus.aspx" class="nav-link">Event Status</a>
                                 </li>
                                  <li class="nav-item">
                                    <a href="studentlogin.aspx" class="nav-link">Logout</a>
                                 </li>
                            </ul>                        
                        </div>
                    </nav>  

                </div>                                  
            </div>            
        </div>

        <div class="tm-about-img-container">
            
        </div>

        <section class="tm-section">
            <div class="container-fluid">
               
                
                <div class="row tm-margin-t-mid">
                    <div class="col-xs-12">
                      
    <div>
    <div class="form-style-6">
<h1>Student Details</h1>
 <asp:Label ID="lblResult" runat="server"></asp:Label>
    <asp:Label ID="lblResult1" runat="server"></asp:Label>
     <p id="p1" runat="server">
    </p>
    
    <p id="p2" runat="server"></p>
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
<asp:TextBox ID="TextBox11" runat="server"  ></asp:TextBox>
<asp:TextBox ID="TextBox12" runat="server" ></asp:TextBox>

<asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click1" ValidationGroup="admin" />
<div id="dvMap" style="width: 10px; height: 10px">

     
      
</div>
 </div>
                </div>

               

            </div>
        </section>
        
        <footer class="tm-footer">
            <div class="container-fluid">
                <div class="row">
                    
                  
                </div>

                <div class="row">
                    <div class="col-xs-12 tm-copyright-col">
                  
                    </div>
                </div>
            </div>
        </footer>

        <!-- load JS files -->
        <script src="js/jquery-1.11.3.min.js"></script>           
        <script src="https://www.atlasestateagents.co.uk/javascript/tether.min.js"></script>
        <script src="js/bootstrap.min.js"></script> 
    </form>
</body>
</html>
