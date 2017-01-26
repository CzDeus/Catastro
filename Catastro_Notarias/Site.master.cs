using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sist_Id_Usuario"] != null)
        {
            if (!IsPostBack)
            {
                nombreUsuario.Visible = true;
                logout.Visible = true;

                nombreUsuario.InnerText = Session["sist_Nombre_Usuario"].ToString();

                llena_menu();
            }
        }
        else
        {
            nombreUsuario.Visible = false;
            logout.Visible = false;
        }
    }

    public object llena_menu()
    {
        DataView _dv_Accessos = new DataView();
        DataTable dtAccesosGenerales = new DataTable();
        DataTable dtAccesosUsuarios = new DataTable();
        Data objData = new Data();

        string strStoreProcedure = "spr_Generales_lee_accesos_por_usuario_notaria";
        bool error = false;

        try
        {
            objData.OpenConnection();

            SqlParameter Param = new SqlParameter("@id_General_Usuario", Session["sist_Id_Usuario"].ToString());
            Param.SqlDbType = SqlDbType.Int;

            dtAccesosUsuarios = objData.ExecuteSPQuery(Param, strStoreProcedure);

            strStoreProcedure = "spr_Generales_lee_accesos";

            Param = new SqlParameter("@sistema", "01");
            Param.SqlDbType = SqlDbType.NVarChar;

            dtAccesosGenerales = objData.ExecuteSPQuery(Param, strStoreProcedure);
            dtAccesosGenerales.Rows.RemoveAt(0);
            _dv_Accessos = dtAccesosGenerales.AsDataView();
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

        if (!error)
        {
            List<csNodo> listNodo = new List<csNodo>();
            csNodo Nodo = new csNodo();
            TreeNodeCollection treeCollection = new TreeNodeCollection();
            TreeView treeView = new TreeView();
            int posNodo = 0;
            int LengthSistema = 0;
            bool first = true;

            foreach (DataRowView drvSql in _dv_Accessos)
            {
                TreeNode wnodo = new TreeNode();
                wnodo.Text = " " + drvSql["nombre_acceso"].ToString();
                wnodo.Value = drvSql["id_General_Acceso"].ToString();
                int strNodoLength = drvSql["orden"].ToString().Trim().Length;

                if (first)
                {
                    first = false;
                    LengthSistema = strNodoLength;
                    treeCollection = treeView.Nodes;
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

            List<csNivel> listNiveles = new List<csNivel>();
            List<csNivel> _listNiveles = new List<csNivel>();
            treeCollection = treeView.Nodes;
            listNiveles = (new csNivel()).RecorrerNodos(listNiveles, _listNiveles, treeCollection, dtAccesosUsuarios);

            string html = "";
            csFileReader fileReader = new csFileReader(Request.PhysicalApplicationPath);
            StringBuilder strTemplate = new StringBuilder(fileReader.ReadFile("Padre"));
            StringBuilder strHtml = new StringBuilder();
            string strRowPadre = fileReader.ReadFile("Padre");
            string strRowHijo = fileReader.ReadFile("HijoPadre");

            for (int x = 0; x < listNiveles.Count; x++)
            {
                if (listNiveles[x].nivel == 0)
                {
                    StringBuilder strBase = new StringBuilder();
                    Dictionary<string, string> values = new Dictionary<string, string>
                    {
                        {"{Nombre}", listNiveles[x].nombre_acceso},
                    };

                    string strPadre = fileReader.ReadText(strRowPadre, values);
                    strHtml.Append(strPadre);
                    int posNivel = x + 1;
                    int _posNivel;
                    strPadre = (new csNivel()).SetNavBar(listNiveles, posNivel, listNiveles[posNivel].nivel, strBase, fileReader, out _posNivel) + "</ul></li>";
                    strHtml.Append(strPadre);
                    strBase = null;
                }
            }

            html = strHtml.ToString() + "</li>";

            fileReader = null;
            strTemplate = null;
            strHtml = null;

            liNav.InnerHtml = html;
        }

        return true;
    }
}