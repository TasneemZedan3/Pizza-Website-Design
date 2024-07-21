using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectT
{
    public partial class SignInPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Txt1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //1-Connection
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|UsersDataBase.mdf;Integrated Security=True";
            //2-Select Statment
            string sel = "Select * from Users Where Username = '" + signInTxt1.Text + "'" + "  and Password = '" + Txt2.Text + "'";

            //3-command
            SqlCommand cmd = new SqlCommand(sel, conn);

            //4-Reader
            SqlDataReader reader;
            //5-Open
            conn.Open();

            //6-Execute
            reader = cmd.ExecuteReader();
            //7-check statment
            if (reader.Read())
            {
                string fname = (string)reader.GetValue(1);
                string lname = (string)reader.GetValue(2);

                HttpCookie cookie = new HttpCookie("userInfo");
                cookie.Values.Add("Username", signInTxt1.Text);
                cookie.Values.Add("Password", Txt2.Text);
                cookie.Values.Add("Firstname", fname);
                cookie.Values.Add("Lastname", lname);
                cookie.Expires = DateTime.Now.AddDays(3);
                Response.Cookies.Add(cookie);


                if (signInTxt1.Text == "Adminroma1")
                {
                    Response.Redirect("~/adminHomeMaster.aspx");
                }
                else
                    Response.Redirect("~/custHomeMater.aspx");
       
            }
            else
            {

                lm.Text = "Username not valid or Password ya3ny";
            }
            //8-Close
            conn.Close();

        }

    }
}