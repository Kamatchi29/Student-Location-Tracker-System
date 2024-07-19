﻿<%@ Page Language="C#" MasterPageFile="~/studenthome.master" AutoEventWireup="true" CodeFile="leavestatus.aspx.cs" Inherits="leavestatus" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
             <asp:BoundField DataField="semester" HeaderText="Semester" /> 
             <asp:BoundField DataField="phoneno" HeaderText="Phoneno" /> 
             <asp:BoundField DataField="emailid" HeaderText="Email ID" /> 
                <asp:BoundField DataField="leaveplace" HeaderText="Leave Place" /> 
             <asp:BoundField DataField="leavereason" HeaderText="Leave Reason" /> 
             <asp:BoundField DataField="nodays" HeaderText="No of days" /> 
             <asp:BoundField DataField="leavedate" HeaderText="Date" /> 
             <asp:BoundField DataField="status" HeaderText="Status" /> 
            
             </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        </asp:GridView>
   
</div>
</asp:Content>

