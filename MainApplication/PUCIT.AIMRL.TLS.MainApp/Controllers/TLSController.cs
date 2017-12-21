using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PUCIT.AIMRL.TLS.MainApp.Controllers
{
    public class RegistrationController : Controller
    {

        //
        // GET: /TLS/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SignUp1()
        {
            return View();
        }

        public ActionResult SignUp2()
        {
            Session["user"] = "";
            //HttpContext context = HttpContext.Current;
           // context.Session["userFname"] = fname;

            return View();
        }

        public ActionResult SignUp3()
        {
            return View();
        }

        
        public ActionResult Sample_SignUp()
        {
            return View();
        }


        public ActionResult SignIn()
        {
            return View();
        }

        public ActionResult ForgetPassword()
        {
            return View();
        }

        public ActionResult ShowData()
        {
            return View();
        }

    }
}
