using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for csEmail
/// </summary>
public class csEmail
{
    public int puerto { get; set; }
    public string servidorSMTP { get; set; }
    public string emailUsuario { get; set; }
    public string emailPassword { get; set; }
    public string correoDestinatario { get; set; }
    public string correoReminente { get; set; }
    public string nombreMostrar { get; set; }
    public string asunto { get; set; }
    public string mensaje { get; set; }
    public List<string> emailCC { get; set; }
    public List<string> emailCCO { get; set; }

    public csEmail()
    {
        this.puerto = 0;
        this.servidorSMTP = "";
        this.emailUsuario = "";
        this.emailPassword = "";
        this.correoReminente = "";
        this.correoDestinatario = "";
        this.nombreMostrar = "";
        this.asunto = "";
        this.mensaje = "";
        this.emailCC = new List<string>();
        this.emailCCO = new List<string>();
    }
}