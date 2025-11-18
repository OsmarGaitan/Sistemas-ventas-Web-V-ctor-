using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using CapaEntidad;
using System.Data.SqlClient;
using System.Data;
using System.Security.Claims;

namespace CapaDatos
{
    public class CD_Usuarios
    {

        public List<Usuario> listar() 
        {
            List < Usuario > lista  = new List<Usuario>();

            try 
            {
                using (SqlConnection oconexion = new SqlConnection(Conexio.cn))
                {
                    string query = "select IdUsuario,Nombre,Apellido,Correo,Clave,Reestablecer,Actvo from USUARIO";
                    SqlCommand cmd = new SqlCommand (query, oconexion);
                    cmd.CommandType= CommandType.Text;

                    oconexion.Open();


                    using (SqlDataReader dr = cmd.ExecuteReader()) 
                    {
                        while (dr.Read()) 
                        {

                            lista.Add(

                                new Usuario()
                                {
                                    IdUsuario = Convert.ToInt32(dr["IdUsuario"]),
                                    Nombre = dr["Nombre"].ToString(),
                                    Apellido = dr["Apellido"].ToString(),
                                    Correo = dr["Correo"].ToString(),
                                    Clave = dr["Clave"].ToString(),
                                    Reestablecer = Convert.ToBoolean( dr["Reestablecer"]),
                                    Actvo = Convert.ToBoolean (dr["Actvo"])
                                }

                                );
                        
                        }
                    
                    }


                }
            
            
            }

            catch 
            {
              lista = new List<Usuario>();
            
            }


            return lista;
        }
    }
}
