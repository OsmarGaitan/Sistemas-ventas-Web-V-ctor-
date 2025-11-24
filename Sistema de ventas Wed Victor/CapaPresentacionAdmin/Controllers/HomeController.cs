using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacionAdmin.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        
        public ActionResult Usuario()
        {
            return View();
        }

        // Aqui en  mi home controler hago mi referencia de usuario
        [HttpGet]
        public JsonResult listarUsuarios() 
        {
          List<Usuario> oLista = new List<Usuario>();
            oLista = new CN_Usuarios().listar();

            return Json(new { data = oLista }, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        public JsonResult GuardarUsuario(Usuario objeto)
        {
            object resultado;
            string mensaje = string.Empty;

            if(objeto.IdUsuario == 0)
            {
                // nuevo registro
                resultado = new CN_Usuarios().Registrar(objeto, out mensaje);
            }
            else
            {
                // edicion de registro
                resultado = new CN_Usuarios().Editar(objeto, out mensaje);
            }

            return Json(new { resultado = resultado, mensaje = mensaje }, JsonRequestBehavior.AllowGet);


        }

    }
}