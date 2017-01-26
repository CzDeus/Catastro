using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Entity_Model;
using System.Data;

public partial class Forms_Compar_Manifiestos : System.Web.UI.Page
{
    db_CatastrosEntities contexto = new db_CatastrosEntities();

    int id_solicitud_notaria;
    string tipo_tramite = "";
    int tipo_predio = 0;

    string clave_buscar;

    string observaciones;

    protected void Page_Load(object sender, EventArgs e)
    {
        id_solicitud_notaria = Convert.ToInt32(Session["id_solicitud"]);
        Id_Solicitud_HiddenField.Value = id_solicitud_notaria.ToString();
        //if (Convert.ToString(Session["sist_Funciones"]).IndexOf("F07") < 0)
        //{
        //    Response.Redirect("/Login.aspx", true);
        //}
        Cargar_Informacion_Notaria();
        Cargar_Informacion_Catastro();

        if (Request["t"] != null)
        {
            if (Request["ti"] != null)
            {
                tipo_predio = Convert.ToInt32(Request["ti"]);
            }

            tipo_tramite = Request["t"].ToString();
            //Manifestacion();
        }

        if (!IsPostBack)
        {
            Cargar_DropDownList();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Manifestacion()
    {
        switch (tipo_tramite)
        {
            //RECTIFICACION URBANO
            case "ru":
                //Encabezado_Label.Text = "MANIFESTACION DE RECTIFICACION DE DATOS CATASTRALES PREDIO URBANO";
                Operacion_Sub_Fus.Visible = false;
                bloque_8.Visible = false;
                Div8.Visible = false;
                bloque_11.Visible = false;
                Div11.Visible = false;
                bloque_12.Visible = false;
                Div12.Visible = false;
                bloque_13.Visible = false;
                Div13.Visible = false;

                //tipo_manifiesto = 1;
                break;

            //RECTIFICACION RURAL
            case "rr":
                //Titulo_Manifiesto.Text = "MANIFESTACION DE RECTIFICACION DE DATOS CATASTRALES PREDIO RURAL";
                Operacion_Sub_Fus.Visible = false;
                bloque_1.Visible = false;
                Div1.Visible = false;
                bloque_2.Visible = false;
                Div2.Visible = false;
                bloque_13.Visible = false;
                Div13.Visible = false;

                //tipo_manifiesto = 5;
                break;

            //TRASLACION URBANO
            case "tu":
                //Titulo_Manifiesto.Text = "MANIFESTACION DE TRASLACION DE DOMINIO DE PREDIO URBANO";
                clave_catastral_lotes_fusionar.Visible = false;
                Operacion_Sub_Fus.Visible = false;
                bloque_11.Visible = false;
                Div11.Visible = false;
                bloque_12.Visible = false;
                Div12.Visible = false;
                bloque_13.Visible = false;
                Div13.Visible = false;

                //tipo_manifiesto = 2;
                break;

            //TRASLACION RURAL
            case "tr":
                //Titulo_Manifiesto.Text = "MANIFESTACION DE TRASLACION DE DOMINIO DE PREDIO RURAL";
                clave_catastral_lotes_fusionar.Visible = false;
                Operacion_Sub_Fus.Visible = false;
                bloque_1.Visible = false;
                Div1.Visible = false;
                bloque_2.Visible = false;
                Div2.Visible = false;
                bloque_13.Visible = false;
                Div13.Visible = false;

                //tipo_manifiesto = 6;
                break;

            //FUSION URBANO - FUSION RURAL
            case "fu":
                //encabezado_sub_fus_Label.Visible = true;
                //encabezado_sub_fus_Label.Text = "Datos del predio fusionado";
                tipo_sub_fus_Label.Visible = true;
                tipo_sub_fus_Label.Text = "Fusion";
                Tipos_Operacion.Visible = false;
                if (tipo_predio == 0)
                {
                    //Titulo_Manifiesto.Text = "MANIFESTACION DE FUSION PREDIO URBANO";
                    //tipo_manifiesto = 4;
                }
                else
                {
                    //Titulo_Manifiesto.Text = "MANIFESTACION DE FUSION PREDIO RURAL";
                    //tipo_manifiesto = 8;
                }
                Titulo_Quien_Adquiere_Label.Text = "Propietarios";
                //Claves_Curps.Visible = false;
                bloque_3.Visible = false;
                Div3.Visible = false;
                bloque_5.Visible = false;
                Div5.Visible = false;
                bloque_10.Visible = false;
                Div10.Visible = false;
                bloque_11.Visible = false;
                Div11.Visible = false;
                bloque_12.Visible = false;
                Div12.Visible = false;
                break;

            //SUBDIVISION URBANO - SUBDIVISION RURAL
            case "di":
                //encabezado_sub_fus_Label.Visible = true;
                //encabezado_sub_fus_Label.Text = "Datos del predio a subdividir";
                clave_catastral_lotes_fusionar.Visible = false;
                tipo_sub_fus_Label.Visible = true;
                tipo_sub_fus_Label.Text = "Subdivision";
                Tipos_Operacion.Visible = false;
                if (tipo_predio == 0)
                {
                    //Titulo_Manifiesto.Text = "MANIFESTACION DE SUBDIVISION PREDIO URBANO";
                    //tipo_manifiesto = 3;
                }
                else
                {
                    //Titulo_Manifiesto.Text = "MANIFESTACION DE SUBDIVISION PREDIO RURAL";
                    //tipo_manifiesto = 7;
                }
                Titulo_Quien_Transmite_Label.Text = "Propietarios";
                //Encabezado_Sub.Visible = true;
                //Claves_Curps.Visible = false;
                bloque_4.Visible = false;
                Div4.Visible = false;
                bloque_5.Visible = false;
                Div5.Visible = false;
                bloque_10.Visible = false;
                Div10.Visible = false;
                bloque_11.Visible = false;
                Div11.Visible = false;
                bloque_12.Visible = false;
                Div12.Visible = false;
                break;

            //LOTIFICACION
            case "l":
                break;
        }
    }

    protected void Cargar_Informacion_Notaria()
    {
        var id_notaria = (from buscar in contexto.Catastro_Solicitudes_Notarias where buscar.id_Solicitud_Notaria == id_solicitud_notaria select buscar).First();

        int tipo_tramite = id_notaria.id_Catalogo_Tipo_Manifiesto;


        if (id_solicitud_notaria != 0)
        {
            clave_buscar = id_notaria.clave_Catastral_Vendedor;

            Oficina_Ubicacion_TextBox.Text = id_notaria.oficina_Ubicacion;
            Folio_TextBox.Text = id_notaria.folio_Solicitud_Notaria.ToString();

            Clave_Catastral_Comprador_TextBox.Text = id_notaria.clave_Catastral_Comprador;
            Curp_Comprador_TextBox.Text = id_notaria.curp_Comprador;

            Clave_Catastral_Vendedor_TextBox.Text = id_notaria.clave_Catastral_Vendedor;
            Curp_Vendedor_TextBox.Text = id_notaria.curp_Vendedor;

            var info_solicitud = (from buscar in contexto.Catastro_Solicitudes_Predios where buscar.id_Solicitud_Notaria == id_solicitud_notaria select buscar).First();
            Municipio_Predio_Origen_TextBox.Text = info_solicitud.municipio;
            Poblacion_Predio_Origen_TextBox.Text = info_solicitud.poblacion;
            Calle_Predio_Origen_TextBox.Text = info_solicitud.calle;
            Num_Oficional_Predio_Origen_TextBox.Text = info_solicitud.numero_Oficial;
            Colonia_Predio_Origen_TextBox.Text = info_solicitud.colonia;
            Num_Lote_Predio_Origen_TextBox.Text = info_solicitud.numero_Lote;
            Num_Manzana_Predio_Origen_TextBox.Text = info_solicitud.numero_Manzana;

            Superficie_Terreno_Predio_TextBox.Text = info_solicitud.superficie_Terreno.ToString();
            //Tipo_Predio_TextBox.Text = info_solicitud.id_Catalogo_Tipo_Terreno.ToString();
            //Uso_Predio_TextBox.Text = info_solicitud.id_Catalogo_Uso_Terreno.ToString();
            //Operacion_TextBox.Text = info_solicitud.id_Catalogo_Tipo_Operacion.ToString();

            if (tipo_tramite == 2 || tipo_tramite == 4)
            {
                Nombre_Predio_Rural_TextBox.Text = info_solicitud.nombre_predio;
                Poblacion_Mas_Cercana_TextBox.Text = info_solicitud.poblacion_cercana;
                Municipio_Predio_Rural_TextBox.Text = info_solicitud.municipio;
            }

            Uso_Predio_DropDownList.SelectedIndex = Convert.ToInt32(info_solicitud.id_Catalogo_Uso_Terreno);
            Tipo_Predio_DropDownList.SelectedIndex = Convert.ToInt32(info_solicitud.id_Catalogo_Uso_Terreno);
            Operaciones_DropDownList.SelectedIndex = Convert.ToInt32(info_solicitud.id_Catalogo_Tipo_Operacion);

            var domicilio_notificacion = (from info in contexto.Catastro_Solicitudes_Domicilio_Notificacion where info.id_Solicitud_Notaria == id_solicitud_notaria select info).First();

            Calle_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.calle;
            Numero_Docimicilio_Notificacion_TextBox.Text = domicilio_notificacion.numero_Oficial;
            Colonia_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.colonia;
            Poblacion_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.poblacion;
            Codigo_Postal_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.codigo_Postal;
            Estado_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.estado;
            Rfc_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.rfc;

            var solicitudes_notarias = (from info in contexto.Catastro_Solicitudes_Notarias where info.id_Solicitud_Notaria == id_solicitud_notaria select info).First();

            Tipo_Documento_DropDownList.Text = solicitudes_notarias.es_Titulo_Propiedad;
            Numero_Documento_TextBox.Text = solicitudes_notarias.numero;
            Volumen_Documento_TextBox.Text = solicitudes_notarias.volumen;
            Fecha_Documento_TextBox.Text = solicitudes_notarias.fecha_Documento.ToString(); ;

            Precio_Pactado_TextBox.Text = solicitudes_notarias.precio_Pactado.ToString();
            Avaluo_Comercial_TextBox.Text = solicitudes_notarias.avaluo_Comercial.ToString();
            Valor_Base_TextBox.Text = solicitudes_notarias.valor_Base_Impuesto.ToString();
            Deduccion_TextBox.Text = solicitudes_notarias.deduccion.ToString();
            Base_Gravable_TextBox.Text = solicitudes_notarias.base_gravable.ToString();



            //Oficina_Ubicacion_TextBox.Text = solicitudes_notarias.oficina_Ubicacion;
            //Folio_TextBox.Text = solicitudes_notarias.folio_Solicitud_Notaria.ToString();

            if (tipo_tramite != 5)
            {
                //Clave_Catastral_Vendedor_TextBox.Text = solicitudes_notarias.clave_Catastral_Vendedor;
                //Clave_Catastral_Comprador_TextBox.Text = solicitudes_notarias.clave_Catastral_Comprador;
                //Curp_Vendedor_TextBox.Text = solicitudes_notarias.curp_Vendedor;
                //Curp_Comprador_TextBox.Text = solicitudes_notarias.curp_Comprador;
            }
            else
            {
                //Clave_Catastral_Subdivision_TextBox.Text = solicitudes_notarias.clave_Catastral_Vendedor;
                //Codigo_Postal_Subdivision_TextBox.Text = solicitudes_notarias.codigo_Postal;
                //Curp_Subdivision_TextBox.Text = solicitudes_notarias.curp_Vendedor;
            }
        }

        //Tipos_Operacion_DropDownList.DataBind();
        //Operaciones_DropDownList
    }

    protected void Cargar_Informacion_Catastro()
    {
        var select_id = (from buscar in contexto.Catastro_Fichas where buscar.clave_Catastral == clave_buscar && buscar.estatus == 1 select buscar).First();

        var select_info = (from buscar in contexto.Catastro_Fichas_Generales where buscar.id_Ficha == select_id.id_Ficha select buscar).First();

        Municipio_Info_Catastro_TextBox.Text = (from buscar in contexto.Catastro_Catalogo_Municipios where buscar.id_Catalogo_Municipio == select_info.id_Catalogo_Municipio select buscar.nombre_Municipio).First();
        Poblacion_Dom_Not_Info_Catastro_TextBox.Text = (from buscar in contexto.Catastro_Catalogo_Poblaciones where buscar.id_Catalogo_Poblacion == select_info.id_Catalogo_Poblacion select buscar.nombre_Poblacion).First();

    }

    private void Cargar_DropDownList()
    {
        Uso_Predio_DropDownList.DataSource = (from buscar in contexto.Catastro_Catalogo_Usos_Terrenos_Urbanos select new { buscar.id_Catalogo_Uso_Terreno_Urbano, buscar.nombre_Uso_Terreno_Urbano }).ToList();
        Uso_Predio_DropDownList.DataTextField = "nombre_Uso_Terreno_Urbano";
        Uso_Predio_DropDownList.DataValueField = "id_Catalogo_Uso_Terreno_Urbano";
        Uso_Predio_DropDownList.DataBind();

        Tipo_Predio_DropDownList.DataSource = (from buscar in contexto.Catastro_Catalogo_Tipos_Terrenos select new { buscar.id_Catalogo_Tipo_Terreno, buscar.nombre_Tipo_Terreno }).ToList();
        Tipo_Predio_DropDownList.DataTextField = "nombre_Tipo_Terreno";
        Tipo_Predio_DropDownList.DataValueField = "id_Catalogo_Tipo_Terreno";
        Tipo_Predio_DropDownList.DataBind();

        Operaciones_DropDownList.DataSource = (from buscar in contexto.Catastro_Catalogo_Operaciones select new { buscar.id_Catalogo_Tipo_Operacion, buscar.nombre_Operacion }).ToList();
        Operaciones_DropDownList.DataTextField = "nombre_Operacion";
        Operaciones_DropDownList.DataValueField = "id_Catalogo_Tipo_Operacion";
        Operaciones_DropDownList.DataBind();
    }

    protected void Observaciones_Button_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_observaciones", "$('#div_observaciones').modal('show');", true);
    }

    protected void Guardar_Observaciones_Button_Click(object sender, EventArgs e)
    {

        ReenviarCorreo("cz_z15@hotmail.com",observaciones,0);
    }

    protected void ReenviarCorreo(string correo, string mensaje, int valor)
    {
        Data objData = new Data();

        //string strStoreProcedure;
        //string store_cambio_GUI;
        //string id_GUI;
        //string id;

        //if ()
        //{
        //    strStoreProcedure = "sp_valida_correo_usuario_institucion";
        //    store_cambio_GUI = "sp_Realiza_Cambio_GUID_Institucion";
        //    id_GUI = "@id_registro";
        //    id = "id_registro";
        //}
        //else
        //{
        //    strStoreProcedure = "";
        //    store_cambio_GUI = "";
        //    id_GUI = "";
        //    id = "";
        //}

        bool error = false;

        try
        {
            //objData.OpenConnection();

            //SqlParameter Param = new SqlParameter("@correo", correo);
            //Param.SqlDbType = SqlDbType.NVarChar;

            //DataTable dt = objData.ExecuteSPQuery(Param, strStoreProcedure);
            //if (dt.Rows.Count != 0)
            //{
            //strStoreProcedure = store_cambio_GUI;
            //string GUID = Guid.NewGuid().ToString();
            //string id_general_usuario = dt.Rows[0][id].ToString();

            //SqlParameter[] Params = new SqlParameter[2];
            //Params[0] = new SqlParameter(id_GUI, id_general_usuario);
            //Params[0].SqlDbType = SqlDbType.Int;
            //Params[1] = new SqlParameter("@guid", GUID);
            //Params[1].SqlDbType = SqlDbType.NVarChar;

            //dt = objData.ExecuteSPQuery(Params, strStoreProcedure);

            //string id_encrypt_usuario = csSecurityHandler.Encrypt(id_general_usuario);
            //string encrypt_guid = csSecurityHandler.Encrypt(GUID);

            //var datos_correo = (from seleccionar in contexto.tb_Generales_Parametros select seleccionar).First();

            csEmail Email = new csEmail();
            Email.puerto = 587;
            Email.servidorSMTP = "SMTP.gmail.com";
            //INFORMACION DE QUIEN ENVIA
            Email.emailUsuario = "czz1305@gmail.com";
            Email.emailPassword = "ValeMi724365!";
            Email.correoReminente = "czz1305@gmail.com";
            Email.correoDestinatario = correo;
            Email.nombreMostrar = "Prueba Cz";
            Email.asunto = "Catastro";
            //Email.mensaje = observaciones;
            Email.mensaje = mensaje;

            if ((new csEmailHandler()).SendEmail(Email))
            {
                error = true;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Se envio correo a la institucion para corregir sus datos');", true);
            }
            //}
            //else
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('El correo no es valido');", true);
        }
        catch (Exception ex)
        {
            (new ObjetoBase()).Log(ex.Message + ex.StackTrace);
            error = true;
        }
        finally
        {
            objData.CloseConnection();
            objData = null;
        }

        if (error)
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Ocurrio un error. Pongase en contacto con sistemas');", true);
    }




    protected void Verificado_Button_Click(object sender, EventArgs e)
    {
        ReenviarCorreo("cz_z15@hotmail.com", "Su tramite a sido validado por favor pase a pagar y entregar los documentos.", 0);

        var cambiar_estado = (from buscar in contexto.Catastro_Solicitudes_Notarias where buscar.id_Solicitud_Notaria == id_solicitud_notaria select buscar).First();
        cambiar_estado.id_Estatus_Solicitud = 3;
        contexto.SaveChanges();
    }
}