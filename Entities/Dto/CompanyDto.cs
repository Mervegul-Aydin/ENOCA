using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Dto
{
    public class CompanyDto :BaseDto
    {
        public bool IsActive { get; set; }
        public string OrderStartTime { get; set; }
        public string OrderFinishTime { get; set; }
    }
}
