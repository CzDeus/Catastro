using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forms_Catalogo_Accesos_Usuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["sist_Funciones"]).IndexOf("F02") < 0)
        {
            Response.Redirect("/Login.aspx", true);
        }

        if (!Page.IsPostBack)
        {
            Usuarios_DropDownList.DataBind();
            llena_treeview();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "desbloquea_pagina", "desbloquea_pagina();", true);
        }
    }

    protected void Usuarios_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        llena_treeview();
    }

    private void llena_treeview()
    {
        //// LIMPIMAMOS TREEVIEW
        Accesos_TreeView.Nodes.Clear();

        //// LLENAMOS TREEVIEW CON LOS ACCESOS
        DataView _dv_Accesos = (DataView)Accesos_SqlDataSource.Select(DataSourceSelectArguments.Empty);

        List<csNodo> listNodo = new List<csNodo>();
        csNodo Nodo = new csNodo();
        TreeNodeCollection treeCollection;
        int posNodo = 0;
        int LengthSistema = 0;
        bool first = true;

        foreach (DataRowView drvSql in _dv_Accesos)
        {
            TreeNode wnodo = new TreeNode();
            wnodo.Text = " " + drvSql["nombre_acceso"].ToString();
            wnodo.Value = drvSql["id_General_Acceso"].ToString();
            int strNodoLength = drvSql["orden"].ToString().Trim().Length;

            if (first)
            {
                first = false;
                LengthSistema = strNodoLength;
                treeCollection = Accesos_TreeView.Nodes;
                listNodo.Add(new csNodo { posNodo = posNodo, LengthName = strNodoLength, nodeCollection = treeCollection });
                treeCollection.Add(wnodo);
            }
            else if (strNodoLength > LengthSistema)
            {
                posNodo = 0;
                int countListNodo = listNodo.Count - 1;
                bool exist = (Nodo.Search(listNodo, strNodoLength, out Nodo));

                treeCollection = listNodo[countListNodo].nodeCollection[listNodo[countListNodo].posNodo].ChildNodes;
                treeCollection.Add(wnodo);
                LengthSistema = strNodoLength;
                listNodo.Add(new csNodo { posNodo = posNodo, LengthName = LengthSistema, nodeCollection = treeCollection });
            }
            else if (strNodoLength == LengthSistema)
            {
                bool exist = (Nodo.Search(listNodo, strNodoLength, out Nodo));
                treeCollection = Nodo.nodeCollection;
                treeCollection.Add(wnodo);
                LengthSistema = strNodoLength;
                posNodo = Nodo.posNodo + 1;
                listNodo.Add(new csNodo { posNodo = posNodo, LengthName = LengthSistema, nodeCollection = treeCollection });
            }
            else if (strNodoLength < LengthSistema)
            {
                bool exist = (Nodo.Search(listNodo, strNodoLength, out Nodo));
                treeCollection = Nodo.nodeCollection;
                treeCollection.Add(wnodo);
                LengthSistema = strNodoLength;
                posNodo = Nodo.posNodo + 1;
                listNodo.Add(new csNodo { posNodo = posNodo, LengthName = LengthSistema, nodeCollection = treeCollection });
            }
        }

        //// MARCAMOS LOS ACCESOS POR USUARIO
        DataView _dvSql = (DataView)Accesos_por_Usuario_SqlDataSource.Select(DataSourceSelectArguments.Empty);
        DataTable dt = _dvSql.ToTable();
        int countTable = dt.Rows.Count;
        if (countTable > 0)
        {
            TreeNodeCollection treeNodeCollection = Accesos_TreeView.Nodes;
            (new csNodo()).RecorrerNodos(dt, treeNodeCollection);
        }
        // EXPANDIMOS TREEVIEW
        Accesos_TreeView.ExpandAll();
    }

    protected void Guardar_Buscar_Click(object sender, EventArgs e)
    {
        // BORRAMOS LOS ACCESOS POR USUARIO
        borra_acceso_por_usuario();

		// AGREGAMOS ACCESOS POR USUARIO
        List<int> listNodo = new List<int>();
        listNodo = (new csNodo()).RecorrerNodos(listNodo, Accesos_TreeView.Nodes);
        agrega_acceso_por_usuario(listNodo);

        // mensaje guardado con exito
        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('ha sido Guardado Correctamente...');", true);
    }

    private void agrega_acceso_por_usuario(List<int> listNodo)
    {
        Data objData = new Data();
        string strStoreProcedure = "spr_Generales_agrega_acceso_por_usuario";

        try
        {
            objData.OpenConnection();

            for (int x = 0; x < listNodo.Count; x++)
            {
                SqlParameter[] Params = new SqlParameter[2];
                Params[0] = new SqlParameter("@id_General_Usuario", Usuarios_DropDownList.SelectedValue);
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@id_General_Acceso", listNodo[x]);
                Params[1].SqlDbType = SqlDbType.Int;

                objData.ExecuteSPNonQuery(Params, strStoreProcedure);
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
    }

    private void borra_acceso_por_usuario()
    {
        Data objData = new Data();
        string strStoreProcedure = "spr_Generales_borra_accesos_por_usuario";

        try
        {
            objData.OpenConnection();

            SqlParameter Param = new SqlParameter("@id_General_Usuario", Usuarios_DropDownList.SelectedValue);
            Param.SqlDbType = SqlDbType.Int;

            objData.ExecuteSPQuery(Param, strStoreProcedure);

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

    private void agrega_acceso_por_usuario(int wacceso)
    {
        Data objData = new Data();
        string strStoreProcedure = "spr_Generales_agrega_acceso_por_usuario";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@id_General_Usuario", Usuarios_DropDownList.SelectedValue);
            Params[0].SqlDbType = SqlDbType.Int;
            Params[1] = new SqlParameter("@id_General_Acceso", wacceso);
            Params[1].SqlDbType = SqlDbType.Int;

            objData.ExecuteSPQuery(Params, strStoreProcedure);

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
}