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



    }
}
