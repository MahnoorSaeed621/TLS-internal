using MvcSiteMapProvider.Web.Mvc.Filters;
using PUCIT.AIMRL.TLS.Entities;
using PUCIT.AIMRL.TLS.MainApp.Models;
using PUCIT.AIMRL.TLS.MainApp.Util;
using PUCIT.AIMRL.TLS.UI.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace PUCIT.AIMRL.TLS.MainApp.Controllers
{
    public class HomeController : BaseController
    {

        //
        // GET: /Home/
        public ActionResult Index()
        {
            return View("Dashboard");
        }

        public ActionResult ChangePassword()
        {
            return View();
        }
        
        public ActionResult Dashboard()
        {
            return View();
        }
    }
}
