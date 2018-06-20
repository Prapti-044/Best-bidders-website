using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

public partial class hot_sales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_email"] != null)
        {
            Literal literal = new Literal { Text = "<a class=\"nav-link\" href=\"signed_home.aspx\">" + Session["user_email"] + "</a>" };
            login_placeholder.Controls.Add(literal);
        }
        else
        {
            Literal literal = new Literal { Text = "<a class=\"nav-link\" href=\"unsigned_home.aspx\">Sign in</a>" };
            login_placeholder.Controls.Add(literal);

            HtmlGenericControl warnPara = new HtmlGenericControl("p");
            warnPara.Attributes["class"] = "text-danger";
            HtmlGenericControl bold = new HtmlGenericControl("b");
            bold.InnerHtml = "NB. You need to log in to bid on these items!!!";
            warnPara.Controls.Add(bold);
            login_warning_placeholder.Controls.Add(warnPara);
        }

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ManagerConnectionString"].ConnectionString);
        conn.Open();
        String qString = "select id from items;";
        SqlCommand com = new SqlCommand(qString, conn);
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        foreach (DataRow dataRow in dt.Rows)
        {
            Item item = new Item(Convert.ToInt32(dataRow["id"].ToString()));
            item.addItemToPlaceHolder(items_placeholder, Session["user_email"]);
        }
        conn.Close();
    }
}