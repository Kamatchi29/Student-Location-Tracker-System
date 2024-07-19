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
public partial class staff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
       
        Response.Redirect("staffregister.aspx");
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {

        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();
        SqlCommand cmd = new SqlCommand("select * from staffdetails where staffname='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["username"] = TextBox1.Text;
            Session["department"] = dr["department"].ToString();
            TextBox2.Text = dr["password"].ToString();
            Response.Redirect("studentdetails.aspx");
        }
        else
        {
            Response.Write("<script>alert('Invalid User')</script>");
        }
    }
}
