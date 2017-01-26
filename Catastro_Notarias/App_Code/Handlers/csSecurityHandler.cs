using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for csSecurity
/// </summary>
public static class csSecurityHandler
{
    /// Encripta una cadena
    public static string Encrypt(this string cadenaAencriptar)
    {
        string result = string.Empty;

        try
        {
            byte[] encryted = System.Text.Encoding.Unicode.GetBytes(cadenaAencriptar);
            result = Convert.ToBase64String(encryted);
        }
        catch(Exception ex) { }


        return result;
    }

    /// Esta función desencripta la cadena que le envíamos en el parámentro de entrada.
    public static string Decrypting(this string cadenaAdesencriptar)
    {
        string result = string.Empty;

        try
        {
            byte[] decryted = Convert.FromBase64String(cadenaAdesencriptar);
            //result = System.Text.Encoding.Unicode.GetString(decryted, 0, decryted.ToArray().Length);
            result = System.Text.Encoding.Unicode.GetString(decryted);
        }
        catch(Exception ex) { }

        return result;
    }
}