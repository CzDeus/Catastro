using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

public class csNodo
{
    public int posNodo { get; set; }
    public int LengthName { get; set; }
    public TreeNodeCollection nodeCollection { get; set; }

    public csNodo()
    {

    }

    public bool Search(List<csNodo> listNodo, int lengthSistema, out csNodo Nodo)
    {
        Nodo = new csNodo();
        bool exist = false;

        for(int x = 0; x < listNodo.Count; x++)
        {
            if(listNodo[x].LengthName == lengthSistema)
            { Nodo = listNodo[x]; exist = true; }
        }

        return exist;
    }
    public void RecorrerNodos(DataTable drvSql, TreeNodeCollection treeNodeCollection)
    {
        for (int x = 0; x < treeNodeCollection.Count; x++)
        {
            int countChilNodes = treeNodeCollection[x].ChildNodes.Count;
            if (countChilNodes == 0)
            {
                for (int y = 0; y < drvSql.Rows.Count; y++)
                {
                    string str = drvSql.Rows[y]["id_General_Acceso"].ToString();
                    if (treeNodeCollection[x].Value == str)
                    { treeNodeCollection[x].Checked = true; break; }
                }
            }
            else if (countChilNodes > 0)
                RecorrerNodos(drvSql, treeNodeCollection[x].ChildNodes);
        }
    }

    public List<int> RecorrerNodos(List<int> listNodo, TreeNodeCollection treeNodeCollection)
    {
        for (int x = 0; x < treeNodeCollection.Count; x++)
        {
            int countChilNodes = treeNodeCollection[x].ChildNodes.Count;
            if (countChilNodes == 0 && treeNodeCollection[x].Checked)
                listNodo.Add(Convert.ToInt32(treeNodeCollection[x].Value));
            else if (countChilNodes > 0)
                RecorrerNodos(listNodo, treeNodeCollection[x].ChildNodes);
        }

        return listNodo;
    }
}

public class csNivel
{
    public int nivel { get; set; }
    public string nombreNivel { get; set; }
    public string nombre_acceso { get; set; }
    public string url { get; set; }

    public csNivel()
    {

    }

    public List<csNivel> RecorrerNodos(List<csNivel> listPadre, List<csNivel> listNodo, TreeNodeCollection treeNodeCollection, DataTable dtAccesosUsuarios, int nivel = 0)
    {
        for (int x = 0; x < treeNodeCollection.Count; x++)
        {
            int countChilNodes = treeNodeCollection[x].ChildNodes.Count;
            if (countChilNodes == 0)
            {
                for (int y = 0; y < dtAccesosUsuarios.Rows.Count; y++)
                {
                    if (Convert.ToInt32(treeNodeCollection[x].Value) == (int)dtAccesosUsuarios.Rows[y]["id_General_Acceso"])
                    {
                        listPadre.Add(new csNivel { nivel = nivel, nombreNivel = "hijo", nombre_acceso = dtAccesosUsuarios.Rows[y]["nombre_acceso"].ToString(), url = dtAccesosUsuarios.Rows[y]["url"].ToString() });
                        listNodo.Add(new csNivel { nivel = nivel, nombreNivel = "hijo", nombre_acceso = dtAccesosUsuarios.Rows[y]["nombre_acceso"].ToString(), url = dtAccesosUsuarios.Rows[y]["url"].ToString() });
                        break;
                    }
                }
            }
            else if (countChilNodes > 0)
            {

                listPadre.Add(new csNivel { nivel = nivel, nombreNivel="padre", nombre_acceso = treeNodeCollection[x].Text });
                nivel += 1;
                RecorrerNodos(listPadre, listNodo, treeNodeCollection[x].ChildNodes, dtAccesosUsuarios, nivel);

                nivel -= 1;
                if (listNodo.Count > 0)
                {
                    //listPadre.AddRange(listNodo);
                    listNodo.Clear();
                }
                else
                {
                    listPadre =  RecorrerHijos(treeNodeCollection[x], listPadre);
                }
            }
        }

        return listPadre;
    }

    public List<csNivel> RecorrerHijos(TreeNode treeNode, List<csNivel> listPadre)
    {
        for (int y = 0; y < treeNode.ChildNodes.Count; y++)
        {
            int countChilNodes = treeNode.ChildNodes[y].ChildNodes.Count;

            if (countChilNodes > 0)
                RecorrerHijos(treeNode.ChildNodes[y], listPadre);

            int ultimoRegistro = listPadre.Count - 1;
			if(ultimoRegistro > -1)
				if (listPadre[ultimoRegistro].nombreNivel == "padre")
					listPadre.RemoveAt(ultimoRegistro);
        }

        return listPadre;
    }

    public string SetNavBar(List<csNivel> listNivel, int posNivel, int nivelHijo, StringBuilder strBase, csFileReader fileReader, out int _posNivel)
    {
        _posNivel = 0;
        for (int x = posNivel; x < listNivel.Count; x++)
        {
            if (listNivel[x].nivel != 0 && listNivel[x].url != null)
            {
                if (listNivel[x].nombreNivel == "hijo" && listNivel[x].nivel == nivelHijo)
                {
                    StringBuilder strTemplate = new StringBuilder(fileReader.ReadFile("Hijo"));
                    Dictionary<string, string> values = new Dictionary<string, string>
                    {
                        {"{Href}", listNivel[x].url.Trim()},
                        {"{NombreHijo}", listNivel[x].nombre_acceso.Trim()},
                    };
                    string strHijo = fileReader.ReadText(strTemplate.ToString(), values);
                    strBase.Append(strHijo);

                    strHijo = null;
                    strTemplate = null;
                    values = null;

                    _posNivel = x;
                }
                else
                    break;
            }
            else if (listNivel[x].nombreNivel == "padre" && listNivel[x].nivel != 0)
            {
                int c = nivelHijo;
                if (listNivel[x].nivel < nivelHijo)
                    break;
                else
                {
                    StringBuilder strTemplate = new StringBuilder(fileReader.ReadFile("HijoPadre"));
                    Dictionary<string, string> values = new Dictionary<string, string>
                    {
                        {"{Nombre}", listNivel[x].nombre_acceso.Trim()},
                    };
                    string strHijoPadre = fileReader.ReadText(strTemplate.ToString(), values);
                    strBase.Append(strHijoPadre);
                    StringBuilder _strBase = new StringBuilder();
                    posNivel = x + 1;
                    strHijoPadre = SetNavBar(listNivel, posNivel, listNivel[posNivel].nivel, _strBase, fileReader, out _posNivel) + "</ul></li>";
                    //strHijoPadre = SetNavBarHijo(listNivel, posNivel, listNivel[posNivel].nivel, _strBase, fileReader, out _posNivel) + "</ul></li>";
                    strBase.Append(strHijoPadre);
                    x = _posNivel;
                    strTemplate = null;
                    values = null;
                    strHijoPadre = null;
                    _strBase = null;
                }
            }
            else
            {
                _posNivel = x - 1;
                break;
            }
        }

        string html = strBase.ToString();
        strBase = null;

        return html;
    }

    public string SetNavBarHijo(List<csNivel> listNivel, int posNivel, int nivelHijo, StringBuilder strBase, csFileReader fileReader, out int _posNivel)
    {
        _posNivel = 0;
        for(int x = posNivel; x < listNivel.Count; x++)
        {
            if (listNivel[x].nombreNivel == "hijo" && listNivel[x].nivel == nivelHijo)
            {
                StringBuilder strTemplate = new StringBuilder(fileReader.ReadFile("Hijo"));
                Dictionary<string, string> values = new Dictionary<string, string>
                    {
                        {"{Href}", listNivel[x].url.Trim()},
                        {"{NombreHijo}", listNivel[x].nombre_acceso.Trim()},
                    };
                string strHijo = fileReader.ReadText(strTemplate.ToString(), values);
                strBase.Append(strHijo);

                strHijo = null;
                strTemplate = null;
                values = null;

                _posNivel = x;
            }
            else
                break;
        }

        string html = strBase.ToString();
        strBase = null;

        return html;
    }
}