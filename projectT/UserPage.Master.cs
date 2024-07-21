using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectT
{
    public partial class UserPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = "";
            string fname = "";
            string lname = "";

            if (Request.Cookies["userInfo"] != null)
            {
                username = Request.Cookies["userInfo"].Values["Username"];
                fname = Request.Cookies["userInfo"].Values["Firstname"];
                lname = Request.Cookies["userInfo"].Values["Lastname"];
            }
            welcomelbl.Text = "Welcome " + fname + " " + lname + " ! ";
            USERPIC.ImageUrl = "~/sowar/" + username + ".jpg";
        }

        protected void BulletedList1_Click(object sender, BulletedListEventArgs e)
        {

        }

    }
}