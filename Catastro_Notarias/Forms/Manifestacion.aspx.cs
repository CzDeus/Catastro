using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity_Model;
using System.Data;


public partial class Forms_Manifestacion : System.Web.UI.Page
{
    db_Catastros_Entities contexto = new db_Catastros_Entities();

    private List<Object> listCampos = null;

    DateTime vfecha;
    decimal result;
    int result1;

    string tipo_tramite = "";
    int tipo_predio = 0;

    int id_Solicitud_Notaria = 0;
    int tipo_manifiesto;

    int id_solicitud;
    int estado;

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Convert.ToString(Session["sist_Funciones"]).IndexOf("F06") < 0)
        //{
        //    Response.Redirect("/Login.aspx", true);
        //}

        //SESSION DE ID SOLICITUD NOTARIA
        //if (Request["id"] != null)
        //{
        id_Solicitud_Notaria = Convert.ToInt32(Session["id_solicitud_notaria"]);
        id_Solicitud_Notaria_HiddenField.Value = id_Solicitud_Notaria.ToString();
        //}

        if (Request["t"] != null)
        {
            if (Request["ti"] != null)
            {
                tipo_predio = Convert.ToInt32(Request["ti"]);
            }

            tipo_tramite = Request["t"].ToString();
            Manifestacion();
        }

        if(Request["e"] != null)
        {
            estado = Convert.ToInt32(Request["e"].ToString());
        }

        if (!IsPostBack)
        {
            lista_Campos();
            Cargar_Catalogos();
            Cargar_Informacion();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Manifestacion()
    {
        if(estado != 2)
        {
            Datos_Quien_Trasnmite.Visible = false;
            Datos_Quien_Adquiere.Visible = false;
            Datos_Colindancias.Visible = false;
            Datos_Quien_Adquiere_GridView.Columns[2].Visible = false;
            Datos_Quien_Transmite_GridView.Columns[2].Visible = false;
            Colindancias_GridView.Columns[3].Visible = false;
            Guardar_Enviar_Button.Visible = false;
            Guardar_Sin_Enviar_Button.Visible = false;
        }

        switch (tipo_tramite)
        {
            //RECTIFICACION URBANO
            case "ru":
                Titulo_Manifiesto.Text = "MANIFESTACION DE RECTIFICACION DE DATOS CATASTRALES PREDIO URBANO";
                Operacion_Sub_Fus.Visible = false;
                bloque_11.Visible = false;
                bloque_12.Visible = false;
                bloque_13.Visible = false;

                tipo_manifiesto = 1;
                break;

            //RECTIFICACION RURAL
            case "rr":
                Titulo_Manifiesto.Text = "MANIFESTACION DE RECTIFICACION DE DATOS CATASTRALES PREDIO RURAL";
                Operacion_Sub_Fus.Visible = false;
                bloque_1.Visible = false;
                bloque_2.Visible = false;
                bloque_13.Visible = false;

                tipo_manifiesto = 5;
                break;

            //TRASLACION URBANO
            case "tu":
                Titulo_Manifiesto.Text = "MANIFESTACION DE TRASLACION DE DOMINIO DE PREDIO URBANO";
                clave_catastral_lotes_fusionar.Visible = false;
                Operacion_Sub_Fus.Visible = false;
                bloque_11.Visible = false;
                bloque_12.Visible = false;
                bloque_13.Visible = false;

                tipo_manifiesto = 2;
                break;

            //TRASLACION RURAL
            case "tr":
                Titulo_Manifiesto.Text = "MANIFESTACION DE TRASLACION DE DOMINIO DE PREDIO RURAL";
                clave_catastral_lotes_fusionar.Visible = false;
                Operacion_Sub_Fus.Visible = false;
                bloque_1.Visible = false;
                bloque_2.Visible = false;
                bloque_13.Visible = false;

                tipo_manifiesto = 6;
                break;

            //FUSION URBANO - FUSION RURAL
            case "fu":
                encabezado_sub_fus_Label.Visible = true;
                encabezado_sub_fus_Label.Text = "Datos del predio fusionado";
                tipo_sub_fus_Label.Visible = true;
                tipo_sub_fus_Label.Text = "Fusion";
                Tipos_Operacion.Visible = false;
                if (tipo_predio == 0)
                {
                    Titulo_Manifiesto.Text = "MANIFESTACION DE FUSION PREDIO URBANO";
                    tipo_manifiesto = 4;
                }
                else
                {
                    Titulo_Manifiesto.Text = "MANIFESTACION DE FUSION PREDIO RURAL";
                    tipo_manifiesto = 8;
                }
                Titulo_Quien_Adquiere_Label.Text = "Propietarios";
                Claves_Curps.Visible = false;
                bloque_3.Visible = false;
                bloque_5.Visible = false;
                bloque_10.Visible = false;
                bloque_11.Visible = false;
                bloque_12.Visible = false;
                Tipo_Predio_HiddenField.Value = "2";
                break;

            //SUBDIVISION URBANO - SUBDIVISION RURAL
            case "di":
                encabezado_sub_fus_Label.Visible = true;
                encabezado_sub_fus_Label.Text = "Datos del predio a subdividir";
                clave_catastral_lotes_fusionar.Visible = false;
                tipo_sub_fus_Label.Visible = true;
                tipo_sub_fus_Label.Text = "Subdivision";
                Tipos_Operacion.Visible = false;
                if (tipo_predio == 0)
                {
                    Titulo_Manifiesto.Text = "MANIFESTACION DE SUBDIVISION PREDIO URBANO";
                    tipo_manifiesto = 3;
                }
                else
                {
                    Titulo_Manifiesto.Text = "MANIFESTACION DE SUBDIVISION PREDIO RURAL";
                    tipo_manifiesto = 7;
                }
                Titulo_Quien_Transmite_Label.Text = "Propietarios";
                Encabezado_Sub.Visible = true;
                Claves_Curps.Visible = false;
                bloque_4.Visible = false;
                bloque_5.Visible = false;
                bloque_10.Visible = false;
                bloque_11.Visible = false;
                bloque_12.Visible = false;
                Datos_Predios_GridView.Columns[1].Visible = false;
                Tipo_Predio_HiddenField.Value = "1";
                break;

            //LOTIFICACION
            case "l":
                break;
        }
    }

    protected void Informacion_Manifiestos_Command(object sender, CommandEventArgs e)
    {
        //var buscar = (from llenar in contexto.Catastro_Solicitudes_Notarias where llenar.id_Solicitud_Notaria == id_Solicitud_Notaria select llenar).First();

        //if(buscar)

        //int Hola = insertar.id_Catalogo_Notaria;

        string nombre = e.CommandArgument.ToString();

        if (nombre == "GSE")
        {

        }
        else if (nombre == "GYE")
        {

        }
    }

    protected void Volver_Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("Solicitudes_Notaria.aspx");
    }

    protected void Guardar_Sin_Enviar_Button_Click(object sender, EventArgs e)
    {
        
        if (Oficina_Ubicacion_TextBox.Text != "")
        {
            Guardar_Editar_Informacion();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Datos Guardados.');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('PARA GUARDAR. Se necesita agregar la oficina de ubicacion.');", true);
        }

    }

    protected void Cargar_Informacion()
    {
        Catastro_Solicitudes_Predios info_solicitud;

        if (id_Solicitud_Notaria != 0)
        {
            if (tipo_tramite == "fu" || tipo_tramite == "di")
            {
                int valor = Convert.ToInt32(Tipo_Predio_HiddenField.Value);
                info_solicitud = (from buscar in contexto.Catastro_Solicitudes_Predios where buscar.id_Solicitud_Notaria == id_Solicitud_Notaria && buscar.tipo_Origen_Destino == valor select buscar).First();
            }
            else
            {
                info_solicitud = (from buscar in contexto.Catastro_Solicitudes_Predios where buscar.id_Solicitud_Notaria == id_Solicitud_Notaria select buscar).First();
            }

            Municipio_Predio_Origen_TextBox.Text = info_solicitud.municipio;
            Poblacion_Predio_Origen_TextBox.Text = info_solicitud.poblacion;
            Calle_Predio_Origen_TextBox.Text = info_solicitud.calle;
            Num_Oficional_Predio_Origen_TextBox.Text = info_solicitud.numero_Oficial;
            Colonia_Predio_Origen_TextBox.Text = info_solicitud.colonia;
            Num_Lote_Predio_Origen_TextBox.Text = info_solicitud.numero_Lote;
            Num_Manzana_Predio_Origen_TextBox.Text = info_solicitud.numero_Manzana;

            if (info_solicitud.id_Catalogo_Tipo_Terreno != 0)
            {
                Tipo_Predio_DropDownList.SelectedValue = info_solicitud.id_Catalogo_Tipo_Terreno.ToString();
            }

            Tipo_Predio_DropDownList.SelectedIndex = info_solicitud.id_Catalogo_Tipo_Operacion;

            if (Tipos_Operacion_DropDownList.SelectedIndex != 6)
            {
                Otro_Tipo_Operacion_TextBox.ReadOnly = true;
            }

            Uso_Predio_DropDownList.SelectedValue = info_solicitud.id_Catalogo_Uso_Terreno.ToString();
            Operaciones_DropDownList.SelectedValue = info_solicitud.id_Catalogo_Tipo_Operacion.ToString();

            Superficie_Terreno_Predio_TextBox.Text = info_solicitud.superficie_Terreno.ToString();
            //Tipo_Predio_TextBox.Text = info_solicitud.id_Catalogo_Tipo_Terreno.ToString();
            //Uso_Predio_TextBox.Text = info_solicitud.id_Catalogo_Uso_Terreno.ToString();
            //Operacion_TextBox.Text = info_solicitud.id_Catalogo_Tipo_Operacion.ToString();

            if (tipo_tramite == "rr" || tipo_tramite == "tr")
            {
                Nombre_Predio_Rural_TextBox.Text = info_solicitud.nombre_predio;
                Poblacion_Mas_Cercana_TextBox.Text = info_solicitud.poblacion_cercana;
                Municipio_Predio_Rural_TextBox.Text = info_solicitud.municipio;
            }

            var domicilio_notificacion = (from info in contexto.Catastro_Solicitudes_Domicilio_Notificacion where info.id_Solicitud_Notaria == id_Solicitud_Notaria select info).First();

            Calle_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.calle;
            Numero_Docimicilio_Notificacion_TextBox.Text = domicilio_notificacion.numero_Oficial;
            Colonia_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.colonia;
            Poblacion_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.poblacion;
            Codigo_Postal_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.codigo_Postal;
            Estado_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.estado;
            Rfc_Domicilio_Notificacion_TextBox.Text = domicilio_notificacion.rfc;

            var solicitudes_notarias = (from info in contexto.Catastro_Solicitudes_Notarias where info.id_Solicitud_Notaria == id_Solicitud_Notaria select info).First();

            Tipo_Documento_DropDownList.SelectedValue = solicitudes_notarias.tipo_Documento;
            Numero_Documento_TextBox.Text = solicitudes_notarias.numero;
            Volumen_Documento_TextBox.Text = solicitudes_notarias.volumen;
            Fecha_Documento_TextBox.Text = solicitudes_notarias.fecha_Documento.ToString(); ;

            Precio_Pactado_TextBox.Text = solicitudes_notarias.precio_Pactado.ToString();
            Avaluo_Comercial_TextBox.Text = solicitudes_notarias.avaluo_Comercial.ToString();
            Valor_Base_TextBox.Text = solicitudes_notarias.valor_Base_Impuesto.ToString();
            Deduccion_TextBox.Text = solicitudes_notarias.deduccion.ToString();
            Base_Gravable_TextBox.Text = solicitudes_notarias.base_gravable.ToString();

            Oficina_Ubicacion_TextBox.Text = solicitudes_notarias.oficina_Ubicacion;
            Folio_TextBox.Text = solicitudes_notarias.folio_Solicitud_Notaria.ToString();

            if (tipo_tramite != "di")
            {
                Clave_Catastral_Vendedor_TextBox.Text = solicitudes_notarias.clave_Catastral_Vendedor;
                Clave_Catastral_Comprador_TextBox.Text = solicitudes_notarias.clave_Catastral_Comprador;
                Curp_Vendedor_TextBox.Text = solicitudes_notarias.curp_Vendedor;
                Curp_Comprador_TextBox.Text = solicitudes_notarias.curp_Comprador;
            }
            else
            {
                Clave_Catastral_Subdivision_TextBox.Text = solicitudes_notarias.clave_Catastral_Vendedor;
                Codigo_Postal_Subdivision_TextBox.Text = solicitudes_notarias.codigo_Postal;
                Curp_Subdivision_TextBox.Text = solicitudes_notarias.curp_Vendedor;
            }

            if (solicitudes_notarias.id_Estatus_Solicitud != 1)
            {
                for (int x = 0; x < listCampos.Count; x++)
                {
                    if (listCampos[x].GetType().Name == "TextBox")
                    {
                        TextBox txt = (TextBox)listCampos[x];
                        txt.ReadOnly = true;
                    }
                    else if (listCampos[x].GetType().Name == "DropDownList")
                    {
                        DropDownList drop = (DropDownList)listCampos[x];
                        drop.Enabled = false;
                    }
                }
            }
        }

        //Tipos_Operacion_DropDownList.DataBind();
        //Operaciones_DropDownList
    }

    protected void Cargar_Catalogos()
    {
        Uso_Predio_DropDownList.DataSource = (from buscar in contexto.Catastro_Catalogo_Usos_Terrenos_Urbanos select new { buscar.id_Catalogo_Uso_Terreno_Urbano, buscar.nombre_Uso_Terreno_Urbano }).ToList();
        Uso_Predio_DropDownList.DataTextField = "nombre_Uso_Terreno_Urbano";
        Uso_Predio_DropDownList.DataValueField = "id_Catalogo_Uso_Terreno_Urbano";
        Uso_Predio_DropDownList.DataBind();

        Tipo_Predio_DropDownList.DataSource = (from buscar in contexto.Catastro_Catalogo_Tipos_Terrenos select new { buscar.id_Catalogo_Tipo_Terreno, buscar.nombre_Tipo_Terreno }).ToList();
        Tipo_Predio_DropDownList.DataTextField = "nombre_Tipo_Terreno";
        Tipo_Predio_DropDownList.DataValueField = "id_Catalogo_Tipo_Terreno";
        Tipo_Predio_DropDownList.DataBind();

        Tipos_Operacion_DropDownList.DataSource = (from buscar in contexto.Catastro_Catalogo_Operaciones select new { buscar.id_Catalogo_Tipo_Operacion, buscar.nombre_Operacion }).ToList();
        Tipos_Operacion_DropDownList.DataTextField = "nombre_Operacion";
        Tipos_Operacion_DropDownList.DataValueField = "id_Catalogo_Tipo_Operacion";
        Tipos_Operacion_DropDownList.DataBind();

        Operaciones_DropDownList.DataSource = (from buscar in contexto.Catastro_Catalogo_Operaciones select new { buscar.id_Catalogo_Tipo_Operacion, buscar.nombre_Operacion }).ToList();
        Operaciones_DropDownList.DataTextField = "nombre_Operacion";
        Operaciones_DropDownList.DataValueField = "id_Catalogo_Tipo_Operacion";
        Operaciones_DropDownList.DataBind();
    }

    protected void Guardar_Enviar_Button_Click(object sender, EventArgs e)
    {
        Guardar_Editar_Informacion();

        var cambiar_estado = (from buscar in contexto.Catastro_Solicitudes_Notarias where buscar.id_Solicitud_Notaria == id_Solicitud_Notaria select buscar).First();
        cambiar_estado.id_Estatus_Solicitud = 2;
        contexto.SaveChanges();
    }

    protected void Guardar_Editar_Informacion()
    {
        var predios = new Catastro_Solicitudes_Predios();

        if (tipo_tramite == "ru" || tipo_tramite == "rr" || tipo_tramite == "tu" || tipo_tramite == "tr")
        {
            if (Clave_Catastral_Comprador_TextBox.Text == "" || Clave_Catastral_Vendedor_TextBox.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Informacion incompleta, verifique clave catastrales.');", true);
            }
        }

        if (tipo_tramite != "fu")
        {
            predios = (from info in contexto.Catastro_Solicitudes_Predios where info.id_Solicitud_Notaria == id_Solicitud_Notaria && info.tipo_Origen_Destino == 1 select info).First();
        }
        else
        {
            predios = (from info in contexto.Catastro_Solicitudes_Predios where info.id_Solicitud_Notaria == id_Solicitud_Notaria && info.tipo_Origen_Destino == 2 select info).First();
        }

        if (tipo_tramite != "rr" && tipo_tramite != "tr")
        {
            //TABLA Catastro_Solicitudes_Predios
            ////1. Ubicacion del predio
            predios.municipio = Municipio_Predio_Origen_TextBox.Text;
            predios.poblacion = Poblacion_Predio_Origen_TextBox.Text;
            predios.calle = Calle_Predio_Origen_TextBox.Text;
            predios.numero_Oficial = Num_Oficional_Predio_Origen_TextBox.Text;
            predios.colonia = Colonia_Predio_Origen_TextBox.Text;
            predios.numero_Lote = Num_Lote_Predio_Origen_TextBox.Text;
            predios.numero_Manzana = Num_Manzana_Predio_Origen_TextBox.Text;

            ////11. Ubicacion del predio rural
            /*FALTAN ESTOS DATOS EN LA BASE DE DATOS*/
            ////2. Informacion predio
            predios.superficie_Terreno = Decimal.TryParse(Superficie_Terreno_Predio_TextBox.Text, out result) ? result : 0;
            predios.id_Catalogo_Tipo_Terreno = Convert.ToInt32(Tipo_Predio_DropDownList.SelectedValue);
            predios.id_Catalogo_Uso_Terreno = Convert.ToInt32(Uso_Predio_DropDownList.SelectedValue);
            predios.id_Catalogo_Tipo_Operacion = Convert.ToInt32(Operaciones_DropDownList.SelectedValue);
        }
        else
        {
            predios.nombre_predio = Nombre_Predio_Rural_TextBox.Text;
            predios.municipio = Municipio_Predio_Rural_TextBox.Text;
            predios.poblacion_cercana = Poblacion_Mas_Cercana_TextBox.Text;
        }

        var domicilio_notificacion = (from info in contexto.Catastro_Solicitudes_Domicilio_Notificacion where info.id_Solicitud_Notaria == id_Solicitud_Notaria select info).First();
        //TABLA Catastro_Solicitudes_Domicilio_Notificacion
        ////5. Domicilio notificacion
        domicilio_notificacion.calle = Calle_Domicilio_Notificacion_TextBox.Text;
        domicilio_notificacion.numero_Oficial = Numero_Docimicilio_Notificacion_TextBox.Text;
        domicilio_notificacion.colonia = Colonia_Domicilio_Notificacion_TextBox.Text;
        domicilio_notificacion.poblacion = Poblacion_Domicilio_Notificacion_TextBox.Text;
        domicilio_notificacion.codigo_Postal = Codigo_Postal_Domicilio_Notificacion_TextBox.Text;
        domicilio_notificacion.estado = Estado_Domicilio_Notificacion_TextBox.Text;
        domicilio_notificacion.rfc = Rfc_Domicilio_Notificacion_TextBox.Text;

        if (tipo_tramite == "rr" || tipo_tramite == "tr")
        {
            //TABLA Catastro_Solicitudes_Uso_Terreno_Rural
            var Uso_Rural = (from buscar in contexto.Catastro_Solicitudes_Uso_Terreno_Rural where buscar.id_Solicitud_Notaria == id_Solicitud_Notaria select buscar).First();
            ////12. Uso suelo
            Uso_Rural.id_Catalogo_Clase_Terreno_Rural = Convert.ToInt32(Clase_Terreno_DropDownList.SelectedIndex);
            Uso_Rural.superficie_Hectareas = Decimal.TryParse(Superficie_Hectareas_TextBox.Text, out result) ? result : 0;
        }

        ////7. Propietarios SE REUTILIZO LOS DE TRANSMITEN Y ADQUIEREN

        var solicitudes_notarias = (from info in contexto.Catastro_Solicitudes_Notarias where info.id_Solicitud_Notaria == id_Solicitud_Notaria select info).First();

        //////TABLA Catastro_Solicitudes_Notarias

        //ENCABEZADO
        solicitudes_notarias.oficina_Ubicacion = Oficina_Ubicacion_TextBox.Text;
        solicitudes_notarias.folio_Solicitud_Notaria = Convert.ToInt32(Folio_TextBox.Text);
        solicitudes_notarias.clave_Catastral_Vendedor = Clave_Catastral_Vendedor_TextBox.Text;
        solicitudes_notarias.clave_Catastral_Comprador = Clave_Catastral_Comprador_TextBox.Text;
        solicitudes_notarias.curp_Vendedor = Curp_Vendedor_TextBox.Text;
        solicitudes_notarias.curp_Comprador = Curp_Comprador_TextBox.Text;
        //solicitudes_notarias.id_Solicitud_Notaria = id_Solicitud_Notaria;
        ////8. Tipo operacion VERIFICAR BASE DE DATOS
        //solicitudes_notarias.id_Catalogo_Tipo_Operacion = Convert.ToInt32(Tipos_Operacion_DropDownList.SelectedValue);

        ////13.Datos predios

        ////9. Documento
        //if (Tipo_Documento_DropDownList.SelectedValue == "0")
        //{
        solicitudes_notarias.tipo_Documento = Tipo_Documento_DropDownList.SelectedValue;
        //}
        //else if (Tipo_Documento_DropDownList.SelectedValue == "1")
        //{
        //    solicitudes_notarias.es_Titulo_Propiedad = "Titulo Propiedad";
        //}
        solicitudes_notarias.numero = Numero_Documento_TextBox.Text;
        solicitudes_notarias.volumen = Volumen_Documento_TextBox.Text;
        solicitudes_notarias.fecha_Documento = DateTime.TryParse(Fecha_Documento_TextBox.Text, out vfecha) ? Convert.ToDateTime(Fecha_Documento_TextBox.Text) : vfecha;

        ////10. Impuesto sobre traslacion de dominio

        if (tipo_tramite == "ru" || tipo_tramite == "rr" || tipo_tramite == "tu" || tipo_tramite == "tr")
        {
            solicitudes_notarias.precio_Pactado = Decimal.TryParse(Precio_Pactado_TextBox.Text, out result) ? result : 0;
            solicitudes_notarias.avaluo_Comercial = Decimal.TryParse(Avaluo_Comercial_TextBox.Text, out result) ? result : 0;
            solicitudes_notarias.valor_Base_Impuesto = Decimal.TryParse(Valor_Base_TextBox.Text, out result) ? result : 0;
            solicitudes_notarias.deduccion = Decimal.TryParse(Deduccion_TextBox.Text, out result) ? result : 0;
            solicitudes_notarias.base_gravable = Decimal.TryParse(Base_Gravable_TextBox.Text, out result) ? result : 0;
        }

        if (tipo_tramite == "di")
        {
            solicitudes_notarias.clave_Catastral_Vendedor = Clave_Catastral_Subdivision_TextBox.Text;
            solicitudes_notarias.codigo_Postal = Codigo_Postal_Subdivision_TextBox.Text;
            solicitudes_notarias.curp_Vendedor = Curp_Subdivision_TextBox.Text;
        }

        contexto.SaveChanges();
    }

    protected void Agregar_Propietario_Button_Command(object sender, CommandEventArgs e)
    {
        string tipo_Propietario = e.CommandArgument.ToString();

        Catastro_Solicitudes_Propietarios propietarios = new Catastro_Solicitudes_Propietarios();

        if (tipo_Propietario == "Transmite")
        {
            if (Nombre_Razon_Social_Transmite_TextBox.Text != "" && Porcentaje_Transmite_TextBox.Text != "")
            {
                propietarios.id_Solicitud_Notaria = id_Solicitud_Notaria;
                propietarios.nombre_Razon_Social = Nombre_Razon_Social_Transmite_TextBox.Text;
                propietarios.porcentaje = Convert.ToDecimal(Porcentaje_Transmite_TextBox.Text);
                propietarios.tipo_Propietario_Transmite_Adquiere = 1;

                contexto.Catastro_Solicitudes_Propietarios.Add(propietarios);
                contexto.SaveChanges();

                Datos_Quien_Transmite_GridView.DataBind();

                Nombre_Razon_Social_Transmite_TextBox.Text = "";
                Porcentaje_Transmite_TextBox.Text = "";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Quedan campos vacios.');", true);
            }
        }
        else if (tipo_Propietario == "Adquiere")
        {
            if (Nombre_Razon_Social_Adquiere_TextBox.Text != "" && Porcentaje_Adquiere_TextBox.Text != "")
            {
                propietarios.id_Solicitud_Notaria = id_Solicitud_Notaria;
                propietarios.nombre_Razon_Social = Nombre_Razon_Social_Adquiere_TextBox.Text;
                propietarios.porcentaje = Convert.ToDecimal(Porcentaje_Adquiere_TextBox.Text);
                propietarios.tipo_Propietario_Transmite_Adquiere = 2;

                contexto.Catastro_Solicitudes_Propietarios.Add(propietarios);
                contexto.SaveChanges();

                Datos_Quien_Adquiere_GridView.DataBind();

                Nombre_Razon_Social_Adquiere_TextBox.Text = "";
                Porcentaje_Adquiere_TextBox.Text = "";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Quedan campos vacios.');", true);
            }
        }
    }

    protected void Eliminar_Propietario_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string accion = e.CommandArgument.ToString();

        int rowIndex = int.Parse(e.CommandArgument.ToString());

        var gridView = (GridView)sender;

        if (gridView.ID == "Datos_Quien_Transmite_GridView")
        {
            id_solicitud = Convert.ToInt32(Datos_Quien_Transmite_GridView.DataKeys[rowIndex]["id_Solicitud_Propietario"]);
        }
        else if (gridView.ID == "Datos_Quien_Adquiere_GridView")
        {
            id_solicitud = Convert.ToInt32(Datos_Quien_Adquiere_GridView.DataKeys[rowIndex]["id_Solicitud_Propietario"]);
        }

        var eliminar = (from buscar in contexto.Catastro_Solicitudes_Propietarios where buscar.id_Solicitud_Propietario == id_solicitud select buscar).First();

        contexto.Catastro_Solicitudes_Propietarios.Remove(eliminar);
        contexto.SaveChanges();

        Datos_Quien_Adquiere_GridView.DataBind();
        Datos_Quien_Transmite_GridView.DataBind();
    }

    protected void Agregar_Colindancia_Button_Click(object sender, EventArgs e)
    {
        Catastro_Colindancias colindancias = new Catastro_Colindancias();

        colindancias.id_Solicitud_Notaria = id_Solicitud_Notaria;
        colindancias.punto_Cardinal = Punto_Cardinal_TextBox.Text;
        colindancias.distancia_Metros = Convert.ToDecimal(Distancia_Metros_TextBox.Text);
        colindancias.colindancias = Colindancias_TextBox.Text;

        contexto.Catastro_Colindancias.Add(colindancias);

        contexto.SaveChanges();

        Colindancias_GridView.DataBind();

        Punto_Cardinal_TextBox.Text = "";
        Distancia_Metros_TextBox.Text = "";
        Colindancias_TextBox.Text = "";
    }

    protected void Colindancias_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = int.Parse(e.CommandArgument.ToString());

        int id_colindancia = Convert.ToInt32(Colindancias_GridView.DataKeys[rowIndex]["id_Colindancia"]);

        var eliminar = (from buscar in contexto.Catastro_Colindancias where buscar.id_Colindancia == id_colindancia select buscar).First();

        contexto.Catastro_Colindancias.Remove(eliminar);

        contexto.SaveChanges();

        Colindancias_GridView.DataBind();

    }

    protected void Archivos_Adjuntos_Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("Archivos_Adjuntos.aspx");
    }

    protected void lista_Campos()
    {
        listCampos = new List<object>()
        {
            Oficina_Ubicacion_TextBox,
            Folio_TextBox,
            Clave_Catastral_Subdivision_TextBox,
            Codigo_Postal_Subdivision_TextBox,
            Curp_Subdivision_TextBox,
            Clave_Catastral_Vendedor_TextBox,
            Clave_Catastral_Comprador_TextBox,
            Curp_Vendedor_TextBox,
            Curp_Comprador_TextBox,
            Municipio_Predio_Origen_TextBox,
            Poblacion_Predio_Origen_TextBox,
            Calle_Predio_Origen_TextBox,
            Num_Oficional_Predio_Origen_TextBox,
            Colonia_Predio_Origen_TextBox,
            Num_Lote_Predio_Origen_TextBox,
            Num_Manzana_Predio_Origen_TextBox,
            Nombre_Predio_Rural_TextBox,
            Poblacion_Mas_Cercana_TextBox,
            Municipio_Predio_Rural_TextBox,
            //Valor_Catastral_TextBox,
            Superficie_Terreno_Predio_TextBox,
            Calle_Domicilio_Notificacion_TextBox,
            Numero_Docimicilio_Notificacion_TextBox,
            Colonia_Domicilio_Notificacion_TextBox,
            Poblacion_Domicilio_Notificacion_TextBox,
            Estado_Domicilio_Notificacion_TextBox,
            Codigo_Postal_Domicilio_Notificacion_TextBox,
            Rfc_Domicilio_Notificacion_TextBox,
            Superficie_Hectareas_TextBox,
            Otro_Tipo_Operacion_TextBox,
            Tipo_Operacion_Especifico_TextBox,
            clave_catastral_lote_fusionar_TextBox,
            Numero_Documento_TextBox,
            Volumen_Documento_TextBox,
            Precio_Pactado_TextBox,
            Avaluo_Comercial_TextBox,
            Valor_Base_TextBox,
            Deduccion_TextBox,
            Base_Gravable_TextBox,
            Tipo_Predio_DropDownList,
            Uso_Predio_DropDownList,
            Operaciones_DropDownList,
            Clase_Terreno_DropDownList,
            Tipos_Operacion_DropDownList,
            Tipo_Documento_DropDownList,

        };
    }

    protected void Agregar_Predio_Button_Click(object sender, EventArgs e)
    {

        int valor = Convert.ToInt32(Tipo_Predio_HiddenField.Value);

        if (Calle_Predios_TextBox.Text != "" && Lote_Predios_TextBox.Text != "" && Manzana_Predios_TextBox.Text != "" && Superficie_Terreno_Predios_TextBox.Text != "")
        {

            Catastro_Solicitudes_Predios predios = new Catastro_Solicitudes_Predios();

            predios.calle = Calle_Predios_TextBox.Text;
            predios.numero_Lote = Lote_Predios_TextBox.Text;
            predios.numero_Manzana = Manzana_Predios_TextBox.Text;
            predios.superficie_Terreno = Convert.ToInt32(Superficie_Terreno_Predios_TextBox.Text);
            predios.id_Solicitud_Notaria = id_Solicitud_Notaria;         

            if (Tipo_Predio_HiddenField.Value == "1")
            {
                predios.tipo_Origen_Destino = 2;
            }
            else if (Tipo_Predio_HiddenField.Value == "2")
            {
                predios.clave_Catastral_Predio = clave_catastral_lote_fusionar_TextBox.Text;
                predios.tipo_Origen_Destino = 1;
            }

            contexto.Catastro_Solicitudes_Predios.Add(predios);

            contexto.SaveChanges();

            Calle_Predios_TextBox.Text = "";
            Lote_Predios_TextBox.Text = "";
            Manzana_Predios_TextBox.Text = "";
            Superficie_Terreno_Predios_TextBox.Text = "";
            clave_catastral_lote_fusionar_TextBox.Text = "";

            Datos_Predios_GridView.DataBind();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Quedan campos vacios.');", true);
        }
    }

    protected void Datos_Predios_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //string colindancia = e.CommandArgument.ToString();

        int rowIndex = int.Parse(e.CommandArgument.ToString());
        Id_Predio_HiddenField.Value = Datos_Predios_GridView.DataKeys[rowIndex]["id_Solicitud_Predio"].ToString();

        if (e.CommandName == "Colindancias")
        {
            Info_Predios_Colindancias.Visible = true;
        }
        else if (e.CommandName == "Eliminar")
        {
            int id_predio = Convert.ToInt32(Id_Predio_HiddenField.Value);
            var eliminar_predio = (from buscar in contexto.Catastro_Solicitudes_Predios where buscar.id_Solicitud_Predio == id_predio select buscar).First();

            contexto.Catastro_Solicitudes_Predios.Remove(eliminar_predio);

            contexto.SaveChanges();

            Datos_Predios_GridView.DataBind();
        }
    }

    protected void Agregar_Colindancia_Predio_Button_Click(object sender, EventArgs e)
    {
        if (Punto_Cardial_Predio_TextBox.Text != "" && Distancia_Metros_Predio_TextBox.Text != "" && Colindancias__Predios_TextBox.Text != "")
        {
            Catastro_Colindancias colindancias = new Catastro_Colindancias();

            colindancias.id_Solicitud_Notaria = id_Solicitud_Notaria;
            colindancias.id_Solicitud_Predio = Convert.ToInt32(Id_Predio_HiddenField.Value);
            colindancias.punto_Cardinal = Punto_Cardial_Predio_TextBox.Text;
            colindancias.distancia_Metros = Convert.ToInt32(Distancia_Metros_Predio_TextBox.Text);
            colindancias.colindancias = Colindancias__Predios_TextBox.Text;

            contexto.Catastro_Colindancias.Add(colindancias);

            contexto.SaveChanges();

            Punto_Cardial_Predio_TextBox.Text = "";
            Distancia_Metros_Predio_TextBox.Text = "";
            Colindancias__Predios_TextBox.Text = "";

            Colindancias_Predios_GridView.DataBind();
        }
    }

    protected void Colindancias_Predios_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = int.Parse(e.CommandArgument.ToString());
        int id_colindancia = Convert.ToInt32(Colindancias_Predios_GridView.DataKeys[rowIndex]["id_Colindancia"]);

        var eliminar = (from buscar in contexto.Catastro_Colindancias where buscar.id_Colindancia == id_colindancia select buscar).First();

        contexto.Catastro_Colindancias.Remove(eliminar);

        contexto.SaveChanges();

        Colindancias_Predios_GridView.DataBind();

    }

    protected void Tipos_Operacion_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Tipos_Operacion_DropDownList.SelectedIndex == 6)
        {
            Otro_Tipo_Operacion_TextBox.ReadOnly = false;
        }
        else
        {
            Otro_Tipo_Operacion_TextBox.ReadOnly = true;
        }
    }
}