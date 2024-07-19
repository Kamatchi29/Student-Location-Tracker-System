<%@ Page Language="C#" MasterPageFile="~/staffhome.master" AutoEventWireup="true" CodeFile="viewevent.aspx.cs" Inherits="viewevent" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript" type="text/javascript">
     function accept(id)
    {
    location.href='viewevent.aspx?id='+id;
    }
      function view(id1)
    {
    location.href='viewevent.aspx?id1='+id1;
    }
     </script>
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
                <asp:BoundField DataField="eventplace" HeaderText="Event Place" /> 
             <asp:BoundField DataField="eventname" HeaderText="Event Name" /> 
             <asp:BoundField DataField="noperson" HeaderText="No of Person" /> 
             <asp:BoundField DataField="participated" HeaderText="Participate Details" /> 
             <asp:BoundField DataField="eventdate" HeaderText="Date" /> 
              <asp:BoundField DataField="longitude" HeaderText="longitude" /> 
             <asp:BoundField DataField="latitude" HeaderText="latitude" /> 
                <asp:BoundField DataField="dateoftime" HeaderText="Date Of Entry" /> 
            <asp:BoundField DataField="status" HeaderText="Status" /> 
            
            
                   
             <asp:TemplateField HeaderText="Confirm">
                 <ItemTemplate>
                    <a href="javascript:accept('<%# DataBinder.Eval(Container.DataItem,"id")%>')" ><h3 style="color:black;font-size:16px;">
                        Confirmation Mail</h3></a>
                      </ItemTemplate>
             </asp:TemplateField>
                 <asp:TemplateField HeaderText="Track Location">
                 <ItemTemplate>
                    <a href="javascript:view('<%# DataBinder.Eval(Container.DataItem,"id")%>')" ><h3 style="color:black;font-size:16px;">
                         Track Location</h3></a>
                      </ItemTemplate>
             </asp:TemplateField>
             </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        </asp:GridView>
   
</div></asp:Content>

