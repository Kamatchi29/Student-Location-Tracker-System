using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using locationtracker;
public partial class updatestudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            getdata();
            accept();
        }
    }
    public void getdata()
    {
        Class1 getcon = new Class1();
        SqlConnection conn = getcon.connect();
        SqlCommand cmd = new SqlCommand("select * from studentdetails", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        getdata();
    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
    public void accept()
    {
        if (Request.QueryString["id"] != null)
        {
            Class1 getcon = new Class1();
            SqlConnection con = getcon.connect();
            SqlCommand cmd = new SqlCommand("select * from studentdetails where id='" + Request.QueryString["id"].ToString() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Session["id"] = dr["id"].ToString();
                TextBox1.Text = dr["studentname"].ToString();
                TextBox3.Text = dr["studentrollno"].ToString();
          
                TextBox4.Text = dr["phoneno"].ToString();
                TextBox5.Text = dr["emailid"].ToString();
              
            }
        }
    }
    public void view()
    {
        if (Request.QueryString["id"] != null)
        {
            Class1 getcon = new Class1();
            SqlConnection con = getcon.connect();
            SqlCommand cmd = new SqlCommand("delete from studentdetails where id='" + Request.QueryString["id"].ToString() + "'", con);
            cmd.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Student Details Deleted Successfully');</script>");
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
       
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();
        SqlCommand cmd = new SqlCommand("update studentdetails set studentname='"+TextBox1.Text+"',studentrollno='"+TextBox3.Text+"',department='"+DropDownList2.SelectedValue+"',phoneno='"+TextBox4.Text+"',emailid='"+TextBox5.Text+"' where id='" + Session["id"].ToString() + "'", con);
        cmd.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Student Details Updated Successfully');</script>");
    }
    
}
