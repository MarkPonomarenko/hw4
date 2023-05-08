using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hw4.Data.Entities
{
    public class Analysis
    {
        [Column("an_id")]
        public int Id { get; set; }
        [Column("an_name")]
        public string? Name { get; set; }
        [Column("an_cost")]
        public decimal? Cost { get; set; }
        [Column("an_price")]
        public decimal? Price { get; set; }
        [Column("an_group")]
        public int? GroupId { get; set; }
    }
}
