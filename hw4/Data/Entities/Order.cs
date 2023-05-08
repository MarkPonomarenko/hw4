namespace hw4.Data.Entities
{
    public class Order
    {
        public int Id { get; set; }
        public DateTime? Date { get; set; }
        public int? AnalysisId { get; set; }

        public override string? ToString()
        {
            return $"Order[ ord_id={Id}, ord_datetime={Date}, ord_an={AnalysisId} ]";
        }
    }
}
