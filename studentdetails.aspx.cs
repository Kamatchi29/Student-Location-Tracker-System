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
public partial class studentdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         string pwd = randompassword(4);
         TextBox2.Text = pwd;
    }
    public static string randompassword(int PasswordLength)
    {
        string _allowedChars = "0123456789";
        Random randNum = new Random();
        char[] chars = new char[PasswordLength];
        int allowedCharCount = _allowedChars.Length;
        for (int i = 0; i < PasswordLength; i++)
        {
            chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
        }
        return new string(chars);
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
       
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();
        SqlCommand cmd = new SqlCommand("insert into studentdetails values('" + TextBox1.Text + "','" + TextBox3.Text + "','" + TextBox2.Text + "','" + DropDownList2.SelectedValue + "','" + TextBox4.Text + "','" + TextBox5.Text + "')", con);
        cmd.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Student Details Saved Successfully');</script>");

    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("updatestudent.aspx");
    }
}
