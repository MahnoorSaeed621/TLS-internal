using PUCIT.AIMRL.TLS.DAL;
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
    public class AdminController : BaseController
    {
        //
        // GET: /Admin/

        public ActionResult LoginAs()
        {
            if (PUCIT.AIMRL.TLS.MainApp.Security.PermissionManager.perCanLoginAsOtherUser==false)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View("LoginAsAnotherUser");
            }
        }
    }
}
