USE [NFL_Database]
GO
/****** Object:  ForeignKey [FK_Players_Teams]    Script Date: 01/19/2014 12:00:19 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Players_Teams]') AND parent_object_id = OBJECT_ID(N'[dbo].[Players]'))
ALTER TABLE [dbo].[Players] DROP CONSTRAINT [FK_Players_Teams]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 01/19/2014 12:00:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Players]') AND type in (N'U'))
DROP TABLE [dbo].[Players]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 01/19/2014 12:00:19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Teams]') AND type in (N'U'))
DROP TABLE [dbo].[Teams]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 01/19/2014 12:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Teams]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Teams](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Nickname] [nvarchar](50) NOT NULL,
	[Abbreviation] [nvarchar](3) NOT NULL,
	[Conference] [nvarchar](3) NOT NULL,
	[Division] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_Teams] UNIQUE NONCLUSTERED 
(
	[Abbreviation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Teams] ON
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (1, N'Arizona', N'Cardinals', N'ARI', N'NFC', N'West')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (2, N'Atlanta', N'Falcons', N'ATL', N'NFC', N'South')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (3, N'Baltimore', N'Ravens', N'BAL', N'AFC', N'Central')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (4, N'Buffalo', N'Bills', N'BUF', N'AFC', N'East')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (5, N'Carolina', N'Panthers', N'CAR', N'NFC', N'South')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (6, N'Chicago', N'Bears', N'CHI', N'NFC', N'Central')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (7, N'Cincinnati', N'Bengals', N'CIN', N'AFC', N'Central')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (8, N'Cleveland', N'Browns', N'CLE', N'AFC', N'Central')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (9, N'Dallas', N'Cowboys', N'DAL', N'NFC', N'East')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (10, N'Denver', N'Broncos', N'DEN', N'AFC', N'West')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (11, N'Detroit', N'Lions', N'DET', N'NFC', N'Central')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (12, N'Green Bay', N'Packers', N'GB ', N'NFC', N'Central')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (13, N'Houston', N'Texans', N'HOU', N'AFC', N'South')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (14, N'Indianapolis', N'Colts', N'IND', N'AFC', N'South')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (15, N'Jacksonville', N'Jaguars', N'JAC', N'AFC', N'South')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (16, N'Kansas City', N'Chiefs', N'KC ', N'AFC', N'West')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (17, N'Miami', N'Dolphins', N'MIA', N'AFC', N'East')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (18, N'Minnesota', N'Vikings', N'MIN', N'NFC', N'Central')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (19, N'New England', N'Patriots', N'NE ', N'AFC', N'East')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (20, N'New Orleans', N'Saints', N'NO ', N'NFC', N'South')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (21, N'New York', N'Giants', N'NYG', N'NFC', N'East')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (22, N'New York', N'Jets', N'NYJ', N'AFC', N'East')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (23, N'Oakland', N'Raiders', N'OAK', N'AFC', N'West')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (24, N'Philadelphia', N'Eagles', N'PHI', N'NFC', N'East')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (25, N'Pittsburgh', N'Steelers', N'PIT', N'AFC', N'Central')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (26, N'San Diego', N'Chargers', N'SD ', N'AFC', N'West')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (27, N'Seattle', N'Seahawks', N'SEA', N'NFC', N'West')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (28, N'San Francisco', N'49ers', N'SF ', N'NFC', N'West')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (29, N'St. Louis', N'Rams', N'STL', N'NFC', N'West')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (30, N'Tampa Bay', N'Buccaneers', N'TB ', N'NFC', N'South')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (31, N'Tennessee', N'Titans', N'TEN', N'AFC', N'South')
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division]) VALUES (32, N'Washington', N'Redskins', N'WAS', N'NFC', N'East')
SET IDENTITY_INSERT [dbo].[Teams] OFF
/****** Object:  Table [dbo].[Players]    Script Date: 01/19/2014 12:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Players]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Players](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[Position] [nvarchar](3) NULL,
	[Number] [nvarchar](2) NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Status] [nvarchar](3) NULL,
	[Team] [nvarchar](3) NULL,
	[SourcePlayerID] [int] NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
CONSTRAINT [UK_Players] UNIQUE NONCLUSTERED 
(
	[SourcePlayerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Players]') AND name = N'IX_Players')
CREATE NONCLUSTERED INDEX [IX_Players] ON [dbo].[Players] 
(
	[LastName] ASC,
	[FirstName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Players_Teams]    Script Date: 01/19/2014 12:00:19 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Players_Teams]') AND parent_object_id = OBJECT_ID(N'[dbo].[Players]'))
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Teams] FOREIGN KEY([Team])
REFERENCES [dbo].[Teams] ([Abbreviation])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Players_Teams]') AND parent_object_id = OBJECT_ID(N'[dbo].[Players]'))
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Teams]
GO
