using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectT
{
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string username = "";
                if (Request.Cookies["userInfo"] != null)
                {
                    username = Request.Cookies["userInfo"].Values["userName"];
                }
                ViewState["userN"] = username;


                //1- Create Connection Object
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename =|DataDirectory|UsersDataBase.mdf; Integrated Security = True";


                //Create SQL Select Query
                string strSelect = "SELECT * FROM Users "
                + " WHERE Username = '" + username + "'";

                SqlCommand cmdSelect = new SqlCommand(strSelect, conn);

                SqlDataReader reader;

                conn.Open();
                reader = cmdSelect.ExecuteReader();

                if (reader.Read())
                {
                    txtUsername.Text = (string)reader.GetValue(0);
                    txtFname.Text = (string)reader.GetValue(1);
                    txtLname.Text = (string)reader.GetValue(2);
                    txtEmail.Text = (string)reader.GetValue(3);
                    txtPhone.Text = (string)reader.GetValue(4);
                    txtCity.Text = (string)reader.GetValue(5);


                }
            }
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {

            txtFname.Enabled = true;
            txtLname.Enabled = true;
            txtEmail.Enabled = true;
            txtPhone.Enabled = true;
            txtCity.Enabled = true;
        

            btnSave.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source = (LocalDB)\\MSSQLLocalDB; AttachDbFilename =|DataDirectory|UsersDataBase.mdf; Integrated Security = True";

            string username = "";
            username = (string)ViewState["userN"];

            string strUpdate = "UPDATE Users SET Firstname ='" + txtFname.Text + "',"
                    + " Lastname='" + txtLname.Text + "', "
                    + " Email='" + txtEmail.Text + "', "
                    + " City='" + txtCity.Text + "',"
                    + " Phone='" + txtPhone.Text + "'"
                    + " WHERE Username='" + username + "'";

            SqlCommand cmdUpdate = new SqlCommand(strUpdate, conn);
            conn.Open();
            cmdUpdate.ExecuteNonQuery();



           Label11.Text = "Your Account Has Been Successfully Updated";
            
            
                //Label12.Text = err.Message; //"Sorry, the system is not available at the moment, you may try later";
            
        }

    }
}