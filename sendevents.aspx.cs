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
public partial class sendevents : System.Web.UI.Page
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


        Session["longss"] = TextBox11.Text;
        Session["latiss"] = TextBox12.Text;
       
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        if ((Session["longss"] == null) && (Session["latiss"] == null))
        {

            ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Onemored  Register pls');</script>");
        }

        else
        {
            Class1 getcon = new Class1();
            SqlConnection con = getcon.connect();
            SqlCommand cmd = new SqlCommand("insert into eventdetails values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + DropDownList2.SelectedValue + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + TextBox9.Text + "','" + TextBox10.Text + "','send','" + Session["longss"].ToString() + "','" + Session["latiss"].ToString() + "','" + DateTime.Now.ToString() + "')", con);
            cmd.ExecuteNonQuery();
        }
        //MailMessage msg = new MailMessage(new MailAddress("noreplymailing22@gmail.com"), new MailAddress(TextBox5.Text));
        //msg.Subject = "Student Other College Event Participation Request Mail";
        //msg.IsBodyHtml = true;
        //msg.Body = "Student Name" + TextBox1.Text + "\n" + "Student Rollno" + TextBox2.Text + "\n" + "Department" + TextBox3.Text + "\n" + "Semester" + DropDownList2.SelectedValue + "\n" + "Event Place" + TextBox6.Text + "\n" + "Event Name" + TextBox7.Text + "\n" + "No of Participation" + TextBox8.Text + "\n" + "Participated Details" + TextBox9.Text + "\n";
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

        ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Event Send Successfully');</script>");

    }
}
