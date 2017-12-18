using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace PUCIT.AIMRL.TLS.Entities.DBEntities
{

    [Table("Users")]
    public class Users
    {

        [Key]
        public int UserId { get; set; }
        public String Login { get; set; }
        public String Email { get; set; }
        public String Password { get; set; }
        public String FirstName { get; set; }
        public String LastName { get; set; }
        public String Gender { get; set; }
        public int UserType { get; set; }
        public DateTime DateOfBirth { get; set; }
        public String Cnic { get; set; }
        public String CellNo { get; set; }
        public String LandLine { get; set; }
        public String ProfilePicture { get; set; }

    }

}
