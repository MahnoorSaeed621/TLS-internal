using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using PUCIT.AIMRL.TLS.MainApp.Models;
using PUCIT.AIMRL.TLS.Entities.DBEntities;
using PUCIT.AIMRL.TLS.Entities;

namespace PUCIT.AIMRL.TLS.MainApp.APIControllers
{
    public class DashboardController : BaseDataController
    {
        private readonly DashboardRepository _repository;
        public DashboardController()
        {
            _repository = new DashboardRepository();
        }

        private DashboardRepository Repository
        {
            get
            {
                return _repository;
            }
        }
        
        [HttpGet]
        public Object changePassword(PasswordEntity pass)
        {
            return Repository.changePassword(pass);
        }
    }
}

