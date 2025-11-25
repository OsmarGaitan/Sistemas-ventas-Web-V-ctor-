using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{

    // metodo de retorno  de mi capa cn usuario
    // para tener un tipo de filtrado por ID
    // 
    /*
      aun falta el crud porque aqui estamos haciendo l
     conexiones de la capa de CN_Usuario.
     
     */
    public  class CN_Usuarios
    {
      private CD_Usuarios objCapaDato = new CD_Usuarios();

        public List<Usuario> listar() 
        {
          return objCapaDato.listar();
        
        }


        public int Registrar(Usuario obj, out string Mensaje) { 

            Mensaje = string.Empty;

            if(string.IsNullOrEmpty (obj.Nombre)  || string.IsNullOrWhiteSpace (obj.Nombre)) 
            {
                Mensaje = "El nombre del usuario no puede estar vacio";
            }
            if(string.IsNullOrEmpty(obj.Apellido) || string.IsNullOrWhiteSpace(obj.Apellido))
            {
                Mensaje = "El apellido del usuario no puede estar vacio";
            }
            if(string.IsNullOrEmpty(obj.Correo) || string.IsNullOrWhiteSpace(obj.Correo))
            {
                Mensaje = "El correo del usuario no puede estar vacio";
            }


            if (string.IsNullOrEmpty(Mensaje))
            {



                string clave = "test123";
                obj.Clave = CN_Recursos.ConvertirSha256(clave);


                return objCapaDato.Registrar(obj, out Mensaje);
            }
            else 
            {
                return 0;
            }



            

        }

        public bool Editar(Usuario obj, out string Mensaje)
        {
            Mensaje = string.Empty;

            if (string.IsNullOrEmpty(obj.Nombre) || string.IsNullOrWhiteSpace(obj.Nombre))
            {
                Mensaje = "El nombre del usuario no puede estar vacio";
            }
            if (string.IsNullOrEmpty(obj.Apellido) || string.IsNullOrWhiteSpace(obj.Apellido))
            {
                Mensaje = "El apellido del usuario no puede estar vacio";
            }
            if (string.IsNullOrEmpty(obj.Correo) || string.IsNullOrWhiteSpace(obj.Correo))
            {
                Mensaje = "El correo del usuario no puede estar vacio";
            }


            if (string.IsNullOrEmpty(Mensaje))
            {
                return objCapaDato.Editar(obj, out Mensaje);
            }
            else
            {
                return false;
            }


        }

        public bool Eliminar(int id, out string Mensaje)
        {
                        return objCapaDato.Eliminar(id, out Mensaje);
        }
    }
}
