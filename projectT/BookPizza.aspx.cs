using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectT
{
    public partial class BookPizza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void ok_Click(object sender, EventArgs e)
        {
            //connection:
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|UsersDataBase.mdf;Integrated Security=True";
            //cookies:
            string username = "";
            if (Request.Cookies["userInfo"] != null)
                username = Request.Cookies["userInfo"].Values["usern"];
            ViewState["U"] = username;
            //select mn table menu 3shan nd5lo fe el gridview
            string strSelectP = "SELECT Name, Price, Stock, Type FROM Menuu";
            //bn3ml instance mn connection string be el tare2a deh 3shan kanet 3amla error:
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                //command:
                SqlCommand cmdSelectP = new SqlCommand(strSelectP, conn);
                //data table n7ot feha eli 5adnah mn el menu gowa el grid
                DataTable tbl = new DataTable();
                //try catch 3shan n3rf el error gaye menen:
                try
                {
                    //open
                    conn.Open();
                    //load el datatable w e3mlha bind:
                    tbl.Load(cmdSelectP.ExecuteReader());
                    GridViewMenu.DataSource = tbl;
                    GridViewMenu.DataBind();
                    //eno el gridview feha 7aga mesh fadya(est7ala tb2a fadya 3andena)
                    if (GridViewMenu.Rows.Count != 0)
                    {
                        //ha3mlha show:
                        reserve.Visible = true;
                        Label12.Visible = true;
                        nameOfReservationTxt.Visible = true;
                    }
                    else
                    {
                        reserve.Visible = false;
                        Label12.Visible = false;
                        nameOfReservationTxt.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    // handel el menu low m3mltesh load
                    lblMsg.Text = "Error loading menu: " + ex.Message;
                    lblMsg.Visible = true;
                }
            }
        }





        protected void Button2_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";

            if (GridViewMenu.SelectedIndex != -1)
            {
                // create a connection object to the database
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|UsersDataBase.mdf;Integrated Security=True";

                string username = "";
                string email = "";
                if (Request.Cookies["userInfo"] != null)
                {
                    username = Request.Cookies["userInfo"].Values["usern"];
                    email = Request.Cookies["userInfo"].Values["email"];
                }
                ViewState["U"] = username;

                // getting Pizza details
                string PName = GridViewMenu.SelectedRow.Cells[0].Text;
                string Price = GridViewMenu.SelectedRow.Cells[1].Text;
                string PStock = GridViewMenu.SelectedRow.Cells[2].Text;
                string PType = GridViewMenu.SelectedRow.Cells[3].Text;

                // Getting OrderId
                string strSelect = "SELECT MAX(OrderId) FROM BookedPizzaa";

                SqlCommand cmdSelect = new SqlCommand(strSelect, conn);
                SqlDataReader reader;

                conn.Open();
                reader = cmdSelect.ExecuteReader();

                int OrderId = 0;
                if (reader.Read())
                    OrderId = (int)reader.GetValue(0);
                reader.Close();
                conn.Close();

                Random rnd = new Random();
                int incr = rnd.Next(100, 10000); // creates a number between 1 and 10000

                OrderId = OrderId + incr;

                string strInsert = String.Format("INSERT INTO BookedPizzaa (OrderId, PickupDate, [Order], Name, Branch) VALUES({0},'{1}','{2}', '{3}', '{4}')", OrderId, pickupdate.Text, PName, nameOfReservationTxt.Text, DDLbranch.SelectedValue);

                SqlCommand cmdInsert = new SqlCommand(strInsert, conn);

                conn.Open();
                cmdInsert.ExecuteNonQuery();
                conn.Close();

                // display current reservations
                GridViewOrders.Visible = true;
                lblCurrent.Visible = true;

                // Getting reservations
                string strSelectB = "SELECT * FROM BookedPizzaa";

                SqlCommand cmdSelectB = new SqlCommand(strSelectB, conn);

                DataTable tbl = new DataTable();

                conn.Open();
                tbl.Load(cmdSelectB.ExecuteReader());

                GridViewOrders.DataSource = tbl;
                GridViewOrders.DataBind();

                conn.Close();

                if (!string.IsNullOrEmpty(email))
                {
                    string strBook = "Thank you " + nameOfReservationTxt.Text + " for ordering from Roma Pizza. This is to confirm your Pizza Order.";

                    sendEmail(email, strBook);
                }
                else
                {
                    lblMsg.Text = "Email is not provided.";
                    lblMsg.Visible = true;
                }

                // Updating stock of selected Pizza
                string strUpdate = "UPDATE Menuu SET Stock = Stock - 1 WHERE Name = '" + PName + "' AND Type = '" + PType + "'";

                SqlCommand cmdUpdate = new SqlCommand(strUpdate, conn);

                conn.Open();
                cmdUpdate.ExecuteNonQuery();
                conn.Close();

                // Updating Menu
                string strSelectF2 = "SELECT * FROM Menuu";

                SqlCommand cmdSelectF2 = new SqlCommand(strSelectF2, conn);

                DataTable tbl2 = new DataTable();

                conn.Open();
                tbl2.Load(cmdSelectF2.ExecuteReader());
                GridViewMenu.DataSource = tbl2;
                GridViewMenu.DataBind();

                btnConfirm.Visible = true;
            }
            else
            {
                lblMsg.Text = "!!Please Select The Pizza you want to reserve!!";
                lblMsg.Visible = true;
            }
        }




        protected void sendEmail(string strEmail, string strMsg)
        {

            MailMessage msg = new MailMessage("romapizza@gmail.com", strEmail);
            msg.Subject = "Booking Confirmation";
            msg.Body = strMsg;

            SmtpClient Sclient = new SmtpClient("smtp.gmail.com", 587);
            NetworkCredential auth = new NetworkCredential("romapizza@gmail.com", "csce4502f16");

            Sclient.UseDefaultCredentials = false;
            Sclient.Credentials = auth;
            Sclient.EnableSsl = true;
            try
            {
                Sclient.Send(msg);
                lblMsg.Text = "A Message has been sent to your Email Address with details of your booking!!";
                lblMsg.Visible = true;
            }
            catch (Exception ex)
            {
                lblMsg.Text = ex.Message;
            }

        }



        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            GridViewMenu.Visible = false;
            GridViewOrders.Visible = false;
            lblMsg.Visible = false;


            btnConfirm.Visible = false;
            reserve.Visible = false;
            nameOfReservationTxt.Visible = false;
            Label12.Visible = false;
            lblCurrent.Visible = false;
            Label13.Visible= false;
            //txtEndDate.Text = "";
        }
    }
}
