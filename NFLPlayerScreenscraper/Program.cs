using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using HtmlAgilityPack;
using ScrapySharp.Extensions;
using ScrapySharp.Network;

namespace NFLPlayerScreenscraper
{
    class Program
    {
        const string BaseUrl = "http://www.nfl.com";

        private class Player
        {
            public string Position { get; set; }
            public string Number { get; set; }
            public string Name { get; set; }
            public string Status { get; set; }
            public string Team { get; set; }

            public override string ToString()
            {
                return Position + "\t" + Number + "\t" + Name + "\t" + Status + "\t" + Team;
            }
        }

        static void Main(string[] args)
        {
            var browser = new ScrapingBrowser();
            var htmlWeb = new HtmlWeb();
            var players = new ConcurrentBag<Player>();

            Parallel.For ('A', 'Z' + 1, c =>
            {
                Console.Write("\rLoading {0}", Convert.ToChar(c));
                var startUrl = String.Format("/players/search?category=lastName&filter={0}&playerType=current", Convert.ToChar(c));
                var doc = htmlWeb.Load(BaseUrl + startUrl);
                LoadAPageOfPlayers(browser, doc.DocumentNode, players);
            });

            //Console.WriteLine(players.Count());
            //Console.ReadLine();

            players.OrderBy(p => p.Name).ToList().ForEach(Console.WriteLine);
            Console.ReadLine();
        }

        private static void LoadAPageOfPlayers(ScrapingBrowser browser, HtmlNode rootNode, ConcurrentBag<Player> players)
        {
            var tbody = rootNode.CssSelect("#result > tbody").SingleOrDefault();
            if (tbody == null)
            {
                return;
            }

            var childRows = tbody.ChildNodes.Skip(1).ToList();
            LoadPlayers(players, childRows);

            var searchResults = tbody.OwnerDocument.DocumentNode.CssSelect("#searchResults").Single();
            if (searchResults.ChildNodes.Any() == false)
            {
                return;
            }

            var navigationRow = searchResults.ChildNodes[1];
            var nextButton = navigationRow.ChildNodes.SingleOrDefault(n => n.InnerText.Trim() == "next");
            if (nextButton != null)
            {
                var value = nextButton.Attributes.Single(a => a.Name == "href").Value;
                var uriString = BaseUrl + HttpUtility.HtmlDecode(value);
                var page = browser.NavigateToPage(new Uri(uriString));

                LoadAPageOfPlayers(browser, page.Html, players);
            }
        }

        private static void LoadPlayers(ConcurrentBag<Player> players, IEnumerable<HtmlNode> childRows)
        {
            foreach (var childRow in childRows)
            {
                var childNodes = childRow.ChildNodes;
                if (childNodes.Any() == false)
                {
                    continue;
                }

                if (childNodes.Count() < 26)
                {
                    throw new InvalidOperationException(String.Format("This method expects rows with at least 26 inner nodes. This row had '{0}' inner nodes", childNodes.Count));
                }

                var player = new Player
                                 {
                                     Position = childNodes[1].InnerText,
                                     Number = childNodes[3].InnerText,
                                     Name = childNodes[5].InnerText,
                                     Status = childNodes[7].InnerText,
                                     Team = childNodes[25].InnerText
                                 };

                players.Add(player);
            }
        }
    }
}
