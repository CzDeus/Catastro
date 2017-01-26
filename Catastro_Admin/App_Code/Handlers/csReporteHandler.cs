using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Microsoft.Reporting.WebForms;

/// <summary>
/// Summary description for csReporteHandler
/// </summary>
public class csReporteHandler : ObjetoBase
{
    public csReporteHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void Imprimir(csReporte Reporte)
    {
        DataTable dt = null;
        ReportDataSource[] DataSource = new ReportDataSource[Reporte.StoreProcedure.Length];
        byte[] bytes = null;
        string strMimeType = string.Empty;

        Microsoft.Reporting.WebForms.Warning warnings = null;

        // DEFINIMOS EL REPORTE
        ReportViewer Reporte_ReportViewer = new ReportViewer();
        Reporte_ReportViewer.ProcessingMode = ProcessingMode.Local;
        Reporte_ReportViewer.LocalReport.ReportPath = Reporte.ReportEmbeddedResource;

        // ASIGNAMOS PARAMETROS AL REPORTE
        int countParametrosReporte = Reporte.ParametrosReporte.Length;
        ReportParameter[] reporteParams = new ReportParameter[countParametrosReporte];

        for(int x = 0; x < countParametrosReporte; x++)
            reporteParams[x] = new ReportParameter(Reporte.ParametrosReporte[x].Get_Parametro(), Reporte.ParametrosReporte[x].Get_Valor());

        if(countParametrosReporte > 0)
            Reporte_ReportViewer.LocalReport.SetParameters(reporteParams);

        // CREAMOS DATATABLE PARA LA SOLICITUD
        Data objData = new Data();

        try
        {
            objData.OpenConnection();

            int countStoreProcedure = Reporte.StoreProcedure.Length;

            for (int x = 0; x < countStoreProcedure; x++)
            {
                int countParametrosStoreProcedure = Reporte.StoreProcedure[x].Get_Params().Length;
                SqlParameter[] sqlParams = new SqlParameter[countParametrosStoreProcedure];
                csParametro[] Params = Reporte.StoreProcedure[x].Get_Params();

                for (int y = 0; y < countParametrosStoreProcedure; y++)
                {
                    sqlParams[y] = new SqlParameter(Params[y].Get_Parametro(), Params[y].Get_Valor());
                    sqlParams[y].DbType = Params[y].Get_Tipo();
                }

                dt = objData.ExecuteSPQuery(sqlParams, Reporte.StoreProcedure[x].Get_StoreProcedure());
                DataSource[x] = new ReportDataSource(Reporte.StoreProcedure[x].Get_DataSet(), dt);
            }
        }
        catch (Exception ex)
        {
            LogError(ex.Message + ex.StackTrace);
            dt = null;
        }
        finally
        {
            objData.CloseConnection();
            objData = null;
        }

        // AGREGAMOS DATASET AL REPORTE
        int countDataSource = DataSource.Length;
        for (int x = 0; x < countDataSource; x++)
            Reporte_ReportViewer.LocalReport.DataSources.Add(DataSource[x]);

        // RENDER AL REPORTE
        bytes = Reporte_ReportViewer.LocalReport.Render(Reporte.Formato, null);

        // ABRE EL PDF
        HttpContext.Current.Response.Buffer = true;
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.ContentType = strMimeType;
        HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=/Reporte." + Reporte.Formato);
        HttpContext.Current.Response.BinaryWrite(bytes);    // create the file
        HttpContext.Current.Response.Flush();
    }
}