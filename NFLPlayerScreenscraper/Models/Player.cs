namespace NFLPlayerScreenscraper.Models
{
    internal class Player
    {
        public string Position { get; set; }
        public string Number { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Status { get; set; }
        public string Team { get; set; }

        public override string ToString()
        {
            return Position + "\t" + Number + "\t" + LastName + ", " + FirstName + "\t" + Status + "\t" + Team;
        }
    }
}