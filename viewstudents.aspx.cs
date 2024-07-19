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
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Data.SqlClient;
using locationtracker;
public partial class viewstudents : System.Web.UI.Page
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
        SqlCommand cmd = new SqlCommand("select * from studentdetails where department='"+Session["department"].ToString()+"'", conn);
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
                Session["studentname"] = dr["studentname"].ToString();
                Session["studentrollno"] = dr["studentrollno"].ToString();

                Session["password"] = dr["password"].ToString();
                Session["emailid"] = dr["emailid"].ToString();
                MailMessage msg = new MailMessage(new MailAddress("noreplymailing22@gmail.com"), new MailAddress(Session["emailid"].ToString()));
                msg.Subject = "Login Password";
                msg.IsBodyHtml = true;
                msg.Body = "Student Name" + Session["studentname"].ToString() + "\n" + "Student Rollno" + Session["studentrollno"].ToString() + "\n" + "Password" + Session["password"].ToString() + "\n";
                // msg.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, aa));
                System.Net.NetworkCredential nwcred = new System.Net.NetworkCredential("noreplymailing22@gmail.com", "ipudbyifzmcsjyhk");
                SmtpClient smclient = new SmtpClient();
                smclient.EnableSsl = true;
                smclient.UseDefaultCredentials = false;
                smclient.Credentials = nwcred;
                smclient.Host = "smtp.gmail.com";
                smclient.Port = 587;
                smclient.Send(msg);
                ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Activated Successfully');</script>");
            }
        }
    }
}
