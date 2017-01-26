using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

/// <summary>
/// Summary description for csEmailHandler
/// </summary>
public class csEmailHandler : ObjetoBase
{
    public csEmailHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>
    /// Envia correo.
    /// </summary>
    /// <param name="Email">Usa la clase "csEmail" para enviar los parametros.</param>
    /// <returns>Si es true, entonces hubo un error.</returns>
    public bool SendEmail(csEmail Email)
    {
        bool error = false;

        //string cuerpoMail = "Dar click en el siguiente link para especificar su nueva Contraseña: http://euxinio.icondns.com/Forms/Captura_Cambio_Contraseña.aspx?id=" + Convert.ToString(Usuarios_DropDownList.SelectedValue);

        MailMessage msg = new MailMessage();
        msg.To.Add(Email.correoDestinatario);
        msg.From = new MailAddress(Email.correoReminente, Email.nombreMostrar, System.Text.Encoding.UTF8);
        msg.Subject = Email.asunto;
        msg.SubjectEncoding = System.Text.Encoding.UTF8;
        msg.Body = Email.mensaje;
        msg.BodyEncoding = System.Text.Encoding.UTF8;
        msg.IsBodyHtml = true;      // Si vas a enviar un correo con contenido html entonces cambia el valor a true

        for (int x = 0; x < Email.emailCC.Count; x++)
            msg.CC.Add(Email.emailCC[x]);
        for (int x = 0; x < Email.emailCCO.Count; x++)
            msg.Bcc.Add(Email.emailCCO[x]);

        SmtpClient client = new SmtpClient();
        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential(Email.emailUsuario, Email.emailPassword);
        client.Port = Email.puerto;
        client.Host = Email.servidorSMTP;
        client.EnableSsl = true;

        try
        {
            client.Send(msg);
        }
        catch (Exception ex)
        {
            LogError(ex.Message + ex.StackTrace);
            error = true;
        }
        finally
        {
            msg.Dispose();
            msg = null;
            client.Dispose();
            client = null;
        }

        return error;
    }
}