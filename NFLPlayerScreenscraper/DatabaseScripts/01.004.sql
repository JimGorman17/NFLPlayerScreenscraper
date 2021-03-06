﻿USE [NFL_Database]
GO
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Comments_Deleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comments]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comments_Deleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [DF_Comments_Deleted]
END


End
GO
/****** Object:  ForeignKey [FK_Comments_Players]    Script Date: 03/08/2014 00:17:47 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comments_Players]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comments]'))
ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Players]
GO
/****** Object:  ForeignKey [FK_Comments_Users]    Script Date: 03/08/2014 00:17:47 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comments_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comments]'))
ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Users]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 03/08/2014 00:17:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comments]') AND type in (N'U'))
DROP TABLE [dbo].[Comments]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/08/2014 00:17:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/08/2014 00:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[GoogleID] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[GivenName] [nvarchar](100) NULL,
	[FamilyName] [nvarchar](100) NULL,
	[Link] [nvarchar](100) NULL,
	[Picture] [nvarchar](150) NULL,
	[Gender] [nvarchar](6) NULL,
	[Locale] [nvarchar](10) NULL,
	[CreateDate] [datetimeoffset] NOT NULL,
	[UpdateDate] [datetimeoffset] NULL,
	[FavoriteTeamID] [int] NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[GoogleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK_Users] UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK_Users_Teams]    Script Date: 03/31/2014 20:37:01 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Teams]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Teams] FOREIGN KEY([FavoriteTeamID])
REFERENCES [dbo].[Teams] ([TeamID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Users_Teams]') AND parent_object_id = OBJECT_ID(N'[dbo].[Users]'))
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Teams]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 03/08/2014 00:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[GoogleID] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](140) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreateDate] [datetimeoffset] NOT NULL,
	[UpdateDate] [datetimeoffset] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Comments]') AND name = N'IX_Comments')
CREATE NONCLUSTERED INDEX [IX_Comments] ON [dbo].[Comments] 
(
	[PlayerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF_Comments_Deleted]    Script Date: 03/08/2014 00:17:47 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Comments_Deleted]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comments]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Comments_Deleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comments_Deleted]  DEFAULT ((0)) FOR [Deleted]
END


End
GO
/****** Object:  ForeignKey [FK_Comments_Players]    Script Date: 03/08/2014 00:17:47 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comments_Players]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comments]'))
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Players] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Players] ([PlayerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comments_Players]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comments]'))
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Players]
GO
/****** Object:  ForeignKey [FK_Comments_Users]    Script Date: 03/08/2014 00:17:47 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comments_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comments]'))
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([GoogleID])
REFERENCES [dbo].[Users] ([GoogleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Comments_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comments]'))
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO

/****** Object:  Table [dbo].[AuthTokens]    Script Date: 03/09/2014 23:50:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthTokens]') AND type in (N'U'))
DROP TABLE [dbo].[AuthTokens]
GO
/****** Object:  Table [dbo].[AuthTokens]    Script Date: 03/09/2014 23:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuthTokens]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuthTokens](
	[AuthTokenID] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nchar](150) NOT NULL,
	[GoogleID] [nvarchar](50) NOT NULL,
	[CreateDate] [datetimeoffset] NOT NULL,
 CONSTRAINT [PK_AuthTokens] PRIMARY KEY CLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK_ErrorLogs_Users]    Script Date: 04/04/2014 22:18:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ErrorLogs_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ErrorLogs]'))
ALTER TABLE [dbo].[ErrorLogs] DROP CONSTRAINT [FK_ErrorLogs_Users]
GO
/****** Object:  ForeignKey [FK_ErrorLogs_Users1]    Script Date: 04/04/2014 22:18:20 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ErrorLogs_Users1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ErrorLogs]'))
ALTER TABLE [dbo].[ErrorLogs] DROP CONSTRAINT [FK_ErrorLogs_Users1]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 04/04/2014 22:18:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorLogs]') AND type in (N'U'))
DROP TABLE [dbo].[ErrorLogs]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 04/04/2014 22:18:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorLogs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ErrorLogs](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[Application] [nvarchar](100) NOT NULL,
	[PhoneID] [nvarchar](50) NULL,
	[Message] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[CreateDate] [datetimeoffset](7) NOT NULL,
	[UserID] [int] NULL,
	[GoogleID] [nvarchar](50) NULL,
 CONSTRAINT [PK_ErrorLogs] PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK_ErrorLogs_Users]    Script Date: 04/04/2014 22:18:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ErrorLogs_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ErrorLogs]'))
ALTER TABLE [dbo].[ErrorLogs]  WITH CHECK ADD  CONSTRAINT [FK_ErrorLogs_Users] FOREIGN KEY([GoogleID])
REFERENCES [dbo].[Users] ([GoogleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ErrorLogs_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[ErrorLogs]'))
ALTER TABLE [dbo].[ErrorLogs] CHECK CONSTRAINT [FK_ErrorLogs_Users]
GO
/****** Object:  ForeignKey [FK_ErrorLogs_Users1]    Script Date: 04/04/2014 22:18:20 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ErrorLogs_Users1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ErrorLogs]'))
ALTER TABLE [dbo].[ErrorLogs]  WITH CHECK ADD  CONSTRAINT [FK_ErrorLogs_Users1] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ErrorLogs_Users1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ErrorLogs]'))
ALTER TABLE [dbo].[ErrorLogs] CHECK CONSTRAINT [FK_ErrorLogs_Users1]
GO
/****** Object:  ForeignKey [FK_FlaggedComments_Comments]    Script Date: 04/08/2014 13:48:58 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FlaggedComments_Comments]') AND parent_object_id = OBJECT_ID(N'[dbo].[FlaggedComments]'))
ALTER TABLE [dbo].[FlaggedComments] DROP CONSTRAINT [FK_FlaggedComments_Comments]
GO
/****** Object:  ForeignKey [FK_FlaggedComments_Users]    Script Date: 04/08/2014 13:48:58 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FlaggedComments_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[FlaggedComments]'))
ALTER TABLE [dbo].[FlaggedComments] DROP CONSTRAINT [FK_FlaggedComments_Users]
GO
/****** Object:  Table [dbo].[FlaggedComments]    Script Date: 04/08/2014 13:48:58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FlaggedComments]') AND type in (N'U'))
DROP TABLE [dbo].[FlaggedComments]
GO
/****** Object:  Table [dbo].[FlaggedComments]    Script Date: 04/08/2014 13:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FlaggedComments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FlaggedComments](
	[FlaggedCommentID] [int] IDENTITY(1,1) NOT NULL,
	[CommentID] [int] NOT NULL,
	[GoogleID] [nvarchar](50) NOT NULL,
	[FlaggedDate] [datetimeoffset](7) NOT NULL,
	[Handled] [bit] NOT NULL,
 CONSTRAINT [PK_FlaggedComments] PRIMARY KEY CLUSTERED 
(
	[FlaggedCommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK_FlaggedComments_Comments]    Script Date: 04/08/2014 13:48:58 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FlaggedComments_Comments]') AND parent_object_id = OBJECT_ID(N'[dbo].[FlaggedComments]'))
ALTER TABLE [dbo].[FlaggedComments]  WITH CHECK ADD  CONSTRAINT [FK_FlaggedComments_Comments] FOREIGN KEY([CommentID])
REFERENCES [dbo].[Comments] ([CommentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FlaggedComments_Comments]') AND parent_object_id = OBJECT_ID(N'[dbo].[FlaggedComments]'))
ALTER TABLE [dbo].[FlaggedComments] CHECK CONSTRAINT [FK_FlaggedComments_Comments]
GO
/****** Object:  ForeignKey [FK_FlaggedComments_Users]    Script Date: 04/08/2014 13:48:58 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FlaggedComments_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[FlaggedComments]'))
ALTER TABLE [dbo].[FlaggedComments]  WITH CHECK ADD  CONSTRAINT [FK_FlaggedComments_Users] FOREIGN KEY([GoogleID])
REFERENCES [dbo].[Users] ([GoogleID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FlaggedComments_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[FlaggedComments]'))
ALTER TABLE [dbo].[FlaggedComments] CHECK CONSTRAINT [FK_FlaggedComments_Users]
GO
