using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity_Model;

//sist_Id_Usuario sist_Id_Notaria sist_Nombre_Usuario

public partial class Forms_Solicitudes_Notaria : System.Web.UI.Page
{

    db_Catastros_Entities contexto = new db_Catastros_Entities();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Convert.ToString(Session["sist_Funciones"]).IndexOf("F08") < 0)
        //{
        //    Response.Redirect("/Login.aspx", true);
        //}

        if (!IsPostBack)
        {
            Id_Notaria_HiddenField.Value = Session["sist_Id_Notaria"].ToString();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Nuevo_Tramite_Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("Seleccionar_Tramite.aspx");
    }


    protected void Tramites_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = int.Parse(e.CommandArgument.ToString());
        int id_Solicitud = Convert.ToInt32(Tramites_GridView.DataKeys[rowIndex]["id_Solicitud_Notaria"]);

        Session["id_solicitud_notaria"] = id_Solicitud;

        if (e.CommandName == "Verificar")
        {
            int tipo_tramite = Convert.ToInt32(Tramites_GridView.DataKeys[rowIndex]["id_Catalogo_Tipo_Manifiesto"]);

            switch (tipo_tramite)
            {
                case 1:
                    Response.Redirect("Manifestacion.aspx?t=ru"); //2
                    break;
                case 5:
                    Response.Redirect("Manifestacion.aspx?t=rr"); //2
                    break;
                case 2:
                    Response.Redirect("Manifestacion.aspx?t=tu"); //2
                    break;
                case 6:
                    Response.Redirect("Manifestacion.aspx?t=tr"); //2
                    break;
                case 3:
                    Response.Redirect("Manifestacion.aspx?t=di&ti=0"); //1
                    break;
                case 7:
                    Response.Redirect("Manifestacion.aspx?t=di&ti=1"); //1
                    break;
                case 4:
                    Response.Redirect("Manifestacion.aspx?t=fu&ti=0"); //0
                    break;
                case 8:
                    Response.Redirect("Manifestacion.aspx?t=fu&ti=1"); //0
                    break;
                case 9:
                    Response.Redirect("Manifestacion.aspx?t=l");
                    break;
            }
        }
        else if (e.CommandName == "Eliminar")
        {
            var buscar = (from solicitudes in contexto.Catastro_Solicitudes_Notarias where solicitudes.id_Solicitud_Notaria == id_Solicitud select solicitudes).First();

            buscar.cancelado = true;
            contexto.SaveChanges();

            Tramites_GridView.DataBind();
        }
    }

    protected void Estado_Registro_Verificador_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Estado_Registro_Verificador != null)
        {
            if (Estado_Registro_Verificador.SelectedValue == "Capturando")
            {
                Estatus_HiddenField.Value = "1";
            }
            else if (Estado_Registro_Verificador.SelectedValue == "Enviados")
            {
                Estatus_HiddenField.Value = "2";

            }else if(Estado_Registro_Verificador.SelectedValue == "Validados")
            {
                Estatus_HiddenField.Value = "3";

            }else if(Estado_Registro_Verificador.SelectedValue == "Todos")
            {

            }
            Tramites_GridView.DataBind();
        }
    }
}