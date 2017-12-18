using PUCIT.AIMRL.TLS.Entities.DBEntities;
using PUCIT.AIMRL.TLS.MainApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace PUCIT.AIMRL.TLS.MainApp.APIControllers
{


    public class AdminController : BaseDataController
    {
        //
        // GET: /Admin/

        private readonly AdminRepository _repository;

        public AdminController()
        {
            _repository = new AdminRepository();
        }
        private AdminRepository Repository
        {
            get
            {
                return _repository;
            }
        }
        

        [HttpPost]
        public Object ValidateUser(Login pLogin)
        {
            try
            {
                UserInfoRepository userInfoRepo = new UserInfoRepository();
                return userInfoRepo.ValidateUser(pLogin.UserName, "", true, true);
            }
            catch (Exception ex)
            {
                return (new
                {
                    success = false,
                    error = "Some Error has occurred"
                });
            }
        }

        [HttpGet]
        public Object SearchUser(string key)
        {

            return Repository.SearchUser(key);
        }
    }
    public class Login
    {
        public String UserName { get; set; }
    }
}
