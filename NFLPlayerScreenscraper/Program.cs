﻿using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using HtmlAgilityPack;
using NFLPlayerScreenscraper.Models;
using PetaPoco;
using ScrapySharp.Extensions;
using ScrapySharp.Network;

namespace NFLPlayerScreenscraper
{
    class Program
    {
        private static readonly Database Database = new Database("localDB");
        const string BaseUrl = "http://www.nfl.com";

        static void Main(string[] args)
        {
            WriteBanner();

            var players = GetPlayersFromWeb();
            ClearLine();
            var changeCounts = UpdateTheDatabase(players);
            ClearLine();

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Done.");
            Console.WriteLine("{0} players were inserted.", changeCounts.Inserted);
            Console.WriteLine("{0} players were updated.", changeCounts.Updated);

            Console.ResetColor();

            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("--- Press <ENTER> to exit. ---");

            Console.ReadLine();
        }

        private static void WriteBanner()
        {
            Console.WriteLine("**************************************************");
            Console.WriteLine("NFL Player Screenscraper Program");
            Console.WriteLine("by Jim Gorman, December 2013");
            Console.WriteLine("https://github.com/TKirby42/NFLPlayerScreenscraper");
            Console.WriteLine("**************************************************");
            Console.WriteLine();
        }

        private static IEnumerable<Player> GetPlayersFromWeb()
        {
            var browser = new ScrapingBrowser();
            var htmlWeb = new HtmlWeb();
            var players = new ConcurrentBag<Player>();

            Parallel.For('A', 'Z' + 1, c =>
                {
                    Console.Write("\rLoading players whose last names begins with '{0}'.", Convert.ToChar(c));
                    var startUrl = String.Format("/players/search?category=lastName&filter={0}&playerType=current",
                                                 Convert.ToChar(c));
                    var doc = htmlWeb.Load(BaseUrl + startUrl);
                    LoadAPageOfPlayers(browser, doc.DocumentNode, players);
                });

            //Console.WriteLine(players.Count());
            //Console.ReadLine();

            //players.OrderBy(p => p.Name).ToList().ForEach(Console.WriteLine);
            return players;
        }

        private static void ClearLine()
        {
            Console.Write("\r" + new string(' ', Console.WindowWidth) + "\r");
        }

        private static ChangeCounts UpdateTheDatabase(IEnumerable<Player> playersRetrievedFromTheWebSite)
        {
            Console.Write("\rUpdating the players table in the database.");

            var changeCounts = new ChangeCounts();
            foreach (var retrievedPlayer in playersRetrievedFromTheWebSite)
            {
                var existingPlayerInTheDatabase = GetPlayerBySourcePlayerId(retrievedPlayer.SourcePlayerId);
                if (existingPlayerInTheDatabase != null)
                {
                    if (existingPlayerInTheDatabase.Position != retrievedPlayer.Position ||
                        existingPlayerInTheDatabase.Number != retrievedPlayer.Number ||
                        existingPlayerInTheDatabase.LastName != retrievedPlayer.LastName ||
                        existingPlayerInTheDatabase.FirstName != retrievedPlayer.FirstName ||
                        existingPlayerInTheDatabase.Status != retrievedPlayer.Status ||
                        existingPlayerInTheDatabase.Team != retrievedPlayer.Team)
                    {
                        existingPlayerInTheDatabase.Position = retrievedPlayer.Position;
                        existingPlayerInTheDatabase.Number = retrievedPlayer.Number;
                        existingPlayerInTheDatabase.LastName = retrievedPlayer.LastName;
                        existingPlayerInTheDatabase.FirstName = retrievedPlayer.FirstName;
                        existingPlayerInTheDatabase.Status = retrievedPlayer.Status;
                        existingPlayerInTheDatabase.Team = retrievedPlayer.Team;
                        existingPlayerInTheDatabase.UpdateDate = DateTimeOffset.Now;
                        Database.Update(existingPlayerInTheDatabase);

                        changeCounts.Updated++;
                    }
                }
                else
                {
                    Database.Insert("Players", "PlayerID", retrievedPlayer);
                    changeCounts.Inserted++;
                }
            }

            return changeCounts;
        }

        public class ChangeCounts
        {
            public int Inserted { get; set; }
            public int Updated { get; set; }
        }

        private static Player GetPlayerBySourcePlayerId(int sourcePlayerId)
        {
            return Database.SingleOrDefault<Player>("WHERE SourcePlayerID=@0", sourcePlayerId);
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
            foreach (var childNodes in childRows.Select(childRow => childRow.ChildNodes).Where(childNodes => childNodes.Any()))
            {
                if (childNodes.Count() < 26)
                {
                    throw new InvalidOperationException(String.Format("This method expects rows with at least 26 inner nodes. This row had '{0}' inner nodes", childNodes.Count));
                }

                var name = childNodes[5].InnerText.Split(',');
                var lastName = name.First().Trim();
                var firstName = name.Skip(1).FirstOrDefault();
                if (String.IsNullOrEmpty(firstName) == false)
                {
                    firstName = firstName.Trim();
                }

                var player = new Player
                    {
                        Position = childNodes[1].InnerText,
                        Number = childNodes[3].InnerText,
                        LastName = lastName,
                        FirstName = firstName,
                        Status = childNodes[7].InnerText,
                        Team = childNodes[25].InnerText,
                        SourcePlayerId = int.Parse(childNodes[5].ChildNodes.Single(cn => cn.Name == "a").Attributes.Single(a => a.Name == "href").Value.Split('/')[3]),
                        CreateDate = DateTimeOffset.Now
                    };

                players.Add(player);
            }
        }
    }
}
