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
public partial class eventstatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            getdata();
        }
    }
    public void getdata()
    {
        Class1 getcon = new Class1();
        SqlConnection conn = getcon.connect();
        SqlCommand cmd = new SqlCommand("select * from eventdetails where studentrollno='" + Session["studentrollno"].ToString() + "'", conn);
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
}
