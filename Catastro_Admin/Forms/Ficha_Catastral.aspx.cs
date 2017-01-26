using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity_Model;

public partial class Forms_Ficha_Catastral : System.Web.UI.Page
{
    db_CatastrosEntities contexto = new db_CatastrosEntities();

    bool nueva_ficha = false;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Baja_Predio_Button_Click(object sender, EventArgs e)
    {
        baja_predio.Visible = true;
        Ficha_Catastral_div.Visible = false;
        Ultimos_Movimientos.Visible = false;
        Buscador.Visible = false;
    }

    protected void Cancelar_Baja_Button_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "confirmar_baja", "$('#confirmar_baja').modal('show');", true);
    }

    protected void Cancelar_Baja_Button_Click1(object sender, EventArgs e)
    {
        baja_predio.Visible = false;
        Ficha_Catastral_div.Visible = true;
        Ultimos_Movimientos.Visible = false;
        Buscador.Visible = false;

    }

    protected void Buscar_Ficha_Button_Click(object sender, EventArgs e)
    {
        Ficha_Catastral_div.Visible = true;
        Ultimos_Movimientos.Visible = false;
        Buscador.Visible = false;
        Nueva_Ficha.Visible = false;
    }

    protected void Correcion_Informacion_Button_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Seleccionar_Datos_Editar", "$('#Seleccionar_Datos_Editar').modal('show');", true);
    }

    protected void Elegir_Tabs(object sender, CommandEventArgs e)
    {

    }

    protected void Volver_Inicio_Button_Click(object sender, EventArgs e)
    {
        baja_predio.Visible = false;
        Ficha_Catastral_div.Visible = false;
        Ultimos_Movimientos.Visible = true;
        Buscador.Visible = true;
        Nueva_Ficha.Visible = true;
    }

    protected void Ultimos_Movimientos_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = int.Parse(e.CommandArgument.ToString());
        int id_ficha = Convert.ToInt32(Ultimos_Movimientos_GridView.DataKeys[rowIndex]["id_Ficha"]);

        Id_Ficha_HiddenField.Value = id_ficha.ToString();

        Ficha_Catastral_div.Visible = true;
        Ultimos_Movimientos.Visible = false;
        Buscador.Visible = false;

        Llenar_Datos(id_ficha);
    }

    protected void Llenar_Datos(int id_ficha)
    {
        //DOMICILIO NOTIFICACION
        var domicilio = contexto.sp_Leer_Domicilio_Notificacion(id_ficha).First();

        Calle_Dominicilio_Notificacion_TextBox.Text = domicilio.id_Catalogo_Calle.ToString();
        Colonia_Domicilio_Notificacio_TextBox.Text = domicilio.id_Catalogo_Colonia.ToString();
        //Poblacion_Domicilio_Notificacion_TextBox.Text 
        //Estado_Domicilio_Notificacion_TextBox.Text 
        //Cp_Domicilio_Notificacion_TextBox.Text 
        Telefono_Domicilio_Notificacion_TextBox.Text = domicilio.telefono;

        //UBICACION PREDIO
        var ubicacion = contexto.sp_Leer_Ubicacion_Generales(id_ficha).First();

        Calle_Ubicacion_Predio_TextBox.Text = ubicacion.id_Catalogo_Calle.ToString();
        Colonia_Ubicacion_Predio_TextBox.Text = ubicacion.id_Catalogo_Colonia.ToString();
        Poblacion_Ubicacion_Predio_TextBox.Text = ubicacion.id_Catalogo_Poblacion.ToString();
        //Estado_Ubicacion_Predio_TextBox.Text 
        Cp_Ubicacion_Predio_TextBox.Text = ubicacion.id_Catalogo_Codigo_Postal.ToString();
        //Telefono_Ubicacion_Predio_TextBox.Text 
        Domicilio_Fiscal_Ubicacion_Predio_TextBox.Text = ubicacion.domicilio_Fiscal;

        //GENERALES
        Clave_Catastral_Generales_TextBox.Text = ubicacion.clave_Catastral;
        //Predio_Origen_Generales_TextBox.Text
        //Tipo_Adjudicacion_TextBox.Text
        //Regimen_Legal_Generales_TextBox.Text
        //Oficina_Catastral_Generales_TextBox.Text
        //Tip_Generales_TextBox.Text
        Cuota_Fija_Generales_TextBox.Text = ubicacion.cuota_Fija.ToString();
        Fecha_Vigencia_Generales_TextBox.Text = ubicacion.fecha_Vigencia.ToString();
        Fecha_Baldio_Generales_TextBox.Text = ubicacion.fecha_Baldio.ToString();
        //Fecha_Um_Generales_extBox.Text
        Rpp_Generales_TextBox.Text = ubicacion.rpp;
        Fecha_Rpp_Generales_TextBox.Text = ubicacion.fecha_RPP.ToString();
        Escritura_Generales_TextBox.Text = ubicacion.escritura;
        Volumen_Generales_TextBox.Text = ubicacion.volumen;
        Fecha_Escritura_TextBox.Text = ubicacion.fecha_Escritura.ToString();
        Federatario_Generales_TextBox.Text = ubicacion.nombre_Presidente;
        Fecha_Um_Generales_extBox.Text = ubicacion.fecha_Movimiento.ToString();
        Numero_Medido_Generales_TextBox.Text = ubicacion.numero_Medidor;

        //TERRENO
        var info_terreno = contexto.sp_Leer_Informacion_Terreno(id_ficha).First();

        Superficie_Legal_Terreno_TextBox.Text = info_terreno.superficie_Legal.ToString();
        Superficie_Cartografica_Terreno_TextBox.Text = info_terreno.superficie_Cartografica.ToString();
        Frente_Principal_Terreno_TextBox.Text = info_terreno.longitud_Frente.ToString();
        Fondo_Predio_Terreno_TextBox.Text = info_terreno.fondo_Terreno.ToString();
        //Posicion_Terreno_TextBox.Text 
        Irregularidades_Terrreno_TextBox.Text = info_terreno.irregularidad_Terreno.ToString();
        //Frente_Terreno_TextBox.Text 
        //Fondo_Terreno_TextBox.Text 
        //Posicion_Factores_Terreno_TextBox.Text
        //Area_Terreno_TextBox.Text
        //Irregularidades_Factores_Terreno_TextBox.Text
        //Uso_Terreno_TextBox.Text
        //Giro_Terreno_TextBox.Text
        //Zona_Homogenea_Terreno_TextBox.Text
        //Banda_Valor_Terreno_TextBox.Text
        Valor_Unitario_Terreno_TextBox.Text = info_terreno.valor_Unitario.ToString();
        //Valor_Terreno_TextBox.Text
    }
}