using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;
using System.IO;

namespace CapaNegocio
{
    internal class CN_Recursos
    {

        public static string Generarcalve()
        {
            string clave = Guid.NewGuid().ToString("N").Substring(0, 6);
            return clave;
        }

        public static bool EnviarCorreo(string correo, string asunto, string mensaje)
        {
            bool resultado = false;

            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(correo);
                mail.From = new MailAddress("pruevauni8@gmail.com");
                mail.Subject = asunto;
                mail.Body = mensaje;
                mail.IsBodyHtml = true;

                var smtp = new SmtpClient()
                {
                    Credentials = new NetworkCredential("pruevauni8@gmail.com", "xrrsoiqpfxxevbgu"),
                    Host = "smtp.gmail.com",    
                    Port = 587,
                    EnableSsl = true
                };

                smtp.Send(mail);
                resultado = true;

            }
            catch (Exception ex)
            {
                // Opcional: ver el error real
                string error = ex.Message;
                resultado = false;
            }

            return resultado;
        }





        //encriptacion de TEXTo SHA256
        public static string ConvertirSha256(string texto) 
        {
            StringBuilder sb = new StringBuilder();            
            using (SHA256 hash = SHA256Managed.Create()) 
            {
                Encoding enc = Encoding.UTF8;
                byte[] result = hash.ComputeHash(enc.GetBytes(texto));

                foreach (byte b in result) 
                
                    sb.Append(b.ToString("x2"));
                



            }
            return sb.ToString();

        }

    }
}
