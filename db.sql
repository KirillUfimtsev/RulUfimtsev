USE [master]
GO
/****** Object:  Database [CarService]    Script Date: 04.10.2023 22:05:22 ******/
CREATE DATABASE [CarService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CarService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CarService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CarService] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarService] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarService] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarService] SET  MULTI_USER 
GO
ALTER DATABASE [CarService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarService] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CarService] SET QUERY_STORE = ON
GO
ALTER DATABASE [CarService] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CarService]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 04.10.2023 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] NOT NULL,
	[NameCategory] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maker]    Script Date: 04.10.2023 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maker](
	[ID] [int] NOT NULL,
	[NameMaker] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Maker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 04.10.2023 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[CurrentFullName] [nvarchar](max) NULL,
	[ReceiptCode] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 04.10.2023 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[CountProduct] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 04.10.2023 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[ID] [int] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04.10.2023 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [int] NOT NULL,
	[ProductImage] [nvarchar](max) NULL,
	[ProductManufacturer] [int] NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NULL,
	[Unit] [nvarchar](50) NOT NULL,
	[MaxDiscountAmount] [tinyint] NOT NULL,
	[Supplier] [int] NOT NULL,
	[CountInPack] [int] NULL,
	[MinCount] [int] NULL,
 CONSTRAINT [PK__Product__2EA7DCD52B6CCF19] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 04.10.2023 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ID] [int] NOT NULL,
	[NameProvider] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04.10.2023 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 04.10.2023 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] NOT NULL,
	[StatusName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04.10.2023 22:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCAC7C97B4A8] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Category] ([ID], [NameCategory]) VALUES (1, N'Зарядные устройства')
INSERT [dbo].[Category] ([ID], [NameCategory]) VALUES (2, N'Съемники подшипников')
INSERT [dbo].[Category] ([ID], [NameCategory]) VALUES (3, N'Автозапчасти')
INSERT [dbo].[Category] ([ID], [NameCategory]) VALUES (4, N'Ручные инструменты')
INSERT [dbo].[Category] ([ID], [NameCategory]) VALUES (5, N'Аксессуары')
INSERT [dbo].[Category] ([ID], [NameCategory]) VALUES (6, N'Автосервис')
GO
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (1, N'KOLNER')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (2, N'AIRLINE')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (3, N'BIG FIGHTER')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (4, N'STV')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (5, N'JONNESWAY')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (6, N'BOSCH')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (7, N'TCL')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (8, N'JTC')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (9, N'GRASS')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (10, N'SMART')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (11, N'CHAMPION')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (12, N'ALCA')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (13, N'MOBIL')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (14, N'EXPERT')
INSERT [dbo].[Maker] ([ID], [NameMaker]) VALUES (15, N'HAMMER')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (1, 1, CAST(N'2022-05-09T00:00:00.000' AS DateTime), 1, CAST(N'2022-05-03T00:00:00.000' AS DateTime), N'', 211)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (2, 2, CAST(N'2022-05-10T00:00:00.000' AS DateTime), 3, CAST(N'2022-05-04T00:00:00.000' AS DateTime), N'Никитин Артур Алексеевич', 212)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (3, 1, CAST(N'2022-05-11T00:00:00.000' AS DateTime), 5, CAST(N'2022-05-05T00:00:00.000' AS DateTime), N'', 213)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (4, 1, CAST(N'2022-05-12T00:00:00.000' AS DateTime), 6, CAST(N'2022-05-06T00:00:00.000' AS DateTime), N'', 214)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (5, 2, CAST(N'2022-05-13T00:00:00.000' AS DateTime), 7, CAST(N'2022-05-07T00:00:00.000' AS DateTime), N'Киселев Максим Сергеевич', 215)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (6, 1, CAST(N'2022-05-14T00:00:00.000' AS DateTime), 10, CAST(N'2022-05-08T00:00:00.000' AS DateTime), N'Борисов Тимур Егорович', 216)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (7, 1, CAST(N'2022-05-15T00:00:00.000' AS DateTime), 11, CAST(N'2022-05-09T00:00:00.000' AS DateTime), N'Климов Арсений Тимурович', 217)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (8, 1, CAST(N'2022-05-16T00:00:00.000' AS DateTime), 20, CAST(N'2022-05-10T00:00:00.000' AS DateTime), N'', 218)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (9, 2, CAST(N'2022-05-17T00:00:00.000' AS DateTime), 30, CAST(N'2022-05-11T00:00:00.000' AS DateTime), N'', 219)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (10, 1, CAST(N'2022-05-18T00:00:00.000' AS DateTime), 33, CAST(N'2022-05-12T00:00:00.000' AS DateTime), N'', 220)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (11, 1, CAST(N'2023-04-16T14:28:53.277' AS DateTime), 1, CAST(N'2023-04-13T14:28:53.277' AS DateTime), N'Лихачёв  Онисим Гордеевич', 978)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (28, 1, CAST(N'2023-04-17T19:26:43.097' AS DateTime), 3, CAST(N'2023-04-14T19:26:43.100' AS DateTime), N'', 171)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (29, 1, CAST(N'2023-04-17T19:28:23.597' AS DateTime), 2, CAST(N'2023-04-14T19:28:23.600' AS DateTime), N'', 841)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (30, 1, CAST(N'2023-04-17T19:30:40.067' AS DateTime), 3, CAST(N'2023-04-14T19:30:40.070' AS DateTime), N'', 715)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (31, 1, CAST(N'2023-04-17T19:31:20.367' AS DateTime), 1, CAST(N'2023-04-14T19:31:20.367' AS DateTime), N'', 871)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (32, 1, CAST(N'2023-04-17T19:32:08.983' AS DateTime), 2, CAST(N'2023-04-14T19:32:08.983' AS DateTime), N'', 808)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (33, 1, CAST(N'2023-04-17T19:33:16.537' AS DateTime), 1, CAST(N'2023-04-14T19:33:16.537' AS DateTime), N'', 145)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (34, 1, CAST(N'2023-04-17T19:34:48.973' AS DateTime), 1, CAST(N'2023-04-14T19:34:48.973' AS DateTime), N'', 531)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (35, 1, CAST(N'2023-04-17T19:39:29.677' AS DateTime), 3, CAST(N'2023-04-14T19:39:29.677' AS DateTime), N'', 419)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (36, 1, CAST(N'2023-04-17T19:40:43.677' AS DateTime), 3, CAST(N'2023-04-14T19:40:43.677' AS DateTime), N'', 845)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (37, 1, CAST(N'2023-04-17T19:42:31.340' AS DateTime), 1, CAST(N'2023-04-14T19:42:31.340' AS DateTime), N'', 142)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (38, 1, CAST(N'2023-04-20T19:53:07.830' AS DateTime), 2, CAST(N'2023-04-14T19:53:07.830' AS DateTime), N'', 783)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (39, 1, CAST(N'2023-04-20T20:04:41.193' AS DateTime), 1, CAST(N'2023-04-14T20:04:41.197' AS DateTime), N'', 148)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (40, 1, CAST(N'2023-04-20T20:05:45.563' AS DateTime), 1, CAST(N'2023-04-14T20:05:45.567' AS DateTime), N'', 264)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (41, 1, CAST(N'2023-04-17T20:08:01.993' AS DateTime), 2, CAST(N'2023-04-14T20:08:01.993' AS DateTime), N'', 540)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (42, 1, CAST(N'2023-04-20T20:08:28.863' AS DateTime), 2, CAST(N'2023-04-14T20:08:28.863' AS DateTime), N'', 702)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (43, 1, CAST(N'2023-04-17T20:19:26.517' AS DateTime), 2, CAST(N'2023-04-14T20:19:26.517' AS DateTime), N'', 830)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (44, 1, CAST(N'2023-05-08T15:49:37.337' AS DateTime), 3, CAST(N'2023-05-05T15:49:37.337' AS DateTime), N'Рожков  Тихон Владиславович', 248)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (45, 1, CAST(N'2023-05-11T15:50:16.780' AS DateTime), 3, CAST(N'2023-05-05T15:50:16.780' AS DateTime), N'Рожков  Тихон Владиславович', 469)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (46, 1, CAST(N'2023-05-08T15:53:27.907' AS DateTime), 2, CAST(N'2023-05-05T15:53:27.907' AS DateTime), N'', 953)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (47, 1, CAST(N'2023-06-06T16:12:14.760' AS DateTime), 2, CAST(N'2023-06-03T16:12:14.763' AS DateTime), N'Лихачёв  Онисим Гордеевич', 914)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (48, 1, CAST(N'2023-06-06T16:12:19.207' AS DateTime), 2, CAST(N'2023-06-03T16:12:19.207' AS DateTime), N'Лихачёв  Онисим Гордеевич', 338)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (49, 1, CAST(N'2023-06-06T16:12:25.327' AS DateTime), 2, CAST(N'2023-06-03T16:12:25.327' AS DateTime), N'Лихачёв  Онисим Гордеевич', 208)
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderDate], [CurrentFullName], [ReceiptCode]) VALUES (50, 1, CAST(N'2023-06-22T02:12:02.577' AS DateTime), 2, CAST(N'2023-06-19T02:12:02.577' AS DateTime), N'Маслова  Мария Аристарховна', 348)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (1, N'D374E4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (1, N'Z472R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (2, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (2, N'K830R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (3, N'K849L6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (3, N'O393R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (4, N'S983R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (4, N'Z469T7', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (5, N'F938T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (5, N'S037R9', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (6, N'D799T6', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (6, N'E679R3', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (7, N'P023T2', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (7, N'V892T6', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (8, N'K702L6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (8, N'S625T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (9, N'L802Y5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (9, N'P307T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (10, N'B702T6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (10, N'M562Y7', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (11, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (28, N'A782R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (29, N'A782R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (30, N'A782R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (31, N'A782R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (32, N'A782R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (33, N'A782R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (34, N'A782R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (35, N'A782R4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (36, N'A782R4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (36, N'Z469T7', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (36, N'Z472R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (37, N'A782R4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (37, N'B702T6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (37, N'D799T6', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (37, N'Z472R4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (37, N'Z782T5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (38, N'A782R4', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (38, N'B702T6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (38, N'D374E4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (38, N'D799T6', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (38, N'Z472R4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (39, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (39, N'D374E4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (40, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (40, N'D374E4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (40, N'E679R3', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (41, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (42, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (42, N'D374E4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (42, N'E679R3', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (43, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (43, N'D799T6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (43, N'P023T2', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (44, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (45, N'A782R4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (45, N'B702T6', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (45, N'D374E4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (45, N'D799T6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (46, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (47, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (48, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (49, N'A782R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [CountProduct]) VALUES (50, N'F938T5', 1)
GO
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (1, N'344288, г. Вологда, ул. Чехова, 1')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (2, N'614164, г.Вологда,  ул. Степная, 30')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (3, N'394242, г. Вологда, ул. Коммунистическая, 43')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (4, N'660540, г. Вологда, ул. Солнечная, 25')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (5, N'125837, г. Вологда, ул. Шоссейная, 40')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (6, N'125703, г. Вологда, ул. Партизанская, 49')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (7, N'625283, г. Вологда, ул. Победы, 46')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (8, N'614611, г. Вологда, ул. Молодежная, 50')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (9, N'454311, г.Вологда, ул. Новая, 19')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (10, N'660007, г.Вологда, ул. Октябрьская, 19')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (11, N'603036, г. Вологда, ул. Садовая, 4')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (12, N'450983, г.Вологда, ул. Комсомольская, 26')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (13, N'394782, г. Вологда, ул. Чехова, 3')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (14, N'603002, г. Вологда, ул. Дзержинского, 28')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (15, N'450558, г. Вологда, ул. Набережная, 30')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (16, N'394060, г.Вологда, ул. Фрунзе, 43')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (17, N'410661, г. Вологда, ул. Школьная, 50')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (18, N'625590, г. Вологда, ул. Коммунистическая, 20')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (19, N'625683, г. Вологда, ул. 8 Марта')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (20, N'400562, г. Вологда, ул. Зеленая, 32')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (21, N'614510, г. Вологда, ул. Маяковского, 47')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (22, N'410542, г. Вологда, ул. Светлая, 46')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (23, N'620839, г. Вологда, ул. Цветочная, 8')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (24, N'443890, г. Вологда, ул. Коммунистическая, 1')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (25, N'603379, г. Вологда, ул. Спортивная, 46')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (26, N'603721, г. Вологда, ул. Гоголя, 41')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (27, N'410172, г. Вологда, ул. Северная, 13')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (28, N'420151, г. Вологда, ул. Вишневая, 32')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (29, N'125061, г. Вологда, ул. Подгорная, 8')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (30, N'630370, г. Вологда, ул. Шоссейная, 24')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (31, N'614753, г. Вологда, ул. Полевая, 35')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (32, N'426030, г. Вологда, ул. Маяковского, 44')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (33, N'450375, г. Вологда ул. Клубная, 44')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (34, N'625560, г. Вологда, ул. Некрасова, 12')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (35, N'630201, г. Вологда, ул. Комсомольская, 17')
INSERT [dbo].[PickupPoint] ([ID], [Address]) VALUES (36, N'190949, г. Вологда, ул. Мичурина, 26')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'A782R4', N'Аккумулятор', N'Аккумулятор автомобильный BIG FIGHTER 55р', 3, N'A782R4.jpg', 3, CAST(4500.0000 AS Decimal(19, 4)), 2, 24, N'', N'1', 30, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'B702T6', N'Домкрат', N'Домкрат ALCA 436000', 6, N'', 12, CAST(2700.0000 AS Decimal(19, 4)), 2, 3, N'', N'1', 10, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'D374E4', N'Съемник подшипников', N'Съемник AIRLINE AT-GP2-05', 2, N'D374E4.jpeg', 2, CAST(1400.0000 AS Decimal(19, 4)), 3, 2, N'', N'1', 20, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'D799T6', N'Съемник подшипников', N'Съемник для подшипников JTC 9000', 2, N'', 8, CAST(1800.0000 AS Decimal(19, 4)), 2, 6, N'', N'1', 25, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'E679R3', N'Автошампунь', N'Автошампунь 9 800026 Active Foam Truck', 6, N'', 9, CAST(4000.0000 AS Decimal(19, 4)), 4, 14, N'', N'1', 15, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'E932T8', N'Полироль', N'Полироль 9 125101 Black Brilliance', 6, N'', 9, CAST(2100.0000 AS Decimal(19, 4)), 3, 23, N'', N'1', 25, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'F938T5', N'Антифриз', N'Антифриз красный 7 LLC01212', 6, N'', 7, CAST(1200.0000 AS Decimal(19, 4)), 4, 34, N'', N'1', 15, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'H572T6', N'Парктроник', N'Парктроник AIRLINE APS-8L-02', 3, N'', 2, CAST(2900.0000 AS Decimal(19, 4)), 5, 12, N'', N'1', 15, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'K702L6', N'Ключ', N'Ключ JONNESWAY W233032 (30 / 32 мм)', 4, N'', 5, CAST(1600.0000 AS Decimal(19, 4)), 3, 9, N'', N'1', 15, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'K830R4', N'Колпак для колеса', N'Колпак для колеса AIRLINE Супер Астра R16 серебристый 2шт', 3, N'K830R4.jpg', 2, CAST(915.0000 AS Decimal(19, 4)), 3, 14, N'', N'2', 20, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'K849L6', N'Набор ключей', N'Набор ключей накидных STV 00-00010990 6шт.', 4, N'K849L6.jpeg', 4, CAST(780.0000 AS Decimal(19, 4)), 2, 23, N'', N'2', 15, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'L802Y5', N'Лопата', N'Лопата саперная AIRLINE AB-S-03', 5, N'', 2, CAST(870.0000 AS Decimal(19, 4)), 4, 23, N'', N'1', 5, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'M562Y7', N'Мультиметр', N'Мультиметр JTC 1227A автомобильный', 5, N'', 8, CAST(14200.0000 AS Decimal(19, 4)), 3, 12, N'', N'1', 5, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'O393R4', N'Отвертка', N'Отвертка JONNESWAY D04P2100', 4, N'O393R4.jpeg', 5, CAST(460.0000 AS Decimal(19, 4)), 3, 14, N'', N'1', 15, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'P023T2', N'Провода прикуривания', N'Провода прикуривания в сумке SMART CABLE 700 4,5м', 3, N'', 10, CAST(3400.0000 AS Decimal(19, 4)), 2, 6, N'', N'1', 20, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'P307T5', N'Провода прикуривания', N'Провода прикуривания в сумке EXPERT 400А 2,5м', 3, N'', 14, CAST(700.0000 AS Decimal(19, 4)), 4, 2, N'', N'1', 10, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'P439R4', N'Пассатижи', N'Пассатижи HAMMER Flex 601-050 160 мм (6 дюймов)', 5, N'', 15, CAST(310.0000 AS Decimal(19, 4)), 3, 34, N'', N'1', 5, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'S037R9', N'Щетка', N'Щётка AIRLINE AB-H-03', 5, N'S037R9.jpeg', 2, CAST(740.0000 AS Decimal(19, 4)), 2, 26, N'', N'1', 25, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'S625T5', N'Щетка', N'щетка стеклоочистителя ALCA Start 16"/40см каркасная', 3, N'', 12, CAST(249.0000 AS Decimal(19, 4)), 3, 12, N'', N'1', 20, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'S826R4', N'Щетка', N'Щетка стеклоочистителя ALCA Super flat 19"/48см бескаркасная', 3, N'', 12, CAST(530.0000 AS Decimal(19, 4)), 4, 28, N'', N'1', 2, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'S983R4', N'Щетка', N'Щетка с/о 6 ECO 65C 650мм каркасная', 3, N'S983R4.jpg', 6, CAST(500.0000 AS Decimal(19, 4)), 4, 8, N'', N'1', 15, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'V892T6', N'Свеча зажигания', N'Свеча зажигания CHAMPION IGP F7RTC', 3, N'', 11, CAST(130.0000 AS Decimal(19, 4)), 3, 21, N'', N'1', 5, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Z326T9', N'Зарядное устройство', N'Устройство зарядное EXPERT ЗУ-300 6/12В 3,8А', 1, N'', 14, CAST(2400.0000 AS Decimal(19, 4)), 3, 14, N'', N'1', 15, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Z374R3', N'Зарядное устройство', N'Зарядное устройство AIRLINE ACH-15A-08', 1, N'Z374R3.jpeg', 2, CAST(4600.0000 AS Decimal(19, 4)), 2, 14, N'', N'1', 25, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Z469T7', N'Устройство пуско-зарядное', N'Устройство пуско-зарядное AIRLINE 12В 8000мАч 350А', 1, N'Z469T7.jpg', 2, CAST(4000.0000 AS Decimal(19, 4)), 2, 4, N'', N'1', 25, 2, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Z472R4', N'Зарядное устройство', N'Зарядное устройство KOLNER KBCН 4', 1, N'Z472R4.jpeg', 1, CAST(1250.0000 AS Decimal(19, 4)), 4, 6, N'', N'1', 30, 1, NULL, NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductImage], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus], [Unit], [MaxDiscountAmount], [Supplier], [CountInPack], [MinCount]) VALUES (N'Z782T5', N'Зажим', N'Зажим AIRLINE SA-400-P', 1, N'', 2, CAST(290.0000 AS Decimal(19, 4)), 5, 6, N'', N'2', 25, 1, NULL, NULL)
GO
INSERT [dbo].[Provider] ([ID], [NameProvider]) VALUES (1, N'220-volt
')
INSERT [dbo].[Provider] ([ID], [NameProvider]) VALUES (2, N'Максидом
')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'Новый')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Завершен
')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Лихачёв ', N'Онисим', N'Гордеевич', N'loginDErfg2018', N'5ovb1N', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Рожков ', N'Тихон', N'Владиславович', N'loginDEymi2018', N'nR0+pI', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Павлов ', N'Максим', N'Фёдорович', N'loginDEnbi2018', N'Ed*JQP', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Шилов ', N'Матвей', N'Альбертович', N'loginDEhvg2018', N'SaHv6w', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Шаров ', N'Федосей', N'Юрьевич', N'loginDEmbg2018', N'Fou{d3', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Медведева ', N'Пелагея', N'Мартыновна', N'loginDEubq2018', N'{jzW2v', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Медведев ', N'Григорий', N'Агафонович', N'loginDEosl2018', N'O3O}we', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Соколова ', N'Марфа', N'Всеволодовна', N'loginDErog2018', N'&W4Wtq', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Петухова ', N'Василиса', N'Еремеевна', N'loginDEsku2018', N'fUldqr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Беспалова ', N'Галина', N'Дмитрьевна', N'loginDEatu2018', N'}nGbhZ', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Андреева ', N'Александра', N'Владиславовна', N'loginDEhks2018', N'XV|+W4', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Селезнёв ', N'Федот', N'Валентинович', N'loginDEzbl2018', N'ih4xKJ', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Вишняков ', N'Сергей', N'Иванович', N'loginDEoxa2018', N'mL+97r', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Зимин ', N'Василий', N'Русланович', N'loginDEssm2018', N'oBrTGr', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Фадеева ', N'Регина', N'Онисимовна', N'loginDEzxw2018', N'pX&AsH', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Артемьев ', N'Варлам', N'Альбертович', N'loginDEkzo2018', N'n3es*S', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Щербаков ', N'Лукий', N'Онисимович', N'loginDEdaq2018', N'dWsvBS', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Горбунов ', N'Матвей', N'Сергеевич', N'loginDEnjd2018', N'0&3HHn', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Зиновьева ', N'Варвара', N'Антоновна', N'loginDEluw2018', N'S3wj{I', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Фролов ', N'Юрий', N'Варламович', N'loginDEole2018', N'p+kvb6', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Ларионова ', N'Василиса', N'Владимировна', N'loginDEebl2018', N'#ИМЯ?', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Силин ', N'Вячеслав', N'Валерьевич', N'loginDEfug2018', N'z|6cXV', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Герасимова ', N'Феврония', N'Валерьяновна', N'loginDEgfx2018', N'GFSZAB', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Пономарёва ', N'Вера', N'Руслановна', N'loginDEtww2018', N'4icZTg', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Медведьев ', N'Руслан', N'Богданович', N'loginDElyc2018', N'#ИМЯ?', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Владимиров ', N'Геласий', N'Пантелеймонович', N'loginDEcbd2018', N'GwG*p6', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Корнилов ', N'Иван', N'Игоревич', N'loginDEcay2018', N'ehtG*H', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Иван ', N'Вячеславовна', N'', N'loginDEmel2018', N'8zmoSV', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Ермакова ', N'Зинаида', N'Данииловна', N'loginDEhqk2018', N'KBc4A+', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Пахомова ', N'Элеонора', N'Григорьевна', N'loginDEkny2018', N'v2+4Ro', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Гущина ', N'Вера', N'Ефимовна', N'loginDEmda2018', N'sG+NF0', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Полякова ', N'Антонина', N'Андреевна', N'loginDEhhf2018', N'd+GS5y', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Зуева ', N'Марина', N'Ильяовна', N'loginDEilc2018', N'eyRufZ', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Агафонов ', N'Агафон', N'Максимович', N'loginDEwfv2018', N'ZSUiGT', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Архипов ', N'Агафон', N'Игоревич', N'loginDEozn2018', N'nndP3Q', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Лапина ', N'Иванна', N'Аристарховна', N'loginDEbtr2018', N'FdZrI3', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Маслова ', N'Мария', N'Аристарховна', N'loginDEcuf2018', N'aOdzYf', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Русаков ', N'Василий', N'Куприянович', N'loginDEtye2018', N'MEJjQt', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Николаева ', N'Евдокия', N'Пётровна', N'loginDEncq2018', N'GgG3m0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Прохоров ', N'Олег', N'Брониславович', N'loginDEtmt2018', N'}FOh*}', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Зайцев ', N'Макар', N'Владленович', N'loginDEyqb2018', N'xLmuQq', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Жданов ', N'Сергей', N'Гордеевич', N'loginDExld2018', N'a8Vjkx', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Нестеров ', N'Авдей', N'Митрофанович', N'loginDEnig2018', N'Cm00D0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Григорьева ', N'Глафира', N'Антоновна', N'loginDEmly2018', N'IZJ7O|', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Зыков ', N'Геласий', N'Лаврентьевич', N'loginDElom2018', N'Yg}k84', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Александрова ', N'Марфа', N'Протасьевна', N'loginDEvoa2018', N'RdGikC', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Мухин ', N'Донат', N'Ростиславович', N'loginDEwmq2018', N'ds4KAb', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Костин ', N'Геласий', N'Германнович', N'loginDEdba2018', N'D7xF6u', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Лазарев ', N'Протасий', N'Игоревич', N'loginDEnsr2018', N'VZKTog', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Пестов ', N'Богдан', N'Германнович', N'loginDEqsc2018', N'UU|FkZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Maker] FOREIGN KEY([ProductManufacturer])
REFERENCES [dbo].[Maker] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Maker]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Provider] FOREIGN KEY([Supplier])
REFERENCES [dbo].[Provider] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Provider]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__398D8EEE] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__398D8EEE]
GO
USE [master]
GO
ALTER DATABASE [CarService] SET  READ_WRITE 
GO
