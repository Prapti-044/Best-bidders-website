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

public partial class unsigned_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user_email"] != null)
        {
            Response.Redirect("signed_home.aspx");
        }

    }

    protected void sign_in_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ManagerConnectionString"].ConnectionString);
        conn.Open();

        String checkUser = "select count(*) from users where email='" + login_email.Text + "';";
        SqlCommand com = new SqlCommand(checkUser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        if (temp == 1)
        {
            String passQuery = "select pass from users where email='" + login_email.Text + "';";
            SqlCommand passCom = new SqlCommand(passQuery, conn);
            String correctPass = passCom.ExecuteScalar().ToString();
            if (correctPass == login_pass.Text)
            {
                Session["user_email"] = login_email.Text;
                Response.Redirect("signed_home.aspx");
            }
            else
            {
                Response.Write("Password Incorrect");
            }

        }
        else
        {
            Response.Write("Email does not exist");
        }
        conn.Close();
    }

    protected void sign_up_click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ManagerConnectionString"].ConnectionString);
        conn.Open();

        String checkUser = "select count(*) from users where email='" + sign_up.Text + "';";

        SqlCommand com = new SqlCommand(checkUser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        if (temp == 1)
        {
            Response.Write("Email already exists!");
        }
        else
        {
            String addUser = "insert into users(first_name,last_name,email,pass) values(" +
                             "@fname, @lname, @email, @pass);";
            SqlCommand addCon = new SqlCommand(addUser, conn);
            addCon.Parameters.AddWithValue("@fname", first_name.Text);
            addCon.Parameters.AddWithValue("@lname", last_name.Text);
            addCon.Parameters.AddWithValue("@email", signup_email.Text);
            addCon.Parameters.AddWithValue("@pass", signup_password.Text);

            Session["user_email"] = signup_email.Text;

            addCon.ExecuteNonQuery();
            Response.Redirect("signed_home.aspx");
        }
        conn.Close();
    }
}