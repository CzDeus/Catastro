using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class ObjetoBase
{
    public enum enumObjectType
    {
        strType = 0,
        intType = 1,
        dblType = 2,
        dateType = 3,
        boolType = 4,
        charType = 5
    }

    public void Log(string s)
    {
        System.IO.StreamWriter ArchivoW;
        string strLineaTMP;
        string Minuto;
        //DateTime dt = DateTime.Now;

        Minuto = DateTime.Now.Minute.ToString();
        if (Minuto.Length == 1)
            Minuto = "0" + Minuto;

        strLineaTMP = "\n" + DateTime.Now.Day.ToString() + "/" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString() + " " + DateTime.Now.Hour + ":" + Minuto + ". " + s + "\n";
        try
        {
            ArchivoW = new System.IO.StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "Log.txt", true, System.Text.Encoding.UTF8);

            try
            {
                ArchivoW.Write(strLineaTMP);
            }
            catch (Exception)
            {
            }
            ArchivoW.Close();
        }
        catch (UnauthorizedAccessException)
        {

        }
    }

    protected void LogError(string sError)
    {
        System.IO.StreamWriter ArchivoW;
        string strLineaTMP;
        string Minuto;
        //DateTime dt = DateTime.Now;

        Minuto = DateTime.Now.Minute.ToString();
        if (Minuto.Length == 1)
            Minuto = "0" + Minuto;

        strLineaTMP = "\n" + DateTime.Now.Day.ToString() + "/" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Year.ToString() + " " + DateTime.Now.Hour + ":" + Minuto + ". " + sError + "\n";
        try
        {
            ArchivoW = new System.IO.StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "Log.txt", true, System.Text.Encoding.UTF8);

            try
            {
                ArchivoW.Write(strLineaTMP);
            }
            catch (Exception)
            {
            }
            ArchivoW.Close();
        }
        catch (UnauthorizedAccessException)
        {

        }
    }

    public Object CheckDbNull(Object obj, enumObjectType ObjectType)
    {
        Object objReturn;
        objReturn = obj;
        if (ObjectType == enumObjectType.strType && DBNull.Value == obj)
            return "";
        else if (ObjectType == enumObjectType.intType && DBNull.Value == obj)
            return 0;
        else if (ObjectType == enumObjectType.dblType && DBNull.Value == obj)
            return 0.0;
        else if (ObjectType == enumObjectType.dateType && DBNull.Value == obj)
            return null;
        else if (ObjectType == enumObjectType.boolType && DBNull.Value == obj)
            return false;
        else if (ObjectType == enumObjectType.charType && DBNull.Value == obj)
            return 0;

        return objReturn;
    }
}