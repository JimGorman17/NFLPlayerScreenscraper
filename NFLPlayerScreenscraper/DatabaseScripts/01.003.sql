/****** Object:  Login [NT AUTHORITY\NETWORK SERVICE]    Script Date: 03/04/2014 23:12:16 ******/
CREATE LOGIN [NT AUTHORITY\NETWORK SERVICE] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO

USE [NFL_Database]
GO

CREATE USER [NETWORK_SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO

EXEC dbo.sp_addrolemember @rolename=N'db_datareader', @membername=N'NETWORK_SERVICE'
GO
EXEC dbo.sp_addrolemember @rolename=N'db_datawriter', @membername=N'NETWORK_SERVICE'
GO