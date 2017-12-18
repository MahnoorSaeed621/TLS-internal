using PUCIT.AIMRL.TLS.MainApp.Util;
using PUCIT.AIMRL.TLS.UI.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PUCIT.AIMRL.TLS.MainApp.Controllers
{
    public class ReportsController : BaseController
    {
        //
        // GET: /Admin/

        public ActionResult UserLoginHistory()
        {
            if (PUCIT.AIMRL.TLS.MainApp.Security.PermissionManager.perViewLoginHistoryReport== false)
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
