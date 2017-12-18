using PUCIT.AIMRL.TLS.MainApp.Util;
using PUCIT.AIMRL.TLS.UI.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PUCIT.AIMRL.TLS.MainApp.Controllers
{
    public class PartialController : BaseController
    {
        public ActionResult YesNoModal()
        {
            return PartialView();
        }

    }
}
