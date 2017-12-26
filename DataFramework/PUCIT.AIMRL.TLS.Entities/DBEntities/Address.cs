using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PUCIT.AIMRL.TLS.Entities.DBEntities
{
    

    [Table("Address")]
    public class Address
    {

        [Key]
        public int Address_id { get; set; }
        public String Line1 { get; set; }
        public String Line2 { get; set; }
        public String CityName { get; set; }
        public int PostalCode { get; set; }
        public String ProvinceName { get; set; }
        
    }

}
