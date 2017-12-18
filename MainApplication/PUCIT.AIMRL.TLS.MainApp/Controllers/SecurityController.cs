using PUCIT.AIMRL.TLS.MainApp.Util;
using PUCIT.AIMRL.TLS.UI.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PUCIT.AIMRL.TLS.MainApp.Controllers
{
    public class SecurityController : BaseController
    {
        public ActionResult Index()
        {
            if (PUCIT.AIMRL.TLS.MainApp.Security.PermissionManager.perManageSecurityUsers == false)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return RedirectToAction("Permissions");
            }
        }

        //
        // GET: /Admin/
        public ActionResult Users()
        {
            if (PUCIT.AIMRL.TLS.MainApp.Security.PermissionManager.perManageSecurityUsers== false)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View();
            }
        }
        public ActionResult Roles()
        {
            if (PUCIT.AIMRL.TLS.MainApp.Security.PermissionManager.perManageSecurityRoles == false)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.Id = 1;
                return View();
            }
        }
        public ActionResult Permissions()
        {
            if (PUCIT.AIMRL.TLS.MainApp.Security.PermissionManager.perManageSecurityPermissions == false)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.Id = 2;
                return View();
            }
        }
    }
}
