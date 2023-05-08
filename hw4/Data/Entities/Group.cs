using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hw4.Data.Entities
{
    public class Group
    {
        [Column("gr_id")]
        public int Id { get; set; }
        [Column("gr_name")]
        public string Name { get; set; }
        [Column("gr_temp")]
        public decimal? Temperature { get; set; }
    }
}
