using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["sist_Id_Usuario"] = null;
        Session["sist_Nombre_Usuario"] = null;
        Session["sist_Funciones"] = null;

        Response.Redirect(ResolveUrl("~/Login.aspx"), true);
    }
}