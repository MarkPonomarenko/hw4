﻿namespace hw4.Data.Entities
{
    public class Analysis
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public decimal? Cost { get; set; }
        public decimal? Price { get; set; }
        public int? GroupId { get; set; }
    }
}
