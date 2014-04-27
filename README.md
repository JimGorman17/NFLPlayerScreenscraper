NFLPlayerScreenscraper
======================

#### Product Features

 * Screenscrapes all NFL players from www.nfl.com.
 * Updates player information daily.
  * Including moving players to new teams and deactivating players who are no longer in the league.
 * Runs as a standalone Windows service.
 * Builds the backend database for [ScoutingApp](https://github.com/JimGorman17/ScoutingApp).
 
#### Technical Features

 * Written in C#.
 * Connects to a SQL Server database.
 * Logs all inserts, updates, deletes, and errors to the Windows Event Log,
 * Uses [ScrapySharp](https://bitbucket.org/rflechner/scrapysharp/wiki/Home) 2.2.56.
  * Which is built on top of [HtmlAgilityPack](http://htmlagilitypack.codeplex.com/) 1.4.6.
 * Uses [PetaPoco](http://www.toptensoftware.com/petapoco) 5.0.1 as a micro-ORM for data access.
 * Uses [TopShelf](https://github.com/Topshelf/Topshelf) 3.13.
