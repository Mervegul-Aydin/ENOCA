USE [master]
GO
/****** Object:  Database [EnocaDB]    Script Date: 10.03.2023 21:43:15 ******/
CREATE DATABASE [EnocaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnocaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EnocaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EnocaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EnocaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EnocaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnocaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnocaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnocaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnocaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnocaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnocaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnocaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EnocaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnocaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnocaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnocaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnocaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnocaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnocaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnocaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnocaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EnocaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnocaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnocaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnocaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnocaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnocaDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EnocaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnocaDB] SET RECOVERY FULL 
GO
ALTER DATABASE [EnocaDB] SET  MULTI_USER 
GO
ALTER DATABASE [EnocaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnocaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnocaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnocaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EnocaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EnocaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EnocaDB', N'ON'
GO
ALTER DATABASE [EnocaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [EnocaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EnocaDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10.03.2023 21:43:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 10.03.2023 21:43:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[OrderStartTime] [nvarchar](max) NOT NULL,
	[OrderFinishTime] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10.03.2023 21:43:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[ProductId] [int] NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10.03.2023 21:43:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[Stock] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230310142908_AddedMig', N'6.0.5')
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [IsActive], [OrderStartTime], [OrderFinishTime], [Name]) VALUES (1, 1, N'20:00', N'23:00', N'Adidas')
INSERT [dbo].[Companies] ([Id], [IsActive], [OrderStartTime], [OrderFinishTime], [Name]) VALUES (2, 0, N'12:00', N'17:00', N'Gucci')
INSERT [dbo].[Companies] ([Id], [IsActive], [OrderStartTime], [OrderFinishTime], [Name]) VALUES (3, 1, N'19:00', N'22:15', N'Polo')
INSERT [dbo].[Companies] ([Id], [IsActive], [OrderStartTime], [OrderFinishTime], [Name]) VALUES (5, 0, N'13:00', N'21:45', N'Koç')
INSERT [dbo].[Companies] ([Id], [IsActive], [OrderStartTime], [OrderFinishTime], [Name]) VALUES (6, 1, N'09:00', N'22:00', N'Kalkedon')
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CompanyId], [ProductId], [OrderDate], [Name]) VALUES (1, 6, 1, CAST(N'2023-03-10T21:18:28.1304681' AS DateTime2), N'Erdal')
INSERT [dbo].[Orders] ([Id], [CompanyId], [ProductId], [OrderDate], [Name]) VALUES (2, 1, 2, CAST(N'2023-03-10T21:33:23.6839229' AS DateTime2), N'Elif')
INSERT [dbo].[Orders] ([Id], [CompanyId], [ProductId], [OrderDate], [Name]) VALUES (3, 3, 4, CAST(N'2023-03-10T21:35:18.4219458' AS DateTime2), N'Emine')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CompanyId], [Stock], [Price], [Name]) VALUES (1, 2, 5, 400, N'Sweat')
INSERT [dbo].[Products] ([Id], [CompanyId], [Stock], [Price], [Name]) VALUES (2, 5, 1, 1000000, N'Araba')
INSERT [dbo].[Products] ([Id], [CompanyId], [Stock], [Price], [Name]) VALUES (3, 3, 27, 38, N'Ayakkabı')
INSERT [dbo].[Products] ([Id], [CompanyId], [Stock], [Price], [Name]) VALUES (4, 1, 0, 0, N'Çanta')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_Orders_CompanyId]    Script Date: 10.03.2023 21:43:15 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CompanyId] ON [dbo].[Orders]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_ProductId]    Script Date: 10.03.2023 21:43:15 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_ProductId] ON [dbo].[Orders]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CompanyId]    Script Date: 10.03.2023 21:43:15 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Products_CompanyId] ON [dbo].[Products]
(
	[CompanyId] ASC
)
WHERE ([CompanyId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Companies_CompanyId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Companies_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Companies_CompanyId]
GO
USE [master]
GO
ALTER DATABASE [EnocaDB] SET  READ_WRITE 
GO
