using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity_Model;

public partial class Forms_Seleccionar_Tramite : System.Web.UI.Page
{
    db_Catastros_Entities contexto = new db_Catastros_Entities();

    string tipo_manifiesto;
    int id_solicitud;

    //TIPO TRAMITES:
    // *Captura notaria
    // *Enviado a validacion
    // *Validado catastro imprimir hasa que este validad
    // *Pagado
    // *Registrado catastro


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

    protected void Botones_Tramites(object sender, CommandEventArgs e)
    {
        string tipo_tramite = e.CommandName;

        Nuevo_Tramite(Convert.ToInt32(e.CommandArgument));

        switch (tipo_tramite)
        {
            case "Rectificacion_Urbano":
                Response.Redirect("Manifestacion.aspx?t=ru&id=" + id_solicitud);
                break;
            case "Rectificacion_Rural":
                Response.Redirect("Manifestacion.aspx?t=rr&id=" + id_solicitud);
                break;
            case "Traslacion_Urbano":
                Response.Redirect("Manifestacion.aspx?t=tu&id=" + id_solicitud);
                break;
            case "Traslacion_Rural":
                Response.Redirect("Manifestacion.aspx?t=tr&id=" + id_solicitud);
                break;
            case "Subdivision_Urbano":
                Response.Redirect("Manifestacion.aspx?t=di&ti=0&id=" + id_solicitud);
                break;
            case "Subdivision_Rural":
                Response.Redirect("Manifestacion.aspx?t=di&ti=1&id=" + id_solicitud);
                break;
            case "Fusion_Urbano":
                Response.Redirect("Manifestacion.aspx?t=fu&ti=0&id=" + id_solicitud);
                break;
            case "Fusion_Rural":
                Response.Redirect("Manifestacion.aspx?t=fu&ti=1&id=" + id_solicitud);
                break;
            case "Lotificacion":
                Response.Redirect("Manifestacion.aspx?t=l&id=" + id_solicitud);
                break;
        }
    }

    protected void Nuevo_Tramite(int tipo_manifiesto)
    {
        int predio_tipo = 0;

        Catastro_Solicitudes_Notarias nueva_Solicitud = new Catastro_Solicitudes_Notarias();

        nueva_Solicitud.id_Catalogo_Notaria = Convert.ToInt32(Session["sist_Id_Notaria"]);
        nueva_Solicitud.id_Catalogo_Usuario_Notaria = Convert.ToInt32(Session["sist_Id_Usuario"]);
        nueva_Solicitud.id_Estatus_Solicitud = 1;
        nueva_Solicitud.id_Catalogo_Tipo_Manifiesto = tipo_manifiesto;
        nueva_Solicitud.fecha_solicitud = DateTime.Today;

        contexto.Catastro_Solicitudes_Notarias.Add(nueva_Solicitud);

        contexto.SaveChanges();

        id_solicitud = nueva_Solicitud.id_Solicitud_Notaria;

        Session["id_solicitud_notaria"] = id_solicitud;

        Catastro_Solicitudes_Predios predios = new Catastro_Solicitudes_Predios();
        predios.id_Solicitud_Notaria = id_solicitud;

        if (tipo_manifiesto == 4 || tipo_manifiesto == 8)
        {
            predio_tipo = 2;
        }
        else
        {
            predio_tipo = 1;
        }

        predios.tipo_Origen_Destino = predio_tipo;

        contexto.Catastro_Solicitudes_Predios.Add(predios);

        if (tipo_manifiesto >= 1 || tipo_manifiesto <= 6)
        {
            Catastro_Solicitudes_Domicilio_Notificacion domicilio_notificacion = new Catastro_Solicitudes_Domicilio_Notificacion();
            domicilio_notificacion.id_Solicitud_Notaria = id_solicitud;

            contexto.Catastro_Solicitudes_Domicilio_Notificacion.Add(domicilio_notificacion);

            if (tipo_manifiesto == 5 || tipo_manifiesto == 6)
            {
                Catastro_Solicitudes_Uso_Terreno_Rural uso_rural = new Catastro_Solicitudes_Uso_Terreno_Rural();
                uso_rural.id_Solicitud_Notaria = id_solicitud;

                contexto.Catastro_Solicitudes_Uso_Terreno_Rural.Add(uso_rural);
            }
        }

        contexto.SaveChanges();
    }
}