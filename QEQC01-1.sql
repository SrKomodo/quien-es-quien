USE [master]
GO
/****** Object:  Database [QEQC01]    Script Date: 04/12/2018 21:39:29 ******/
CREATE DATABASE [QEQC01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QEQC01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QEQC01.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QEQC01_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QEQC01_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QEQC01] SET COMPATIBILITY_LEVEL = 110
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
USE [QEQC01]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  Table [dbo].[Characteristics]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  Table [dbo].[CharacteristicTypes]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  Table [dbo].[Characters]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  Table [dbo].[CharactersCharacteristics]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  Table [dbo].[Words]    Script Date: 04/12/2018 21:39:29 ******/
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

INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (6, N'azules', 2, N'eyes_blue.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (7, N'marrones', 2, N'eyes_brown.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (8, N'verdes', 2, N'eyes_green.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (9, N'3D', 3, N'glass_3d.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (10, N'modernos', 3, N'glass_modern.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (11, N'redondos', 3, N'glass_round.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (12, N'negro', 1, N'hair_black.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (13, N'rojo', 1, N'hair_red.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (14, N'rubio', 1, N'hair_yellow.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (15, N'andesita', 4, N'stone_andesite.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (17, N'marmol', 4, N'stone_marble.obj')
INSERT [dbo].[Characteristics] ([ID], [name], [type], [url]) VALUES (18, N'basalto', 4, N'stone_basalt.obj')
SET IDENTITY_INSERT [dbo].[Characteristics] OFF
SET IDENTITY_INSERT [dbo].[CharacteristicTypes] ON 

INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (1, N'Pelo')
INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (2, N'Ojos')
INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (3, N'Anteojos')
INSERT [dbo].[CharacteristicTypes] ([id], [name]) VALUES (4, N'Piedra')
SET IDENTITY_INSERT [dbo].[CharacteristicTypes] OFF
SET IDENTITY_INSERT [dbo].[Characters] ON 

INSERT [dbo].[Characters] ([ID], [name]) VALUES (1, N'Juanma')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (2, N'Pedrop')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (3, N'Bizarro Albazo')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (4, N'Recalcitrante Abulia')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (5, N'Primoroso Mansedumbre')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (7, N'Primoroso Hegemon')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (8, N'Abstruso Abulia')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (9, N'Deso Probidad')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (10, N'Mal Templanza')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (11, N'Palmaria Templanza')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (12, N'sagaz Septenario')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (21, N'Indeleble Regocijo')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (26, N'Jovial Abulia')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (28, N'Impoluto Antropoide')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (30, N'Depravado Euforia')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (31, N'Ladino Chozno')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (32, N'Zozobra Afici')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (33, N'Flem Tegumento')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (35, N'Iluso Prodigiosidad')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (36, N'Flem Prurito')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (37, N'Abstruso Avisamiento')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (41, N'Bizarro Lacayo')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (43, N'Depravado Prodigalidad')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (44, N'Asim Hegemon')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (46, N'Asim Albazo')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (47, N'Palmaria Antropoide')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (51, N'Mal Afici')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (52, N'Sagas Lacayo')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (57, N'Zafio Nitidez')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (59, N'Locuaz Magnanimidad')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (60, N'Asim Mansedumbre')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (61, N'Ladino Euforia')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (64, N'Estridente Chozno')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (66, N'Ensortijado Sufragio')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (67, N'Locuaz Interregno')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (68, N'Bizarro Gula')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (69, N'Abnegado Cacofon')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (70, N'Jovial Ilaci')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (71, N'Pusil Abulia')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (72, N'Depravado Nitidez')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (73, N'Asim Afici')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (75, N'Bizarro Patetismo')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (77, N'Zozobra Abulafia')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (78, N'Impoluto Arte')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (79, N'Indubitable Prodigalidad')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (80, N'Impoluto Abulafia')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (81, N'Pusil Tegumento')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (82, N'Jovial Macram')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (83, N'Pusil Acongojo')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (84, N'Jovial Prurito')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (85, N'Primoroso Euforia')
INSERT [dbo].[Characters] ([ID], [name]) VALUES (86, N'Locuaz Templanza')
SET IDENTITY_INSERT [dbo].[Characters] OFF
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (-1, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (-1, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (-1, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (-1, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (1, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (1, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (1, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (1, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (2, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (2, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (2, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (2, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (3, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (3, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (3, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (3, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (4, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (4, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (4, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (4, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (5, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (5, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (5, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (5, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (7, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (7, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (7, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (7, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (8, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (8, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (8, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (8, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (9, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (9, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (9, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (9, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (10, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (10, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (10, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (10, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (11, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (11, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (11, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (11, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (12, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (12, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (12, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (12, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (21, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (21, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (21, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (21, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (26, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (26, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (26, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (26, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (28, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (28, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (28, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (28, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (30, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (30, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (30, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (30, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (31, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (31, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (31, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (31, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (32, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (32, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (32, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (32, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (33, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (33, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (33, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (33, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (35, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (35, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (35, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (35, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (36, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (36, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (36, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (36, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (37, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (37, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (37, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (37, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (41, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (41, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (41, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (41, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (43, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (43, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (43, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (43, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (44, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (44, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (44, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (44, 15)
GO
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (46, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (46, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (46, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (46, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (47, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (47, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (47, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (47, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (51, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (51, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (51, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (51, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (52, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (52, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (52, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (52, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (57, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (57, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (57, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (57, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (59, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (59, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (59, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (59, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (60, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (60, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (60, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (60, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (61, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (61, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (61, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (61, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (64, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (64, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (64, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (64, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (66, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (66, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (66, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (66, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (67, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (67, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (67, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (67, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (68, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (68, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (68, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (68, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (69, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (69, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (69, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (69, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (70, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (70, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (70, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (70, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (71, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (71, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (71, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (71, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (72, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (72, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (72, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (72, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (73, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (73, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (73, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (73, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (75, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (75, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (75, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (75, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (77, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (77, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (77, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (77, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (78, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (78, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (78, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (78, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (79, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (79, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (79, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (79, 15)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (80, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (80, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (80, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (80, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (81, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (81, 9)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (81, 12)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (81, 18)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (82, 6)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (82, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (82, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (82, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (83, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (83, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (83, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (83, 18)
GO
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (84, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (84, 11)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (84, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (84, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (85, 8)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (85, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (85, 14)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (85, 17)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (86, 7)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (86, 10)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (86, 13)
INSERT [dbo].[CharactersCharacteristics] ([characterID], [characteristicID]) VALUES (86, 17)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [bestscore], [bitcoins], [admin]) VALUES (1, N'test', 0x098F6BCD4621D373CADE4E832627B4F6, 19999, 1000000, 0)
INSERT [dbo].[Users] ([id], [username], [password], [bestscore], [bitcoins], [admin]) VALUES (2, N'adm', 0xB09C600FDDC573F117449B3723F23D64, 0, 1000000, 1)
INSERT [dbo].[Users] ([id], [username], [password], [bestscore], [bitcoins], [admin]) VALUES (3, N'leo', 0x0F759DD1EA6C4C76CEDC299039CA4F23, 0, 1000000, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Words] ON 

INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (1, N'Resoluto', N'adj')
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
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (31, N'Indubitable', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (32, N'Deso', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (34, N'Ladino', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (35, N'sagaz', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (36, N'Indeleble', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (37, N'Palmaria', N'adj')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (39, N'Fleco', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (40, N'Abulia', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (41, N'Magnanimidad', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (42, N'Escepticismo', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (43, N'Mansedumbre', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (45, N'Acongojo', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (46, N'Ostentaci', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (47, N'Euforia', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (48, N'Tribulaci', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (49, N'Templanza', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (50, N'Prurito', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (51, N'Nitidez', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (53, N'Ramalazo', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (54, N'Afici', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (55, N'Probidad', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (56, N'Gula', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (57, N'Abyecci', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (59, N'Avidez', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (60, N'Abarrajar', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (61, N'Sufragio', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (62, N'Chozno', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (63, N'Vestigio', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (64, N'Macram', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (65, N'Arte', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (66, N'Prodigalidad', N'sus')
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
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (84, N'Abulafia', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (85, N'Brewda', N'sus')
INSERT [dbo].[Words] ([ID], [word], [type]) VALUES (86, N'Hermozo', N'adj')
SET IDENTITY_INSERT [dbo].[Words] OFF
/****** Object:  StoredProcedure [dbo].[sp_AddCharacterCharacteristic]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ClearCharacteristics]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateCategory]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateCharacter]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateCharacteristic]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteCharacter]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteCharacteristic]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EditCharacter]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EditCharacteristic]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_EditUser]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GenerateRandomCharacter]    Script Date: 04/12/2018 21:39:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GenerateRandomCharacter]
	@id INT OUT
AS
BEGIN
	DECLARE @name VARCHAR(100)
	EXEC sp_GenerateRandomName @name OUTPUT
	EXEC sp_CreateCharacter @name
	DECLARE @characterid INT
	SELECT @characterid = ID FROM Characters WHERE Characters.name=@name
	DECLARE @type INT = 1;
	DECLARE @limit INT = (SELECT COUNT(*) FROM CharacteristicTypes);
	WHILE @type <= @limit
	BEGIN
		DECLARE @characteristicid INT;
		SELECT TOP 1 @characteristicid=C.ID FROM CharacteristicTypes AS CT FULL JOIN Characteristics AS C ON CT.id=C.type WHERE @type = CT.id ORDER BY NEWID()
		PRINT CONCAT(@characterid,':',@characteristicid)
		EXEC sp_AddCharacterCharacteristic @characterid,@characteristicid
		SET @type = @type + 1
	END
	SET @id = @characterid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerateRandomName]    Script Date: 04/12/2018 21:39:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GenerateRandomName]
	@name VARCHAR(100) OUT
AS
BEGIN
	--SET NOCOUNT ON;

	DECLARE @A VARCHAR(50);
	SET @A = (SELECT TOP 1 word FROM Words WHERE type='adj' ORDER BY NEWID())
	DECLARE @S VARCHAR(50);
	SET @S = (SELECT TOP 1 word FROM Words WHERE type='sus' ORDER BY NEWID())
	
	SET @name = CONCAT(@A,' ',@S)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCharacter]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCharacterCharacteristics]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristic]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristicByType]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristics]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetCharacteristicTypes]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetLeaderboard]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUser]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUsers]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ListCharacters]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Register]    Script Date: 04/12/2018 21:39:29 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateBitcoins]    Script Date: 04/12/2018 21:39:29 ******/
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
