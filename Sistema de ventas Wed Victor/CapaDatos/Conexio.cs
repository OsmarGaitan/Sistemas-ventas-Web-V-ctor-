using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

using System.Configuration;


namespace CapaDatos
{
    public class Conexio
    {
        //public static string cn = ConfigurationManager.ConnectionStrings["cadena"].ToString();
        public static readonly string cn = ConfigurationManager.ConnectionStrings["cadena"]?.ConnectionString
          ?? throw new Exception("❌ No se encontró la cadena de conexión 'cadena' en Web.config.");
    }
}
 