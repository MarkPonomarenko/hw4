using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace hw4.Data.Entities
{
    public class Order
    {
        [Key]
        [Column("ord_id")]
        public int Id { get; set; }
        [Column("ord_datetime")]
        public DateTime? DateTime { get; set; }
        [Column("ord_an")]
        public int? AnalysisId { get; set; }

        public override string? ToString()
        {
            return $"Order[ ord_id={Id}, ord_datetime={DateTime}, ord_an={AnalysisId} ]";
        }
    }
}
