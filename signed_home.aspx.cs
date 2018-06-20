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

public partial class signed_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if logged in
        if (Session["user_email"] == null)
        {
            Response.Redirect("unsigned_home.aspx");
        }

        // Open Connection to Database
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ManagerConnectionString"].ConnectionString);
        conn.Open();

        // Add your items  --- Start
        DataTable userItemsDt = new DataTable();
        new SqlDataAdapter(new SqlCommand(
            "select id from items where uploader = '" + Session["user_email"] + "';",
            conn)).Fill(userItemsDt);

        if (userItemsDt.Rows.Count == 0)
        {
            HtmlGenericControl no_item = new HtmlGenericControl("h5");
            no_item.Attributes["style"] = "margin-left: 20px";
            no_item.InnerHtml = "You have no item currently to sell :(";
            item_placeholder.Controls.Add(no_item);
        }
        else
        {
            foreach (DataRow dataRow in userItemsDt.Rows)
            {
                Item item = new Item(Convert.ToInt32(dataRow["id"].ToString()));
                item.addItemToPlaceHolder(item_placeholder, Session["user_email"]);
            }
        }
        // Add your items  --- End

        // Add overriden Items --- Start
        String getUserBidsQuery = "select item, price from bids where bidder = '" + Session["user_email"] + "';";
        DataTable biddedItems = new DataTable();
        new SqlDataAdapter(new SqlCommand(getUserBidsQuery, conn)).Fill(biddedItems);

        if (biddedItems.Rows.Count == 0)
        {
            HtmlGenericControl no_item = new HtmlGenericControl("h5");
            no_item.Attributes["style"] = "margin-left: 20px";
            no_item.InnerHtml = "You have no item that is over-bidded by others :(";
            overridden_placeholder.Controls.Add(no_item);
        }
        else
        {
            int count = 0;
            foreach (DataRow biddedItemRow in biddedItems.Rows)
            {
                String biddedItem = biddedItemRow["item"].ToString();
                int biddedPrice = Convert.ToInt32(biddedItemRow["price"].ToString());

                int maxBiddedPrice = Convert.ToInt32(
                    new SqlCommand(
                        "select max(price) from bids where item = " + biddedItem + ";",
                        conn
                        ).ExecuteScalar().ToString());

                if (biddedPrice >= maxBiddedPrice) continue;
                count++;
                String itemQuery = "select id from items where id = " + biddedItem + ";";

                DataTable itemDataTable = new DataTable();
                new SqlDataAdapter(new SqlCommand(itemQuery, conn)).Fill(itemDataTable);

                foreach (DataRow dataRow in itemDataTable.Rows)
                {
                    Item item = new Item(Convert.ToInt32(dataRow["id"].ToString()));
                    item.addItemToPlaceHolder(overridden_placeholder, Session["user_email"]);
                }
            }
            if (count == 0)
            {
                HtmlGenericControl no_item = new HtmlGenericControl("h5");
                no_item.Attributes["style"] = "margin-left: 20px";
                no_item.InnerHtml = "You have no item that is over-bidded by others :(";
                overridden_placeholder.Controls.Add(no_item);
            }
        }
        // Add overriden Items --- End


        // Close connection to database
        conn.Close();
    }


    protected void add_item_OnClick(object sender, EventArgs e)
    {
        // Add to server
        String fileName = FileUpload.FileName;
        FileUpload.SaveAs(Server.MapPath("~/item_images/" + fileName));
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ManagerConnectionString"].ConnectionString);
        con.Open();

        String upQ =
            "insert into items(name, image, uploader, base_price) values(@name, @image, @uploader, @base_price);";
        SqlCommand com = new SqlCommand(upQ, con);
        com.Parameters.AddWithValue("@name", item_name.Text);
        com.Parameters.AddWithValue("@image", fileName);
        com.Parameters.AddWithValue("@uploader", Session["user_email"]);
        com.Parameters.AddWithValue("@base_price", item_base_price.Text);
        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("signed_home.aspx");
    }

    protected void logout_button_OnClick(object sender, EventArgs e)
    {
        Session["user_email"] = null;
        Response.Redirect("unsigned_home.aspx");
    }

    protected void update_user_button_Click(object sender, EventArgs e)
    {
        if (pass.Text != pass_confirm.Text)
        {
            ClientScript.RegisterStartupScript(GetType(), "A_key", "passMatch();", true);
            //Response.Write("<script type=\"text/javascript\"> new BirdAlert({ zIndex: 2100 }).notify({ msg: 'Basic mensage', title: 'Success', className: 'success' }); </script>");
        }
        else
        {
            String uQuery =
                "update users set first_name= @fname, last_name= @lname, pass= @password where email= @mail;";
            SqlConnection con =
                new SqlConnection(ConfigurationManager.ConnectionStrings["ManagerConnectionString"].ConnectionString);
            con.Open();
            SqlCommand comm = new SqlCommand(uQuery, con);
            comm.Parameters.AddWithValue("@fname", first_name.Text);
            comm.Parameters.AddWithValue("@lname", last_name.Text);
            comm.Parameters.AddWithValue("@password", pass.Text);
            comm.Parameters.AddWithValue("@mail", Session["user_email"]);
            comm.ExecuteNonQuery();
            Response.Write("Updated");
            con.Close();
        }

    }
}