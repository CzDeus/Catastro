using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for csReporte
/// </summary>
public class csReporte
{
    public string Formato { get; set; }
    public string Extencion { get; set; }
    public string ReportEmbeddedResource { get; set; }
    public csParametro[] ParametrosReporte { get; set; }
    public csStoreProcedure[] StoreProcedure { get; set; }

    public csReporte()
    {
        Formato = "";
        Extencion = "";
        ReportEmbeddedResource = "";
        ParametrosReporte = new csParametro[] { };
        StoreProcedure = new csStoreProcedure[] { };
    }
}

public class csStoreProcedure
{
    private string StoreProcedure { get; set; }
    private csParametro[] Parametros { get; set; }
    private string DataSet { get; set; }

    public csStoreProcedure(csParametro[] Params, string StoreProcedure, string DataSet)
    {
        this.StoreProcedure = StoreProcedure;
        this.Parametros = Params;
        this.DataSet = DataSet;
    }

    public string Get_StoreProcedure()
    {
        return StoreProcedure;
    }

    public csParametro[] Get_Params()
    {
        return Parametros;
    }

    public string Get_DataSet()
    {
        return DataSet;
    }
}

public class csParametro
{
    private string Parametro { get; set; }
    private string Valor { get; set; }
    private DbType Tipo { get; set; }

    public csParametro(string Parametro, string Valor, DbType Tipo)
    {
        this.Parametro = Parametro;
        this.Valor = Valor;
        this.Tipo = Tipo;
    }

    public string Get_Parametro()
    {
        return Parametro;
    }

    public string Get_Valor()
    {
        return Valor;
    }

    public DbType Get_Tipo()
    {
        return Tipo;
    }
}