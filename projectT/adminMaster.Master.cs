using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectT
{
    public partial class Site1 : System.Web.UI.MasterPage
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
            Label9.Text = "Welcome " + fname + " " + lname + " Admin ! ";
            adminIMG.ImageUrl = "~/sowar/" + username + ".jpg";
        }
    }
}