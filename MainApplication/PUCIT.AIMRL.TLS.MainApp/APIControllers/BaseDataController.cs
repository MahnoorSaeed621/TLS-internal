using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using PUCIT.AIMRL.TLS.MainApp.Security;

namespace PUCIT.AIMRL.TLS.MainApp.APIControllers
{

    [AuthorizedForWebAPI]
    public class BaseDataController : ApiController
    {        

    }
}