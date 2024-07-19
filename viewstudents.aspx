<%@ Page Language="C#" MasterPageFile="~/staffhome.master" AutoEventWireup="true" CodeFile="viewstudents.aspx.cs" Inherits="viewstudents" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script language="javascript" type="text/javascript">
     function accept(id)
    {
    location.href='viewstudents.aspx?id='+id;
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
             <asp:BoundField DataField="phoneno" HeaderText="Phoneno" /> 
             <asp:BoundField DataField="emailid" HeaderText="Email ID" /> 
               
             <asp:TemplateField HeaderText="">
                 <ItemTemplate>
                    <a href="javascript:accept('<%# DataBinder.Eval(Container.DataItem,"id")%>')" ><h3 style="color:black; font-size:15px;">
                         Send Mail</h3></a>
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

