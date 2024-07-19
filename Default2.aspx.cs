using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

using System.Net.Mail;
using System.Net;
using System.IO;
using locationtracker;
public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Class1 getcon = new Class1();
        SqlConnection con = getcon.connect();
        SqlCommand cmd = new SqlCommand("select * from studentdetails where studentrollno='" + Session["studentrollno"].ToString() + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            TextBox1.Text = dr["studentname"].ToString();
            TextBox2.Text = dr["studentrollno"].ToString();
            TextBox3.Text = dr["department"].ToString();
            TextBox4.Text = dr["phoneno"].ToString();
            TextBox5.Text = dr["emailid"].ToString();
        }

        Session["longs"] = TextBox10.Text;
        Session["latis"] = TextBox11.Text;
       

        if (!IsPostBack)
        {
           // Session["long"] = lblResult.Text;
            //Session["lati"] = lblResult1.Text;

        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        if ((Session["longs"] == null) && (Session["latis"] == null))
        {

            ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Onemored  Register pls');</script>");
        }
        else
        {

            Class1 getcon = new Class1();
            SqlConnection con = getcon.connect();
            SqlCommand cmd = new SqlCommand("insert into leavedetails values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + DropDownList2.SelectedValue + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + TextBox9.Text + "','send','" + Session["longs"].ToString() + "','" + Session["latis"].ToString() + "','" + DateTime.Now.ToString() + "')", con);
            cmd.ExecuteNonQuery();
            Label1.Text = "Leave Send Successfully";
        }
        //MailMessage msg = new MailMessage(new MailAddress("noreplymailing22@gmail.com"), new MailAddress(TextBox5.Text));
        //msg.Subject = "Student Leave Mail";
        //msg.IsBodyHtml = true;
        //msg.Body = "Student Name" + TextBox1.Text + "\n" + "Student Rollno" + TextBox2.Text + "\n" + "Department" + TextBox3.Text + "\n" + "Semester" + DropDownList2.SelectedValue + "\n" + "Leave Place" + TextBox6.Text + "\n" + "Leave Reason" + TextBox7.Text + "\n" + "No of Days" + TextBox8.Text + "\n" + "Date's" + TextBox9.Text + "\n";
        //// msg.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, aa));
        //System.Net.NetworkCredential nwcred = new System.Net.NetworkCredential("noreplymailing22@gmail.com", "ipudbyifzmcsjyhk");
        //SmtpClient smclient = new SmtpClient();
        //smclient.EnableSsl = true;
        //smclient.UseDefaultCredentials = false;
        //smclient.Credentials = nwcred;
        //smclient.Host = "smtp.gmail.com";
        //smclient.Port = 587;
        //smclient.Send(msg);
        // ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Activated Successfully');</script>");

        //ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Leave Send Successfully');</script>");

    }
    
}
