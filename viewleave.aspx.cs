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
using System.IO;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using locationtracker;
public partial class viewleave : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

  
        if (!IsPostBack)
        {
            getdata();
            accept();
            view();
        }
    }
    public void getdata()
    {
        Class1 getcon = new Class1();
        SqlConnection conn = getcon.connect();
        SqlCommand cmd = new SqlCommand("select * from leavedetails  where status='send'", conn);
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
            SqlCommand cmd = new SqlCommand("select * from leavedetails where id='" + Request.QueryString["id"].ToString() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Session["id"] = dr["id"].ToString();
                Session["phoneno"] = dr["phoneno"].ToString();

                Session["studentname"] = dr["studentname"].ToString();

                Session["studentrollno"] = dr["studentrollno"].ToString();
                Session["lemailid"] = dr["emailid"].ToString();

                Session["department"] = dr["department"].ToString();
                Session["semester"] = dr["semester"].ToString();
                Session["leavedate"] = dr["leavedate"].ToString();
                Class1 getcon1 = new Class1();
                SqlConnection con1 = getcon1.connect();
                SqlCommand cmd1 = new SqlCommand("update leavedetails set status='confirm' where id='" + Session["id"].ToString() + "'", con1);
                cmd1.ExecuteNonQuery();
                MailMessage msg = new MailMessage(new MailAddress("noreplymailing22@gmail.com"), new MailAddress(Session["lemailid"].ToString()));
                msg.Subject = "Login Password";
                msg.IsBodyHtml = true;
                msg.Body = "Hi " + Session["studentname"].ToString() + " Department of" + Session["department"].ToString() + ".Your Leave Date is" + Session["leavedate"].ToString() + "." + "Confirmed and Check Pls.";
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
        
                //WebClient client = new WebClient();
                //string strmsg = "Hi "+ Session["studentname"].ToString()+" Department of"+Session["department"].ToString()+".Your Leave Date is"+Session["leavedate"].ToString() +"."+"Confirmed and Complete Your Work Without Fail.";
                //string baseurl = "http://sms.f9cs.com/sendsms.jsp?user=f9demo&password=demo1234&mobiles=" + Session["phoneno"].ToString() + "&senderid=FINECS&sms='" + strmsg + "'";
                //Stream data = client.OpenRead(baseurl);
                //StreamReader reader = new StreamReader(data);
                //string s = reader.ReadToEnd();
                //data.Close();
                //reader.Close();
                //ClientScript.RegisterStartupScript(this.GetType(), "ele", "<script>alert('Confirmaiton SMS Sent Successfully');</script>");
   
            }
        }
    }
    public void view()
    {
        if (Request.QueryString["id1"] != null)
        {
            Class1 getcon1 = new Class1();
            SqlConnection con1 = getcon1.connect();
            SqlCommand cmd1 = new SqlCommand("select * from leavedetails where id='" + Request.QueryString["id1"].ToString() + "'", con1);
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.Read())
            {
                Session["longitude"] = dr["longitude"].ToString();
                Session["latitude"] = dr["latitude"].ToString();

                Response.Redirect("http://maps.google.com/maps?q=" + Session["longitude"].ToString() + "+," + Session["latitude"].ToString() + "");

            }
        }
    }
}
