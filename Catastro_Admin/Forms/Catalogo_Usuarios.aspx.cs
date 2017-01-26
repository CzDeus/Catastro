using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forms_Catalogo_Usuarios : System.Web.UI.Page
{
    private bool boolBuscar = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["sist_Funciones"]).IndexOf("F01") < 0)
        {
            Response.Redirect("/Login.aspx", true);
        }

        if (!Page.IsPostBack)
        {
            Usuarios_GridView.SelectRow(0);
            Usuarios_GridView.DataBind();
            if (Usuarios_GridView.Rows.Count == 0)
            {
                Usuarios_DetailsView.ChangeMode(DetailsViewMode.Insert);
            }
        }
        else
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
    }

    protected void Usuarios_DetailsView_DataBound(object sender, EventArgs e)
    {
        Usuarios_GridView.DataBind();
    }

    protected void Button_Buscar_Click(object sender, EventArgs e)
    {
        this.boolBuscar = true;
        Usuarios_GridView.SelectRow(0);
        Usuarios_GridView.DataBind();
    }

    protected void Delete_Button_Click(object sender, EventArgs e)
    {
        Data objData = new Data();
        string strStoreProcedure = "spr_Valida_eliminar_usuario";

        try
        {
            objData.OpenConnection();

            SqlParameter Param = new SqlParameter("@id_General_Usuario", Usuarios_DetailsView.SelectedValue);
            Param.SqlDbType = SqlDbType.Int;

            DataTable dt = objData.ExecuteSPQuery(Param, strStoreProcedure);

            if (dt.Rows.Count == 0)
                Usuarios_DetailsView.DeleteItem();
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('NO se puede Eliminar, Registro con Referencias en otros archivos...');", true);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('el Usuario ha sido Eliminado Correctamente...');", true);
        }
        catch (Exception ex)
        {
            (new ObjetoBase()).Log(ex.Message + ex.StackTrace);
        }
        finally
        {
            objData.CloseConnection();
            objData = null;
        }
    }

    protected void Usuarios_DetailsView_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        bool wcancelar = false;

        if (Convert.ToBoolean(valida_nombre_correo_usuario(0, e.Values["nombre"], e.Values["correo"]) == true))
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('No puede repetir el nombre del usuario y/o correo electronico...');", true);
            e.Cancel = true;
        }
        else
        {
            wcancelar = valida_captura(e.Values["nombre"], wcancelar);
            wcancelar = valida_captura(e.Values["correo"], wcancelar);

            if (wcancelar)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Debe Capturar Datos Completos...');", true);
                e.Cancel = true;
            }
        }
    }

    protected void Usuarios_DetailsView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        bool wcancelar = false;

        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "hideModal();", true);

        if (Convert.ToBoolean(valida_nombre_correo_usuario(Convert.ToInt32(Usuarios_DetailsView.SelectedValue), e.NewValues["nombre"], e.NewValues["correo"]) == true))
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Nombre Usuario y/o Correo Electronico ya Existentes...');", true);
            e.Cancel = true;
        }
        else
        {
            wcancelar = valida_captura(e.NewValues["nombre"], wcancelar);
            wcancelar = valida_captura(e.NewValues["password"], wcancelar);
            wcancelar = valida_captura(e.NewValues["correo"], wcancelar);

            if (wcancelar)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Debe Capturar Datos Completos...');", true);
                e.Cancel = true;
            }
        }
    }

    private Boolean valida_captura(object vcampo, Boolean vcancelar)
    {
        bool verror = vcancelar;

        if (vcancelar == false)
        {
            if (vcampo == null)
            { verror = true; }
            else
            {
                if (vcampo.ToString().Length == 0)
                { verror = true; }
            }
        }
        return verror;
    }

    private Boolean valida_nombre_correo_usuario(int id_general_usuario, object vnombre, object vcorreo)
    {
        Data objData = new Data();

        string strStoreProcedure = "spr_Valida_Nombre_Correo_Usuario";
        bool vexiste = false;

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@nombre_usuario", vnombre);
            Params[0].SqlDbType = SqlDbType.NVarChar;
            Params[1] = new SqlParameter("@correo_usuario", vcorreo);
            Params[1].SqlDbType = SqlDbType.NVarChar;
            Params[2] = new SqlParameter("@id_general_usuario", id_general_usuario);
            Params[2].SqlDbType = SqlDbType.Int;

            DataTable dt = objData.ExecuteSPQuery(Params, strStoreProcedure);

            if (dt.Rows.Count != 0)
            {
                int id = Convert.ToInt32(dt.Rows[0]["Columna"].ToString());
                if (id == 1 || id == 2)
                    vexiste = true;
            }
        }
        catch (Exception ex)
        {
            (new ObjetoBase()).Log(ex.Message + ex.StackTrace);
        }
        finally
        {
            objData.CloseConnection();
            objData = null;
        }

        return vexiste;
    }

    protected void Usuarios_GridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Usuarios_DetailsView.ChangeMode(DetailsViewMode.ReadOnly);
        if (!boolBuscar)
        {
            boolBuscar = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_detalles();", true);
        }
    }

    protected void btnNuevoUsuario_Click(object sender, EventArgs e)
    {
        Usuarios_DetailsView.ChangeMode(DetailsViewMode.Insert);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_detalles();", true);
    }

    protected void Usuarios_DetailsView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "New")
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_detalles();", true);
        if (e.CommandName == "Edit")
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_detalles();", true);
        else if (e.CommandName == "Cancel")
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_detalles();", true);
    }
}