using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Item
/// </summary>
public class Item
{
    public int id;
    public String name;
    public String imgName;
    public int base_price;
    public string uploader;
    public int lastPrice;
    public string lastBidder;

    public Item()
    {

    }

    public Item(int id)
    {
        this.id = id;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ManagerConnectionString"].ConnectionString);
        con.Open();

        DataTable da1 = new DataTable();
        SqlCommand com = new SqlCommand("select name, image, base_price, uploader from items where id = " + id.ToString() + ";", con);
        new SqlDataAdapter(com).Fill(da1);

        name = da1.Rows[0]["name"].ToString();
        imgName = da1.Rows[0]["image"].ToString();
        uploader = da1.Rows[0]["uploader"].ToString();
        base_price = Convert.ToInt32(da1.Rows[0]["base_price"].ToString());

        String lastPriceString = new SqlCommand("select max(price) from bids where item = " + id.ToString() + ";", con)
            .ExecuteScalar().ToString();

        if (lastPriceString != "")
        {
            lastPrice = Convert.ToInt32(lastPriceString);
            lastBidder = new SqlCommand("select bidder from bids where item = " + id.ToString() + " and price = " + lastPrice + ";", con).ExecuteScalar().ToString();
        }
        else
        {
            lastPrice = base_price;
            lastBidder = "No one";
        }
        con.Close();
    }

    public void addItemToPlaceHolder(PlaceHolder itemPlaceHolder, object crnUser = null)
    {
        HtmlGenericControl div_col_lg = new HtmlGenericControl("div");
        div_col_lg.Attributes["class"] = "col-lg-3";

        HtmlGenericControl div_card = new HtmlGenericControl("div");
        div_card.Attributes["class"] = "card";

        HtmlGenericControl card_img = new HtmlGenericControl("img");
        card_img.Attributes["class"] = "card-img-top";
        card_img.Attributes["src"] = "item_images/" + imgName;
        card_img.Attributes["alt"] = "Item Image";

        HtmlGenericControl card_body = new HtmlGenericControl("div");
        card_body.Attributes["class"] = "card_body pl-3 pt-4 pb-3";

        HtmlGenericControl card_title = new HtmlGenericControl("h5");
        card_title.Attributes["class"] = "card-title";
        card_title.InnerHtml = name;

        HtmlGenericControl div_row = new HtmlGenericControl("div");
        div_row.Attributes["class"] = "row";

        HtmlGenericControl div_col6 = new HtmlGenericControl("div");
        div_col6.Attributes["class"] = "col-6";
        div_col6.InnerHtml = "Last Bidder :";

        HtmlGenericControl div_col = new HtmlGenericControl("div");
        div_col.Attributes["class"] = "col";
        div_col.InnerHtml = "<b>" + lastBidder + "</b>";

        HtmlGenericControl div_clear = new HtmlGenericControl("div");
        div_clear.Attributes["class"] = "w-100";

        HtmlGenericControl div_col6_2 = new HtmlGenericControl("div");
        div_col6_2.Attributes["class"] = "col-6";
        div_col6_2.InnerHtml = "Last Price :";

        HtmlGenericControl div_col_2 = new HtmlGenericControl("div");
        div_col_2.Attributes["class"] = "col";
        div_col_2.InnerHtml = "<b>" + lastPrice.ToString() + "</b>";

        if (crnUser != null && crnUser.ToString() != uploader)
        {
            HtmlGenericControl div_form_row = new HtmlGenericControl("div");
            div_form_row.Attributes["class"] = "form-row mt-2";

            HtmlGenericControl col_8 = new HtmlGenericControl("div");
            col_8.Attributes["class"] = "col-8";

            HtmlGenericControl col_last = new HtmlGenericControl("div");
            col_last.Attributes["class"] = "col";

            TextBox textBox = new TextBox { ID = "bid_price_" + id };
            textBox.Attributes["placeholder"] = "Your Bidding Price";
            textBox.CssClass = "form-control form-control-sm";

            Button button = new Button
            {
                CommandName = textBox.ID,
                CssClass = "btn btn-primary btn-sm",
                Text = "BID"
            };
            button.Click += bid_button_clicked;

            col_last.Controls.Add(button);
            col_8.Controls.Add(textBox);
            div_form_row.Controls.Add(col_8);
            div_form_row.Controls.Add(col_last);
            div_row.Controls.Add(div_col6);
            div_row.Controls.Add(div_col);
            div_row.Controls.Add(div_clear);
            div_row.Controls.Add(div_col6_2);
            div_row.Controls.Add(div_col_2);
            card_body.Controls.Add(card_title);
            card_body.Controls.Add(div_row);
            card_body.Controls.Add(div_form_row);
            div_card.Controls.Add(card_img);
            div_card.Controls.Add(card_body);
            div_col_lg.Controls.Add(div_card);

            itemPlaceHolder.Controls.Add(div_col_lg);
        }
        else
        {
            div_row.Controls.Add(div_col6);
            div_row.Controls.Add(div_col);
            div_row.Controls.Add(div_clear);
            div_row.Controls.Add(div_col6_2);
            div_row.Controls.Add(div_col_2);
            card_body.Controls.Add(card_title);
            card_body.Controls.Add(div_row);
            div_card.Controls.Add(card_img);
            div_card.Controls.Add(card_body);
            div_col_lg.Controls.Add(div_card);

            itemPlaceHolder.Controls.Add(div_col_lg);
        }
    }

    protected void bid_button_clicked(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        TextBox priceBox = (TextBox)btn.FindControl(btn.CommandName);
        int bidPrice = 0;
        if (priceBox.Text != "")
        {
            bidPrice = Convert.ToInt32(priceBox.Text);
        }
        int itemId = Convert.ToInt32(priceBox.ID.Substring(10));
        String getMaxPriceQuery = "select max(price) from bids where item = " + itemId.ToString() + ";";

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ManagerConnectionString"].ConnectionString);
        conn.Open();

        String result = new SqlCommand(getMaxPriceQuery, conn).ExecuteScalar().ToString();

        int maxPrice = base_price;
        if (result != "")
        {
            maxPrice = Convert.ToInt32(result);
        }


        if (bidPrice > maxPrice)
        {
            String removeMyLastBid = "delete from bids where bidder = '" + HttpContext.Current.Session["user_email"] + "';";
            new SqlCommand(removeMyLastBid, conn).ExecuteNonQuery();

            SqlCommand addCommand = new SqlCommand("insert into bids(item, bidder, price) values(@item, @bidder, @price);", conn);
            addCommand.Parameters.AddWithValue("@item", itemId.ToString());
            addCommand.Parameters.AddWithValue("@bidder", HttpContext.Current.Session["user_email"]);
            addCommand.Parameters.AddWithValue("@price", bidPrice.ToString());
            addCommand.ExecuteNonQuery();
            HttpContext.Current.Response.Redirect(HttpContext.Current.Request.RawUrl);
        }
        else
        {
            HttpContext.Current.Response.Write("Bid price is smaller than the last bidded price");
        }
        conn.Close();
    }
}