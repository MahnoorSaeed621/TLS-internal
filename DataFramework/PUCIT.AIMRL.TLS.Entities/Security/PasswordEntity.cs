using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PUCIT.AIMRL.TLS.Entities
{
    public class PasswordEntity
    {
        public String ID { get; set; }
        public String CurrentPassword { get; set; }

        public String NewPassword { get; set; }
    }
}
