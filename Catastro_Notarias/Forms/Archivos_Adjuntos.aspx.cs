using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Entity_Model;
using System.IO;

public partial class Forms_Archivos_Adjuntos : System.Web.UI.Page
{
    db_Catastros_Entities contexto = new db_Catastros_Entities();

    int id_solicitud_notaria;
    string id_notaria;

    protected void Page_Load(object sender, EventArgs e)
    {
        id_solicitud_notaria = Convert.ToInt32(Session["id_solicitud_notaria"]);
        id_notaria = Session["sist_Id_Notaria"].ToString();

        if (!IsPostBack)
        {

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Agregar_Archivo_Button_Click(object sender, EventArgs e)
    {
        string vdiretorio = MapPath("~/archivos_notaria");

        if (Directory.Exists(vdiretorio) == false)
        {
            try { Directory.CreateDirectory(vdiretorio); }
            catch (Exception ex) { }
        }

        vdiretorio = MapPath("~/archivos_notaria/notaria_" + id_notaria);

        if(Directory.Exists(vdiretorio) == false)
        {
            try { Directory.CreateDirectory(vdiretorio); }
            catch(Exception ex) { }
        }

        string warchivo = "";

        if(Archivos_FileUpload.HasFile == true && Nombre_Documento_TextBox.Text != "")
        {
            string sName = Archivos_FileUpload.FileName;
            string sExt = Path.GetExtension(sName);

            warchivo = vdiretorio + "/" + sName;
            Archivos_FileUpload.SaveAs(warchivo);

            Catastro_Archivos archivos = new Catastro_Archivos();

            archivos.id_notaria = Convert.ToInt32(id_notaria);
            archivos.id_solicitud_notaria = id_solicitud_notaria;
            archivos.nombre_archivo = Nombre_Documento_TextBox.Text;
            archivos.fecha_subida = DateTime.Now;
            archivos.direccion_documento = warchivo;

            contexto.Catastro_Archivos.Add(archivos);

            contexto.SaveChanges();

            Archivos_Adjuntos_GridView.DataBind();
        }else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Quedan campos vacios.');", true);
        }
    }

    protected void Archivos_Adjuntos_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = int.Parse(e.CommandArgument.ToString());
        int id_archivo = Convert.ToInt32(Archivos_Adjuntos_GridView.DataKeys[rowIndex]["id_documento_notaria"]);

        if(e.CommandName == "Visualizar")
        {

        }else if(e.CommandName == "Eliminar")
        {
            var eliminar = (from buscar in contexto.Catastro_Archivos where buscar.id_documento_notaria == id_archivo select buscar).First();

            string path = eliminar.direccion_documento;
            File.Delete(path);

            contexto.Catastro_Archivos.Remove(eliminar);

            contexto.SaveChanges();

            Archivos_Adjuntos_GridView.DataBind();
        }
    }

    protected void Salir_Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("Manifestacion.aspx");
    }
}