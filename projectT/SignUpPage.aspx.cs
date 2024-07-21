using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectT
{
    public partial class SignUpPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|UsersDataBase.mdf;Integrated Security=True";

            String insertdata = "INSERT INTO Users VALUES(@Username, @Firstname, @Lastname,@Email, @Phone, @City, @Password)";

            SqlCommand cmd = new SqlCommand(insertdata, conn);

            cmd.Parameters.AddWithValue("@Username", TextBox1USER.Text);
            cmd.Parameters.AddWithValue("@Firstname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@Lastname", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Email", TextBox4.Text);
            cmd.Parameters.AddWithValue("@Phone", TextBox5.Text);
            cmd.Parameters.AddWithValue("@City", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox8.Text);

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();

            if (FUP1.HasFile)
                FUP1.SaveAs(Server.MapPath("sowar") + "\\" +  TextBox1USER.Text + ".jpg");


            Response.Redirect("~/MainPage.html");
            


            Lmssg.Text = "Welcome, " + TextBox2.Text + " " + TextBox3.Text;
        }
    }
}