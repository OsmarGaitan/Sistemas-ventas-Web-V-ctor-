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
        public JsonResult listarUsuarios() 
        {
          List<Usuario> oLista = new List<Usuario>();
            oLista = new CN_Usuarios().listar();

            return Json(oLista,JsonRequestBehavior.AllowGet);
        
        }



    }
}