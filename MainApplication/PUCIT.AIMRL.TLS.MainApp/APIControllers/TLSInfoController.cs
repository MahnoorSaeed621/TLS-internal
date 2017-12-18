using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using PUCIT.AIMRL.TLS.MainApp.Models;
using PUCIT.AIMRL.TLS.MainApp.Security;
using PUCIT.AIMRL.TLS.MainApp.Utils.HttpFilters;
using PUCIT.AIMRL.TLS.Entities.DBEntities;

namespace PUCIT.AIMRL.TLS.MainApp.APIControllers
{
    public class TLSInfoController : ApiController
    {

        //public class Users
        //{
        
        //    public String FName { get; set; }
        //    public String LName { get; set; }
        //    public String Gender { get; set; }
        //    public String UserType { get; set; }
        //    public String Password { get; set; }
        //    public String Email { get; set; }
        //}


        private readonly TLSRepository _repository;

        public TLSInfoController()
        {
            _repository = new TLSRepository();
        }

         private TLSRepository Repository
        {
            get
            {
                return _repository;
            }
        }

        //[HttpPost]
        //public Object saveSampleUser(Users u)
        //{
        //    return Repository.saveUser(u.Name, u.Email);
        //}

        [HttpPost]
        public Object saveUser(Users u)
        {
            //Users user = new Users();
            PUCIT.AIMRL.TLS.UI.Common.SessionManager.UserForSignUp = u;
            return null;
            //return Repository.saveUser(u.FName,u.LName, u.Email,u.Password,u.Gender,u.UserType);
        }


        [HttpGet]
        public Object getSampleUser(String mail)
        {
            return Repository.getUser(mail);
        }
    }
}
