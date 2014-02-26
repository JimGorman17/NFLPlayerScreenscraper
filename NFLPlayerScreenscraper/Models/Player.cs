using System;

namespace NFLPlayerScreenscraper.Models
{
    [PetaPoco.TableName("Players")]
    [PetaPoco.PrimaryKey("PlayerID")]
    internal class Player
    {
        public int PlayerId { get; set; }
        public string Position { get; set; }
        public string Number { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Status { get; set; }
        public string Team { get; set; }
        public int SourcePlayerId { get; set; }
        public DateTimeOffset CreateDate { get; set; }
        public DateTimeOffset? UpdateDate { get; set; }
        public bool IsActive { get; set; }

        public override string ToString()
        {
            return Position + "\t" + Number + "\t" + LastName + ", " + FirstName + "\t" + Status + "\t" + Team;
        }
    }
}