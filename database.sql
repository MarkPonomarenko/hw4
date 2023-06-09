USE [master]
GO
/****** Object:  Database [chi_hw3]    Script Date: 07.05.2023 17:04:46 ******/
CREATE DATABASE [chi_hw3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'chi_hw3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\chi_hw3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'chi_hw3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\chi_hw3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [chi_hw3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [chi_hw3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [chi_hw3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [chi_hw3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [chi_hw3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [chi_hw3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [chi_hw3] SET ARITHABORT OFF 
GO
ALTER DATABASE [chi_hw3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [chi_hw3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [chi_hw3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [chi_hw3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [chi_hw3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [chi_hw3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [chi_hw3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [chi_hw3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [chi_hw3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [chi_hw3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [chi_hw3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [chi_hw3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [chi_hw3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [chi_hw3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [chi_hw3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [chi_hw3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [chi_hw3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [chi_hw3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [chi_hw3] SET  MULTI_USER 
GO
ALTER DATABASE [chi_hw3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [chi_hw3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [chi_hw3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [chi_hw3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [chi_hw3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [chi_hw3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [chi_hw3] SET QUERY_STORE = ON
GO
ALTER DATABASE [chi_hw3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [chi_hw3]
GO
/****** Object:  Table [dbo].[Analysis]    Script Date: 07.05.2023 17:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analysis](
	[an_id] [int] IDENTITY(0,1) NOT NULL,
	[an_name] [nchar](20) NULL,
	[an_cost] [money] NULL,
	[an_price] [money] NULL,
	[an_group] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[an_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 07.05.2023 17:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[gr_id] [int] IDENTITY(0,1) NOT NULL,
	[gr_name] [nchar](20) NOT NULL,
	[gr_tenp] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[gr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07.05.2023 17:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ord_id] [int] IDENTITY(0,1) NOT NULL,
	[ord_datetime] [datetime] NULL,
	[ord_an] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ord_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Analysis] ON 

INSERT [dbo].[Analysis] ([an_id], [an_name], [an_cost], [an_price], [an_group]) VALUES (0, N'Cholesterol         ', 150.0500, 300.0000, 0)
INSERT [dbo].[Analysis] ([an_id], [an_name], [an_cost], [an_price], [an_group]) VALUES (1, N'Culture             ', 134.2900, 180.9900, 0)
INSERT [dbo].[Analysis] ([an_id], [an_name], [an_cost], [an_price], [an_group]) VALUES (2, N'Gases               ', 220.8000, 459.9900, 0)
INSERT [dbo].[Analysis] ([an_id], [an_name], [an_cost], [an_price], [an_group]) VALUES (3, N'Glucose             ', 126.7000, 200.9000, 0)
INSERT [dbo].[Analysis] ([an_id], [an_name], [an_cost], [an_price], [an_group]) VALUES (4, N'Cancer              ', 689.3600, 1399.9900, 0)
INSERT [dbo].[Analysis] ([an_id], [an_name], [an_cost], [an_price], [an_group]) VALUES (5, N'Chilled mirrors     ', 367.3900, 540.0000, 1)
INSERT [dbo].[Analysis] ([an_id], [an_name], [an_cost], [an_price], [an_group]) VALUES (6, N'Electrolytic        ', 781.5500, 1299.9900, 1)
SET IDENTITY_INSERT [dbo].[Analysis] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([gr_id], [gr_name], [gr_tenp]) VALUES (0, N'Blood               ', CAST(50.50 AS Decimal(5, 2)))
INSERT [dbo].[Groups] ([gr_id], [gr_name], [gr_tenp]) VALUES (1, N'Moistures           ', CAST(-100.10 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (0, CAST(N'2023-02-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (1, CAST(N'2023-02-07T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (2, CAST(N'2023-02-09T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (3, CAST(N'2023-02-15T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (4, CAST(N'2023-02-12T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (5, CAST(N'2023-03-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (6, CAST(N'2023-03-08T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (7, CAST(N'2023-03-13T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (8, CAST(N'2023-03-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (9, CAST(N'2023-03-17T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (10, CAST(N'2023-03-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (11, CAST(N'2023-03-28T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (12, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (13, CAST(N'2022-02-13T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (14, CAST(N'2022-02-28T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (15, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (16, CAST(N'2022-02-28T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (17, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (18, CAST(N'2022-03-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (19, CAST(N'2022-03-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (20, CAST(N'2022-03-28T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (21, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Orders] ([ord_id], [ord_datetime], [ord_an]) VALUES (22, CAST(N'2022-03-11T00:00:00.000' AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
ALTER TABLE [dbo].[Analysis]  WITH CHECK ADD  CONSTRAINT [FK_Analysis_Groups] FOREIGN KEY([an_group])
REFERENCES [dbo].[Groups] ([gr_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Analysis] CHECK CONSTRAINT [FK_Analysis_Groups]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Analysis] FOREIGN KEY([ord_an])
REFERENCES [dbo].[Analysis] ([an_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Analysis]
GO
USE [master]
GO
ALTER DATABASE [chi_hw3] SET  READ_WRITE 
GO
