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
	[CenterPoint] [geography] NOT NULL,
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
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (1, N'Arizona', N'Cardinals', N'ARI', N'NFC', N'West', 0xE6100000010CEC51B81E85C34040CDCCCCCCCC105CC0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (2, N'Atlanta', N'Falcons', N'ATL', N'NFC', N'South', 0xE6100000010C27A089B0E1E140403D9B559FAB1955C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (3, N'Baltimore', N'Ravens', N'BAL', N'AFC', N'Central', 0xE6100000010C1B07A8BA91A343402E0A719BDF2753C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (4, N'Buffalo', N'Bills', N'BUF', N'AFC', N'East', 0xE6100000010CC2172653056345403C4ED1915CB253C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (5, N'Carolina', N'Panthers', N'CAR', N'NFC', N'South', 0xE6100000010CE9B7AF03E79C4140D8817346943654C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (6, N'Chicago', N'Bears', N'CHI', N'NFC', N'Central', 0xE6100000010C6666666666EE44405DDC460378E755C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (7, N'Cincinnati', N'Bengals', N'CIN', N'AFC', N'Central', 0xE6100000010CEA043411368C43401B2FDD24062155C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (8, N'Cleveland', N'Browns', N'CLE', N'AFC', N'Central', 0xE6100000010CB84082E2C7C04440A2B437F8C26C54C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (9, N'Dallas', N'Cowboys', N'DAL', N'NFC', N'East', 0xE6100000010C48E17A14AE5F4040448B6CE7FB4558C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (10, N'Denver', N'Broncos', N'DEN', N'AFC', N'West', 0xE6100000010C556D37C137DF4340E17A14AE47415AC0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (11, N'Detroit', N'Lions', N'DET', N'NFC', N'Central', 0xE6100000010CEC51B81E852B4540A52C431CEBC254C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (12, N'Green Bay', N'Packers', N'GB ', N'NFC', N'Central', 0xE6100000010C711B0DE02D404640EB73B515FB0356C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (13, N'Houston', N'Texans', N'HOU', N'AFC', N'South', 0xE6100000010C3A92CB7F48AF3D40984C158C4ADA57C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (14, N'Indianapolis', N'Colts', N'IND', N'AFC', N'South', 0xE6100000010C45D8F0F44AE143406DC5FEB27B8A55C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (15, N'Jacksonville', N'Jaguars', N'JAC', N'AFC', N'South', 0xE6100000010CA52C431CEB523E40CDCCCCCCCC6854C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (16, N'Kansas City', N'Chiefs', N'KC ', N'AFC', N'West', 0xE6100000010C2063EE5A4286434034A2B437F89E57C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (17, N'Miami', N'Dolphins', N'MIA', N'AFC', N'East', 0xE6100000010C304CA60A46F53940ECC039234A0F54C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (18, N'Minnesota', N'Vikings', N'MIN', N'NFC', N'Central', 0xE6100000010C86C954C1A87C46403FC6DCB5845057C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (19, N'New England', N'Patriots', N'NE ', N'AFC', N'East', 0xE6100000010C6B9A779CA20B45404D158C4AEAD051C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (20, N'New Orleans', N'Saints', N'NO ', N'NFC', N'South', 0xE6100000010C6C09F9A067F33D4029ED0DBE308556C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (21, N'New York', N'Giants', N'NYG', N'NFC', N'East', 0xE6100000010C4703780B24684440A2B437F8C28452C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (22, N'New York', N'Jets', N'NYJ', N'AFC', N'East', 0xE6100000010C4703780B24684440A2B437F8C28452C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (23, N'Oakland', N'Raiders', N'OAK', N'AFC', N'West', 0xE6100000010C9C33A2B437E04240F7E461A1D68C5EC0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (24, N'Philadelphia', N'Eagles', N'PHI', N'NFC', N'East', 0xE6100000010C4F1E166A4DF343401F85EB51B8CA52C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (25, N'Pittsburgh', N'Steelers', N'PIT', N'AFC', N'Central', 0xE6100000010CC58F31772D394440B7D100DE020154C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (26, N'San Diego', N'Chargers', N'SD ', N'AFC', N'West', 0xE6100000010CB1BFEC9E3C6440401DC9E53FA4475DC0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (27, N'Seattle', N'Seahawks', N'SEA', N'NFC', N'West', 0xE6100000010C87A757CA32CC47405305A3923A955EC0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (28, N'San Francisco', N'49ers', N'SF ', N'NFC', N'West', 0xE6100000010CDD42572250DB4240847EA65EB7985EC0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (29, N'St. Louis', N'Rams', N'STL', N'NFC', N'West', 0xE6100000010C54742497FF504340A301BC05128C56C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (30, N'Tampa Bay', N'Buccaneers', N'TB ', N'NFC', N'South', 0xE6100000010CD26F5F07CEF93B40EA04341136A054C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (31, N'Tennessee', N'Titans', N'TEN', N'AFC', N'South', 0xE6100000010CF7065F984C1542409A081B9E5EB155C0)
INSERT [dbo].[Teams] ([TeamID], [Location], [Nickname], [Abbreviation], [Conference], [Division], [CenterPoint]) VALUES (32, N'Washington', N'Redskins', N'WAS', N'NFC', N'East', 0xE6100000010C87A757CA3274434065AA6054523753C0)
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
	[CreateDate] [datetimeoffset] NOT NULL,
	[UpdateDate] [datetimeoffset] NULL,
	[IsActive] [bit] NOT NULL
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
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Players]') AND name = N'IX_Players_SourcePlayerID')
CREATE NONCLUSTERED INDEX [IX_Players_SourcePlayerID] ON [dbo].[Players] 
(
	[SourcePlayerID] ASC
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