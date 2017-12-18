using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PUCIT.AIMRL.TLS.Entities.DBEntities
{
    [Table("SampleUser")]
    public class SampleUser
    {

        [Key]
        public int ID { get; set; }

        public String Name { get; set; }

        public String Email { get; set; }
    }
}
