USE [master]
GO
/****** Object:  Database [PolyStoreDB]    Script Date: 6/12/2023 5:20:37 PM ******/
CREATE DATABASE [PolyStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PolyStoreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PolyStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PolyStoreDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PolyStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PolyStoreDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PolyStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PolyStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PolyStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PolyStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PolyStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PolyStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PolyStoreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PolyStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PolyStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PolyStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PolyStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PolyStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PolyStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PolyStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PolyStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PolyStoreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PolyStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PolyStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PolyStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PolyStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PolyStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PolyStoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PolyStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PolyStoreDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PolyStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [PolyStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PolyStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PolyStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PolyStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PolyStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PolyStoreDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PolyStoreDB', N'ON'
GO
ALTER DATABASE [PolyStoreDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [PolyStoreDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PolyStoreDB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 6/12/2023 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[photo] [varchar](50) NULL,
	[activated] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 6/12/2023 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/12/2023 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [char](4) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/12/2023 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[orderId] [int] NULL,
	[productId] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/12/2023 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[username] [varchar](50) NULL,
	[createDate] [date] NULL,
	[address] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 6/12/2023 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[productId] [int] NULL,
	[categoryId] [char](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/12/2023 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[price] [float] NULL,
	[createDate] [date] NULL,
	[available] [bit] NULL,
	[brandId] [varchar](10) NULL,
	[images] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleDetails]    Script Date: 6/12/2023 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleDetails](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[accountId] [varchar](50) NULL,
	[roleId] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/12/2023 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role] [varchar](10) NOT NULL,
	[description] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'admin', N'123', N'Admin', N'admin@gmail.com', N'admin.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'giang123', N'617073', N'giang lu', N'giangdaubu23@gmail.com', N'logo.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'giang456', N'855505', N'lalalalala', N'giangdaubu23@gmail.com', N'logo.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'giangdaubu', N'123', N'giang dau bu', N'giangdaubu@gmail.com', N'giang.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'legiang', N'123', N'Lê Trung Hiếu', N'hieult@gmail.com', N'hieu.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'minhhieu', N'123', N'Dương Minh Hiếu', N'hieudm@gmail.com', N'dog.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'minhnhat', N'123', N'Minh Nhật', N'minhnhat@fpt.edu.vn', N'cat2.jpg', 1)
INSERT [dbo].[Accounts] ([username], [password], [fullname], [email], [photo], [activated]) VALUES (N'thanhtung', N'123', N'Trần Lê Thanh Tùng', N'thanhtung@gmail.com', N'cat.jpg', 1)
GO
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'BA', N'Nước cam', N'nuoccam.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'BM', N'Bánh Mì', N'banhmi.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'BTC', N'Bánh Mì', N'banhmi.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'ETH', N'Nước chanh', N'nuocchanh.png')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'KE', N'Nước dứa', N'nuocdua.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'SB  ', N'Xà Bông', N'xabong.jpg')
INSERT [dbo].[Brands] ([id], [name], [image]) VALUES (N'TH', N'Thịt Heo', N'thitheo.jpg')
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'BM  ', N'Bánh Mì')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM01', N'Bánh dứa')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM02', N'Bánh Mì')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'DM03', N'Nước Chanh')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'NC  ', N'Nước Cam')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'SB  ', N'Xà Bông')
INSERT [dbo].[Categories] ([id], [name]) VALUES (N'TH  ', N'Thịt Heo')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (0, 8, 2, 190000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (1, 9, 1, 350000, 1)
INSERT [dbo].[OrderDetails] ([id], [orderId], [productId], [price], [quantity]) VALUES (6, 10, 13, 318000, 14)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [username], [createDate], [address]) VALUES (8, N'admin', CAST(N'2022-06-08' AS Date), N'169 Đinh Bộ Lĩnh')
INSERT [dbo].[Orders] ([id], [username], [createDate], [address]) VALUES (9, N'giangdaubu', CAST(N'2022-06-09' AS Date), N'Ninh Kiều Cần Thơ')
INSERT [dbo].[Orders] ([id], [username], [createDate], [address]) VALUES (10, N'admin', CAST(N'2023-06-11' AS Date), N'càn thơ')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (6, 3, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (7, 4, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (10, 6, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (40, 1, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (41, 5, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (50, 8, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (52, 7, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (57, 0, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (58, 0, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (59, 1, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (60, 1, N'DM01')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (61, 6, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (62, 9, N'DM03')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (63, 10, N'DM02')
INSERT [dbo].[ProductCategory] ([id], [productId], [categoryId]) VALUES (64, 10, N'DM02')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (0, N'Bánh chuối', 210000, CAST(N'2021-04-15' AS Date), 1, N'BA', N'["banhchuoi.jpg","banhchuoi.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (1, N'Sữa tươi Vinamilk', 350000, CAST(N'2021-04-15' AS Date), 1, N'BA', N'["suatuoi.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (2, N'Bột giặt Omo', 190000, CAST(N'2021-03-20' AS Date), 1, N'BA', N'["banhdauphung.jpg","banhdauphung.jpg","banhdauphung.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (3, N'Áo thun Uniqlo', 350000, CAST(N'2021-03-20' AS Date), 1, N'BA', N'["banhdauxanh.jpg","banhdauxanh.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (4, N'Mì gói Hao Hao', 850000, CAST(N'2021-03-20' AS Date), 1, N'BA', N'["banhdua.jpg","banhdua.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (5, N'Đèn bàn LED', 37000, CAST(N'2021-03-22' AS Date), 1, N'BA', N'["banhduanuong.jpg","banhduanuong.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (6, N'Quần jeans Levi', 322000, CAST(N'2022-04-10' AS Date), 1, N'BA', N'["banhnodeo.jpg","banhnodeo.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (7, N'Bánh rế', 218000, CAST(N'2021-04-15' AS Date), 1, N'BA', N'["banhre.jpg","banhre.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (8, N'Cốm dừa', 650000, CAST(N'2021-04-15' AS Date), 1, N'BTC', N'["comdua.jpg","comdua.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (9, N'Kẹo dâu dẻo', 1458000, CAST(N'2022-04-12' AS Date), 1, N'KE', N'["keodaudeo.jpg","keodaudeo.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (10, N'Kẹo đậu phộng', 189000, CAST(N'2022-04-12' AS Date), 1, N'KE', N'["keodongphung.jpg","keodongphung.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (11, N'Kẹo dâu tằm', 350000, CAST(N'2022-04-13' AS Date), 1, N'KE', N'["keodautam.jpg","keodautam.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (12, N'Kẹo dừa', 370000, CAST(N'2022-04-13' AS Date), 1, N'KE', N'["keodua.jpg","keodua.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (13, N'Mạch nha', 318000, CAST(N'2022-04-14' AS Date), 1, N'ETH', N'["machnha.jpg","machnha.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (14, N'Mè xửng', 445000, CAST(N'2022-03-15' AS Date), 1, N'ETH', N'["mexung.jpg","mexung.jpg"]')
INSERT [dbo].[Products] ([id], [name], [price], [createDate], [available], [brandId], [images]) VALUES (15, N'Thịt Heo', 10000000, CAST(N'2023-06-12' AS Date), 1, N'TH', N'["6b1b7def.jpg"]')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleDetails] ON 

INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (0, N'admin', N'director')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (4, N'thanhtung', N'staff')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (6, N'minhnhat', N'user')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (7, N'minhhieu', N'user')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (8, N'giang123', N'user')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (9, N'giangdaubu', N'director')
INSERT [dbo].[RoleDetails] ([id], [accountId], [roleId]) VALUES (11, N'giang456', N'user')
SET IDENTITY_INSERT [dbo].[RoleDetails] OFF
GO
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'director', N'director')
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'staff', N'staff')
INSERT [dbo].[Roles] ([role], [description]) VALUES (N'user', N'user')
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([id])
GO
ALTER TABLE [dbo].[RoleDetails]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[RoleDetails]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([role])
GO
/****** Object:  StoredProcedure [dbo].[sp_ReportCost]    Script Date: 6/12/2023 5:20:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ReportCost] (@month INT)
AS BEGIN
SELECT 
			convert(varchar(10), o.createDate, 103) AS NgayBan,		
			COUNT(DISTINCT o.id) AS TongHoaDon,
			SUM(od.quantity * od.price) AS DoanhThu
FROM Orders o, OrderDetails od  WHERE o.id = od.orderId AND MONTH(o.createDate) = @month
GROUP BY createDate
END
GO
USE [master]
GO
ALTER DATABASE [PolyStoreDB] SET  READ_WRITE 
GO
