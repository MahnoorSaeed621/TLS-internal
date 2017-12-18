using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Configuration;
using System.Collections;
using PUCIT.AIMRL.TLS.DAL;
using PUCIT.AIMRL.TLS.MainApp.Util;
using PUCIT.AIMRL.TLS.UI.Common;
using PUCIT.AIMRL.TLS.Entities.Security;
using PUCIT.AIMRL.TLS.Entities.DBEntities;
using PUCIT.AIMRL.TLS.MainApp.Security;
//using PUCIT.AIMRL.TLS.Entities.DBEntities;
using PUCIT.AIMRL.Common;


namespace PUCIT.AIMRL.TLS.MainApp.Models
{
    public class TLSRepository
    {
        private PRMDataService _dataService;

        private PRMDataService DataService
        {
            get
            {
                if (_dataService == null)
                    _dataService = new PRMDataService();

                return _dataService;
            }
        }

        public Object saveUser(String fname, String lname, String email, String pswrd, String gender, String uType)
        {
            //HttpContext context = HttpContext.Current;
            //context.Session["userFname"] = fname;   
            //Ses
            try
            {

           //     var result = DataService.SaveSampleUsers(fname,lname, email,pswrd,gender,uType);
                return (new
                {
                    success = true,
                    error = ""
                });

            }
            catch (Exception e)
            {
                return (new
                {
                    success = false,
                    error = "Some Error has occurred"
                });

            }

        }



        //public Object saveUser(String name, String email)
        //{

        //    try
        //    {

        //        var result = DataService.SaveSampleUsers(name, email);
        //        return (new
        //        {
        //            success = true,
        //            error = ""
        //        });

        //    }
        //    catch (Exception e)
        //    {
        //        return (new
        //        {
        //            success = false,
        //            error = "Some Error has occurred"
        //        });

        //    }

        //}

        public Object getUser(String Email)
        {
            try
            {

                var result = DataService.getSampleUserByMail(Email);
                return (new
                {
                    data = result,
                    success = true,
                    error = ""
                });

            }
            catch (Exception e)
            {
                return (new
                {
                    success = false,
                    error = "Some Error has occurred"
                });

            }
        }
    }
}