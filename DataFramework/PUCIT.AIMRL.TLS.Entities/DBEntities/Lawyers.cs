using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PUCIT.AIMRL.TLS.Entities.DBEntities
{
    [Table("Lawyers")]
    public class Lawyers
    {

        [Key]
        public int LawyerId { get; set; }
        public int LicenseNo { get; set; }
        public String ShortIntro { get; set; }
        public int ChamberCount { get; set; }
        public int CourtCount { get; set; }
        public DateTime ModifiedOn { get; set; }
        public int ModifiedBy { get; set; }

    }
}
