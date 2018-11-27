USE [master]
GO
/****** Object:  Database [QEQC01]    Script Date: 21/11/2018 16:19:59 ******/
CREATE DATABASE [QEQC01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QEQC01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QEQC01.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QEQC01_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\QEQC01_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QEQC01] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QEQC01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QEQC01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QEQC01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QEQC01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QEQC01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QEQC01] SET ARITHABORT OFF 
GO
ALTER DATABASE [QEQC01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QEQC01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QEQC01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QEQC01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QEQC01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QEQC01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QEQC01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QEQC01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QEQC01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QEQC01] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QEQC01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QEQC01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QEQC01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QEQC01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QEQC01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QEQC01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QEQC01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QEQC01] SET RECOVERY FULL 
GO
ALTER DATABASE [QEQC01] SET  MULTI_USER 
GO
ALTER DATABASE [QEQC01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QEQC01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QEQC01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QEQC01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QEQC01] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QEQC01', N'ON'
GO
ALTER DATABASE [QEQC01] SET QUERY_STORE = OFF
GO
USE [QEQC01]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [QEQC01]
GO
/****** Object:  User [QEQC01]    Script Date: 21/11/2018 16:19:59 ******/
CREATE USER [QEQC01] FOR LOGIN [QEQC01] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [QEQC01]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Characteristics]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characteristics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[type] [int] NOT NULL,
	[url] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Characteristics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharacteristicTypes]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacteristicTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CharacteristicTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_characters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharactersCharacteristics]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharactersCharacteristics](
	[characterID] [int] NOT NULL,
	[characteristicID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varbinary](16) NOT NULL,
	[bestscore] [int] NOT NULL,
	[bitcoins] [bigint] NOT NULL,
	[admin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Characteristics] ON 

INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (1, N'rojo', 1, N'pelirrojo.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (2, N'negro', 2, N'pelonegro.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (3, N'marrones', 2, N'ojosmarrones.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (4, N'Basalto', 4, N'basalt.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (5, N'Cuadrados', 3, N'cuadrado.obj')
SET IDENTITY_INSERT [dbo].[Characteristics] OFF
SET IDENTITY_INSERT [dbo].[CharacteristicTypes] ON 

INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (1, N'Pelo')
INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (2, N'Ojos')
INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (3, N'Anteojos')
INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (4, N'Piedra')
SET IDENTITY_INSERT [dbo].[CharacteristicTypes] OFF
SET IDENTITY_INSERT [dbo].[Characters] ON 

INSERT [dbo].[Characters] ([ID], [name]) VALUES (1, N'Juanma')
SET IDENTITY_INSERT [dbo].[Characters] OFF
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (1, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (1, 2)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [bestscore], [bitcoins], [admin]) VALUES (1, N'test', 0x098F6BCD4621D373CADE4E832627B4F6, 0, 1000000, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  StoredProcedure [dbo].[sp_AddCharacterCharacteristic]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddCharacterCharacteristic]
	@characterid int, @characteristic int, @value varchar(50)
AS
BEGIN
	SELECT 1 as 'code'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCategory]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateCategory]
	@name varchar(50)
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Categories WHERE Categories.name = @name)
		BEGIN
			INSERT INTO Categories VALUES(@name)
			SELECT 1 as 'code'
		END
	ELSE
		BEGIN
			SELECT 0 as 'code'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCharacter]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateCharacter]
	@name varchar(50)
AS
BEGIN
	INSERT INTO Characters VALUES(@name)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCharacteristic]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateCharacteristic]
	@name varchar(50),
	@type varchar(50),
	@url varchar(50)
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Characteristics WHERE Characteristics.name LIKE @name)
		BEGIN
			INSERT INTO Characteristics VALUES(@name, @type, @url)
			SELECT 1 as 'code', * FROM Characteristics WHERE Characteristics.name = @name
		END
	ELSE
		BEGIN
			SELECT 0 as 'code'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCharacter]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteCharacter]
	@id int
AS
BEGIN
	IF EXISTS(SELECT * FROM Characters WHERE Characters.ID = @id)
		BEGIN
			DELETE FROM Characters WHERE Characters.ID = @id
			DELETE FROM CharactersCharacteristics WHERE CharactersCharacteristics.characterID = @id
			SELECT 1 as 'code'
		END
	ELSE
		SELECT 0 as 'code'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCharacteristic]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteCharacteristic]
	@id int
AS
BEGIN
	IF EXISTS(SELECT * FROM Characteristics WHERE Characteristics.ID = @id)
		DELETE FROM Characteristics WHERE ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditCharacter]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EditCharacter]
	@ID int,
	@name varchar(50)
AS
BEGIN
	UPDATE Characters SET Characters.name=@name WHERE Characters.ID=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditCharacteristic]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EditCharacteristic]
	@id int,
	@name varchar(50),
	@type varchar(50),
	@url varchar(50)
AS
BEGIN
	IF EXISTS(SELECT * FROM Characteristics WHERE ID = @id)
		UPDATE Characteristics SET name = @name, type = @type, url = @url WHERE ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCharacter]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCharacter]
	@id int
AS
BEGIN
	SELECT * FROM Characters WHERE Characters.ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCharacterCharacteristics]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCharacterCharacteristics]
	@id int
AS
BEGIN
	IF EXISTS(SELECT * FROM Characters WHERE Characters.ID = @id)
		BEGIN
			SELECT Characteristics.* FROM CharactersCharacteristics
			INNER JOIN Characteristics ON Characteristics.ID = CharactersCharacteristics.characteristicID WHERE characterID = @id
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristic]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCharacteristic]
	@id int
AS
BEGIN
	SELECT * FROM Characteristics WHERE Characteristics.ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristicByType]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCharacteristicByType]
	@type int
AS
BEGIN
	SELECT * FROM Characteristics WHERE Characteristics.type = @type
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristics]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCharacteristics]
AS
BEGIN
	SELECT * FROM Characteristics
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristicTypes]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCharacteristicTypes]
	@id int = null
AS
BEGIN
	IF(@id IS NULL)
		SELECT * from CharacteristicTypes
	ELSE
		SELECT * from CharacteristicTypes WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLeaderboard]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLeaderboard]
	@amount int = null, @from int = null
AS
BEGIN
	IF(@amount IS NULL AND @from IS NOT NULL)
		BEGIN
			SELECT * FROM Users ORDER BY Users.bestscore DESC 
			OFFSET @from ROWS
		END
	IF(@from IS NULL AND @amount IS NOT NULL)
		BEGIN
			SELECT * FROM Users ORDER BY Users.bestscore DESC
			OFFSET 0 ROWS
			FETCH NEXT @amount ROWS ONLY
		END
	IF(@from IS NULL AND @amount IS NULL)
		BEGIN
			SELECT * FROM Users ORDER BY Users.bestscore DESC
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUser]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUser]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Users WHERE Users.id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsers]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUsers]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ListCharacters]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListCharacters]
	@quant int = null
AS
BEGIN
	if(@quant IS NULL)
		BEGIN
			SELECT * FROM Characters
		END
	ELSE
		SELECT * FROM Characters WHERE Characters.id <= @quant
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Login]
	@username varchar(50), @password varbinary(16)
AS
BEGIN
	IF EXISTS(SELECT Users.username FROM Users WHERE username = @username)
		BEGIN
			IF((SELECT Users.password FROM Users WHERE username = @username) = @password)
				BEGIN
					SELECT 1 as 'code', * FROM Users WHERE username = @username
				END
			ELSE
				BEGIN
					SELECT 0 as 'code'
				END
		END
	ELSE
		SELECT 0 as 'code'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Register]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Register]
	@username varchar(50), @password varbinary(16), @admin bit
AS
BEGIN
	IF NOT EXISTS(SELECT Users.username FROM Users WHERE username = @username)
		BEGIN
			INSERT INTO Users VALUES(@username, @password, 0, 1000000, @admin)
			SELECT 1 as 'code'
		END
	ELSE
		BEGIN
			SELECT 0 as 'code'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBitcoins]    Script Date: 21/11/2018 16:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateBitcoins]
	@username varchar(50), @bitcoins bigint = null
AS
BEGIN
	IF(@bitcoins IS NOT NULL)
		BEGIN
			UPDATE Users SET bitcoins = ((SELECT bitcoins FROM Users WHERE username = @username) + @bitcoins) WHERE username = @username
			IF((SELECT bitcoins FROM Users WHERE username = @username) <= 0)
				UPDATE Users SET bitcoins = 0 WHERE username = @username
		END
	ELSE
		BEGIN
			SELECT bitcoins FROM Users WHERE username = @username
		END
END
GO
USE [master]
GO
ALTER DATABASE [QEQC01] SET  READ_WRITE 
GO
