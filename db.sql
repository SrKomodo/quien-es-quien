USE [master]
GO
/****** Object:  Database [QEQC01]    Script Date: 6/12/2018 09:09:37 ******/
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
/****** Object:  User [QEQC01]    Script Date: 6/12/2018 09:09:37 ******/
CREATE USER [QEQC01] FOR LOGIN [QEQC01] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [QEQC01]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/12/2018 09:09:37 ******/
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
/****** Object:  Table [dbo].[Characteristics]    Script Date: 6/12/2018 09:09:37 ******/
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
/****** Object:  Table [dbo].[CharacteristicTypes]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  Table [dbo].[Characters]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  Table [dbo].[CharactersCharacteristics]    Script Date: 6/12/2018 09:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharactersCharacteristics](
	[characterID] [int] NOT NULL,
	[characteristicID] [int] NOT NULL,
 CONSTRAINT [PK_CharactersCharacteristics] PRIMARY KEY CLUSTERED 
(
	[characterID] ASC,
	[characteristicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  Table [dbo].[Words]    Script Date: 6/12/2018 09:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[word] [varchar](50) NOT NULL,
	[type] [varchar](4) NOT NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Characteristics] ON 

INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (1, N'azules', 2, N'eyes_blue.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (2, N'marrones', 2, N'eyes_brown.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (3, N'verdes', 2, N'eyes_green.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (4, N'3D', 3, N'glass_3d.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (5, N'modernos', 3, N'glass_modern.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (6, N'redondos', 3, N'glass_round.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (7, N'negro', 1, N'hair_black.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (8, N'rojo', 1, N'hair_red.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (9, N'rubio', 1, N'hair_yellow.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (10, N'andesita', 4, N'stone_andesite.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (11, N'marmol', 4, N'stone_marble.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (12, N'basalto', 4, N'stone_basalt.obj')
SET IDENTITY_INSERT [dbo].[Characteristics] OFF
SET IDENTITY_INSERT [dbo].[CharacteristicTypes] ON 

INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (1, N'Pelo')
INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (2, N'Ojos')
INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (3, N'Anteojos')
INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (4, N'Piedra')
SET IDENTITY_INSERT [dbo].[CharacteristicTypes] OFF
SET IDENTITY_INSERT [dbo].[Characters] ON 

INSERT [dbo].[Characters] ([ID], [name]) VALUES (1, N'Afici Flem')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (2, N'Prodigalidad Flem')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (3, N'Arte Locuaz')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (4, N'Afici Grandilocuente')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (5, N'Magnanimidad Obstinado')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (6, N'Abyecci Indubitable')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (7, N'Septenario Depravado')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (8, N'Afici Lerdo')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (9, N'Probidad Jovial')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (10, N'Tribulaci Pusil')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (11, N'Abulia Indeleble')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (12, N'Abulafia Grandioso')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (13, N'Escepticismo Exorbitante')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (14, N'Interregno Indubitable')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (15, N'Avidez Palmaria')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (16, N'Avisamiento Jovial')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (17, N'Ostentaci Zafio')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (18, N'Prodigiosidad Jovial')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (19, N'Ilaci Resoluto')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (20, N'Predio Asim')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (21, N'Felon Pusil')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (22, N'Regocijo Insulso')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (23, N'Mansedumbre Mal')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (24, N'Abulia Deso')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (25, N'Ramalazo Bizarro')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (26, N'Abarrajar Depravado')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (27, N'Cacofon Estridente')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (28, N'Arte Primoroso')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (29, N'Mansedumbre Jovial')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (30, N'Euforia Zozobra')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (31, N'Prodigiosidad Bizarro')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (32, N'Euforia Exorbitante')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (33, N'Escepticismo Aciago')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (34, N'Ilaci Ensortijado')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (35, N'Prodigiosidad Resoluto')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (36, N'Vestigio Obstinado')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (37, N'Afici Resoluto')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (38, N'Prodigiosidad Asim')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (39, N'Regocijo Bizarro')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (40, N'Albazo Pusil')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (41, N'Gula Abnegado')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (42, N'Ostentaci Obstinado')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (43, N'Nitidez Flem')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (44, N'Cacofon Ladino')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (45, N'Afici Jovial')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (46, N'Templanza Flem')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (47, N'Ponderaci Sagas')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (48, N'Brewda Grandilocuente')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (49, N'Ponderaci Abstruso')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (50, N'Predio Jovial')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (51, N'Ostentaci Indubitable')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (52, N'Chozno sagaz')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (53, N'Lacayo Depravado')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (54, N'Macram Insulso')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (55, N'Magnanimidad Lerdo')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (56, N'Probidad Zafio')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (57, N'Hegemon Jovial')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (58, N'Brewda Mal')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (59, N'Cacofon Indubitable')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (60, N'Ramalazo Ensortijado')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (61, N'Nitidez Locuaz')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (62, N'Probidad Abstruso')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (63, N'Templanza Estridente')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (268, N'Leo Guapisimo')
SET IDENTITY_INSERT [dbo].[Characters] OFF
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (1, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (1, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (1, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (1, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (2, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (2, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (2, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (2, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (3, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (3, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (3, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (3, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (4, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (4, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (4, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (4, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (5, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (5, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (5, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (5, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (6, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (6, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (6, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (6, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (7, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (7, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (7, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (7, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (8, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (8, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (8, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (8, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (9, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (9, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (9, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (9, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (10, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (10, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (10, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (10, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (11, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (11, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (11, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (11, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (12, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (12, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (12, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (12, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (13, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (13, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (13, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (13, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (14, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (14, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (14, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (14, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (15, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (15, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (15, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (15, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (16, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (16, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (16, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (16, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (17, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (17, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (17, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (17, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (18, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (18, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (18, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (18, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (19, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (19, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (19, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (19, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (20, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (20, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (20, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (20, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (21, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (21, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (21, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (21, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (22, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (22, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (22, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (22, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (23, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (23, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (23, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (23, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (24, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (24, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (24, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (24, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (25, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (25, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (25, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (25, 10)
GO
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (26, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (26, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (26, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (26, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (27, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (27, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (27, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (27, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (28, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (28, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (28, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (28, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (29, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (29, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (29, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (29, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (30, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (30, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (30, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (30, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (31, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (31, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (31, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (31, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (32, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (32, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (32, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (32, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (33, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (33, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (33, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (33, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (34, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (34, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (34, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (34, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (35, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (35, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (35, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (35, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (36, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (36, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (36, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (36, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (37, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (37, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (37, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (37, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (38, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (38, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (38, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (38, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (39, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (39, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (39, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (39, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (40, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (40, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (40, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (40, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (41, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (41, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (41, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (41, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (42, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (42, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (42, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (42, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (43, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (43, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (43, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (43, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (44, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (44, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (44, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (44, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (45, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (45, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (45, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (45, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (46, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (46, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (46, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (46, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (47, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (47, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (47, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (47, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (48, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (48, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (48, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (48, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (49, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (49, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (49, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (49, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (50, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (50, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (50, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (50, 11)
GO
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (51, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (51, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (51, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (51, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (52, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (52, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (52, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (52, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (53, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (53, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (53, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (53, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (54, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (54, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (54, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (54, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (55, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (55, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (55, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (55, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (56, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (56, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (56, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (56, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (57, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (57, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (57, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (57, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (58, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (58, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (58, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (58, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (59, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (59, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (59, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (59, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (60, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (60, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (60, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (60, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (61, 2)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (61, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (61, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (61, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (62, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (62, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (62, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (62, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (63, 1)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (63, 4)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (63, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (63, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (268, 3)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (268, 5)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (268, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (268, 10)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [bestscore], [bitcoins], [admin]) VALUES (1, N'test', 0x098F6BCD4621D373CADE4E832627B4F6, 19999, 999000, 1)
INSERT [dbo].[Users] ([id], [username], [password], [bestscore], [bitcoins], [admin]) VALUES (2, N'adm', 0xB09C600FDDC573F117449B3723F23D64, 0, 1000000, 1)
INSERT [dbo].[Users] ([id], [username], [password], [bestscore], [bitcoins], [admin]) VALUES (3, N'leo', 0x0F759DD1EA6C4C76CEDC299039CA4F23, 0, 1000000, 0)
INSERT [dbo].[Users] ([id], [username], [password], [bestscore], [bitcoins], [admin]) VALUES (4, N'adm2', 0xAE5A9733104904F8ECE1ABF0E3A9227B, 0, 1000000, 1)
INSERT [dbo].[Users] ([id], [username], [password], [bestscore], [bitcoins], [admin]) VALUES (5, N'', 0xD41D8CD98F00B204E9800998ECF8427E, 0, 1000000, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Words] ON 

INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (1, N'Resoluto', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (2, N'Imp', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (3, N'Asim', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (4, N'Aciago', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (5, N'Lerdo', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (6, N'Pusil', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (7, N'Impoluto', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (8, N'Abstruso', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (9, N'Primoroso', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (10, N'Recalcitrante', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (11, N'Estridente', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (12, N'Grandilocuente', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (13, N'Locuaz', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (14, N'Sagas', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (15, N'Injurioso', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (16, N'Depravado', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (17, N'Oneroso', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (18, N'Mal', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (19, N'Jovial', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (20, N'Iluso', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (21, N'Zafio', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (22, N'Obstinado', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (23, N'Zozobra', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (24, N'Exorbitante', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (25, N'Flem', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (26, N'Ensortijado', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (27, N'Bizarro', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (28, N'Insulso', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (29, N'Abnegado', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (30, N'Ins', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (31, N'Indubitable', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (32, N'Deso', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (33, N'At', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (34, N'Ladino', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (35, N'sagaz', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (36, N'Indeleble', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (37, N'Palmaria', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (38, N'Div', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (39, N'Fleco', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (40, N'Abulia', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (41, N'Magnanimidad', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (42, N'Escepticismo', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (43, N'Mansedumbre', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (44, N'D', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (45, N'Acongojo', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (46, N'Ostentaci', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (47, N'Euforia', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (48, N'Tribulaci', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (49, N'Templanza', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (50, N'Prurito', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (51, N'Nitidez', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (52, N'C', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (53, N'Ramalazo', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (54, N'Afici', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (55, N'Probidad', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (56, N'Gula', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (57, N'Abyecci', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (58, N'A', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (59, N'Avidez', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (60, N'Abarrajar', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (61, N'Sufragio', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (62, N'Chozno', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (63, N'Vestigio', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (64, N'Macram', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (65, N'Arte', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (66, N'Prodigalidad', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (67, N'29', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (68, N'Prodigiosidad', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (69, N'Septenario', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (70, N'Predio', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (71, N'Tegumento', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (72, N'Regocijo', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (73, N'Interregno', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (74, N'Cacofon', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (75, N'Hegemon', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (76, N'Lacayo', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (77, N'Ilaci', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (78, N'Antropoide', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (79, N'Patetismo', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (80, N'Felon', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (81, N'Ponderaci', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (82, N'Albazo', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (83, N'Avisamiento', N'sus')
SET IDENTITY_INSERT [dbo].[Words] OFF
/****** Object:  StoredProcedure [dbo].[sp_AddCharacterCharacteristic]    Script Date: 6/12/2018 09:09:38 ******/
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
	@characterid int, @characteristicid int
AS
BEGIN
	INSERT INTO CharactersCharacteristics VALUES(@characterid, @characteristicid)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ClearCharacteristics]    Script Date: 6/12/2018 09:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ClearCharacteristics]
	@id int
AS
BEGIN
	DELETE FROM CharactersCharacteristics WHERE CharactersCharacteristics.characterID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCategory]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateCharacter]    Script Date: 6/12/2018 09:09:38 ******/
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
	SELECT TOP 1 ID FROM Characters ORDER BY ID DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateCharacteristic]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteCharacter]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteCharacteristic]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 6/12/2018 09:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteUser]
	@id int
AS
BEGIN
	DELETE FROM Users WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditCharacter]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EditCharacteristic]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EditUser]    Script Date: 6/12/2018 09:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EditUser]
	@id int, @name varchar(50), @password varbinary(16), @bestscore int, @bitcoins bigint, @admin bit
AS
BEGIN
	UPDATE Users SET username = @name, password = @password, bestscore = @bestscore, bitcoins = @bitcoins, admin = @admin WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerateRandomName]    Script Date: 6/12/2018 09:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GenerateRandomName]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @A VARCHAR(50);
	SET @A = (SELECT TOP 1 word FROM Words WHERE type='adj' ORDER BY NEWID())
	DECLARE @S VARCHAR(50);
	SET @S = (SELECT TOP 1 word FROM Words WHERE type='sus' ORDER BY NEWID())

	SELECT CONCAT(@A,' ',@S)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCharacter]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCharacterCharacteristics]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristic]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristicByType]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristics]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristicTypes]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetLeaderboard]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUser]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUsers]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListCharacters]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListCharactersDeep]    Script Date: 6/12/2018 09:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListCharactersDeep]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT Characters.*, Characteristics.ID as cID, Characteristics.name, Characteristics.type, Characteristics.url FROM Characters INNER JOIN CharactersCharacteristics ON CharactersCharacteristics.characterID = Characters.ID INNER JOIN Characteristics ON Characteristics.ID = CharactersCharacteristics.characteristicID ORDER BY RAND(CHECKSUM(Characters.name))
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Register]    Script Date: 6/12/2018 09:09:38 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateBitcoins]    Script Date: 6/12/2018 09:09:38 ******/
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
