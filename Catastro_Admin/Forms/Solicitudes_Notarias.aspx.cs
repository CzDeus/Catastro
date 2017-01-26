using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Entity_Model;

public partial class Forms_Solicitudes_Notarias : System.Web.UI.Page
{
    db_CatastrosEntities contexto = new db_CatastrosEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Convert.ToString(Session["sist_Funciones"]).IndexOf("F07") < 0)
        //{
        //    Response.Redirect("/Login.aspx", true);
        //}

        if (!IsPostBack)
        {

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Estado_Registro_Verificador_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cadena = Estado_Registro_Verificador.SelectedValue.ToString();

        if (cadena == "Por_revisar")
        {
            Estatus_HiddenField.Value = "2";
        }
        else if (cadena == "Validados")
        {
            Estatus_HiddenField.Value = "3";
        }
        else if (cadena == "Autorizados")
        {
            Estatus_HiddenField.Value = "4";
        }
        else if (cadena == "Todos")
        {
            Estatus_HiddenField.Value = "0";
        }
        Tramites_GridView.DataBind();
    }

    protected void Tramites_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string evento = e.CommandName;

        int rowIndex = int.Parse(e.CommandArgument.ToString());
        int id_solicitud = Convert.ToInt32(Tramites_GridView.DataKeys[rowIndex]["id_Solicitud_Notaria"]);

        if (evento == "Comparar")
        {
            Session["id_solicitud"] = id_solicitud;

            //Response.Redirect("Compar_Manifiestos.aspx");

            int tipo_tramite = Convert.ToInt32(Tramites_GridView.Rows[rowIndex].Cells[1].Text);

            switch (tipo_tramite)
            {
                case 1:
                    Response.Redirect("Compar_Manifiestos.aspx?t=ru");
                    break;
                case 5:
                    Response.Redirect("Compar_Manifiestos.aspx?t=rr");
                    break;
                case 2:
                    Response.Redirect("Compar_Manifiestos.aspx?t=tu");
                    break;
                case 6:
                    Response.Redirect("Compar_Manifiestos.aspx?t=tr");
                    break;
                case 3:
                    Response.Redirect("Compar_Manifiestos.aspx?t=di&ti=0");
                    break;
                case 7:
                    Response.Redirect("Compar_Manifiestos.aspx?t=di&ti=1");
                    break;
                case 4:
                    Response.Redirect("Compar_Manifiestos.aspx?t=fu&ti=0");
                    break;
                case 8:
                    Response.Redirect("Compar_Manifiestos.aspx?t=fu&ti=1");
                    break;
                case 9:
                    Response.Redirect("Compar_Manifiestos.aspx?t=l");
                    break;
            }
        }
        else if (evento == "Cancelar")
        {
            var cancelar = (from buscar in contexto.Catastro_Solicitudes_Notarias where buscar.id_Solicitud_Notaria == id_solicitud select buscar).First();

            cancelar.cancelado = true;
            contexto.SaveChanges();

            Tramites_GridView.DataBind();
        }
    }
}