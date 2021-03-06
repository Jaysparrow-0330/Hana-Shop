USE [master]
GO
/****** Object:  Database [Assignment1_NguyenPhamHoangAn]    Script Date: 3/16/2021 10:07:00 AM ******/
CREATE DATABASE [Assignment1_NguyenPhamHoangAn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment1_NguyenPhamHoangAn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment1_NguyenPhamHoangAn.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment1_NguyenPhamHoangAn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Assignment1_NguyenPhamHoangAn_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment1_NguyenPhamHoangAn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment1_NguyenPhamHoangAn', N'ON'
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET QUERY_STORE = OFF
GO
USE [Assignment1_NguyenPhamHoangAn]
GO
/****** Object:  User [jays]    Script Date: 3/16/2021 10:07:00 AM ******/
CREATE USER [jays] FOR LOGIN [jays] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [jays]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/16/2021 10:07:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](20) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHistory]    Script Date: 3/16/2021 10:07:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistory](
	[historyID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[itemID] [nvarchar](50) NOT NULL,
	[updateDate] [date] NULL,
	[updateContent] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblItem]    Script Date: 3/16/2021 10:07:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblItem](
	[itemID] [nvarchar](50) NOT NULL,
	[itemName] [varchar](50) NULL,
	[quantity] [int] NULL,
	[categoryID] [varchar](20) NOT NULL,
	[imageLink] [varchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[price] [float] NULL,
	[status] [bit] NOT NULL,
	[createDate] [date] NOT NULL,
 CONSTRAINT [PK_tblItem] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 3/16/2021 10:07:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[totalPrice] [float] NULL,
	[orderDate] [date] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 3/16/2021 10:07:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [nvarchar](20) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblsOrderDetail]    Script Date: 3/16/2021 10:07:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblsOrderDetail](
	[orderID] [int] NOT NULL,
	[itemID] [nvarchar](50) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 3/16/2021 10:07:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[userPassword] [nvarchar](50) NOT NULL,
	[roleID] [nvarchar](20) NOT NULL,
	[email] [nvarchar](50) NULL,
	[phone] [varchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'AP', N'Appetizer')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'DE', N'Dessert')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'DR', N'Other Drink')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'MC', N'Main Course')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'OP', N'Optional')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'WN', N'Wine')
GO
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'AP001', N'Creamy Oil', 150, N'AP', N'https://www.glutenfreepalate.com/wp-content/uploads/2016/10/Sausage-and-Bacon-Appetizers-7.2-720x720.jpg', N'Cream on top of hot Sausage and Bacon', 70, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'AP002', N'Spinach Dip', 120, N'AP', N'https://lilluna.com/wp-content/uploads/2017/12/spinach-dip-bites-resize-4.jpg', N'It is like the name ', 90, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'DE001', N'Golden Chocolate Castle', 320, N'DE', N'https://images.immediate.co.uk/production/volatile/sites/2/2017/12/xmas-Cover-17v5-54a9395.jpg?quality=90&resize=768%2C574', N'Muffin and hot chocolate with real Gold  ', 1180, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'DE002', N'Golden Ice Cream', 320, N'DE', N'https://i.pinimg.com/originals/77/56/58/775658211b94fea13aa3562005789308.jpg', N'Ice Cream with real gold, Really, you need Déciption for this', 2199, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'DR001', N'San Pellegrino', 200, N'DR', N'https://www.kroger.com/product/images/xlarge/front/0004150880012', N'Sparkling Mineral Water 1L', 12, 1, CAST(N'2021-01-18' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'DR002', N'San Benedetto', 199, N'DR', N'https://static1.squarespace.com/static/5a2c13c47131a5245e293b13/5e82413ef48a3438afc02628/5e853f48820e132472913f94/1600620846263/?format=1500w', N'Still Mineral Water 1L', 15, 1, CAST(N'2021-01-18' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'DR003', N'Roku Japanese Gin', 23, N'DR', N'https://products3.imgix.drizly.com/ci-roku-gin-62a97345325aded3.jpeg?auto=format%2Ccompress&fm=jpg&q=20', N'Roku Gin make by 6  herbs along 4 seasons', 60, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'DR004', N'Guinness Draught', 120, N'DR', N'https://products2.imgix.drizly.com/ci-guinness-draught-420c95ffc7f4bdc0.jpeg?auto=format%2Ccompress&fm=jpg&q=20', N'It is Beer', 12, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'DR005', N'New Belgium Voodoo Ranger Imperial IPA', 140, N'DR', N'https://products3.imgix.drizly.com/ci-new-belgium-rampant-imperial-ipa-383db71c272a18d0.png?auto=format%2Ccompress&fm=jpg&q=20', N'Beer ', 41, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'MC001', N'Original Beef Steak', 50, N'MC', N'https://img.hellofresh.com/f_auto,fl_lossy,q_auto,w_1200/hellofresh_s3/image/thyme-balsamic-beef-rump-c1ba3100.jpg', N'Extra beef cook in Original way', 120, 1, CAST(N'2021-01-18' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'MC002', N'House Special Extra Lopster Stier Fried', 40, N'MC', N'https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/lobsterthermidor_73972_16x9.jpg', N'Special Lopster Stier fried with high-class fire ', 340, 1, CAST(N'2021-01-18' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'MC003', N'Cheese Mountain Steak', 50, N'MC', N'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/11/19/1/WU0311H_rib-eye-steak-with-onion-blue-cheese-sauce-recipe_s4x3.jpg.rend.hgtvcom.826.620.suffix/1382542189320.jpeg', N'A Mountain Cheese add on top of juicy steak', 250, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'MC004', N'Gold Steak', 150, N'MC', N'https://i.pinimg.com/originals/fd/46/71/fd46710483dbaa77a5cbac76b9bac3a8.jpg', N'Steak with Special Sauce and Real Gold ', 13899, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'OP001', N'Pàté Pork', 500, N'OP', N'https://www.museumselection.co.uk/images/products/large/24806.jpg', N'Pate', 17, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'OP002', N'The Claxstone Smooth Blue', 500, N'OP', N'https://www.luxurytopics.com/image.php/luxury%20food%20drinks%20worlds%20best%20cheese%2099.jpg?width=600&image=http://www.luxurytopics.com/chest/gallery/worlds-best-cheese/luxury%20food%20drinks%20worlds%20best%20cheese%2099.jpg', N'Blue Cheese', 21, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'WN001', N'Bolla Chianti', 98, N'WN', N'https://products0.imgix.drizly.com/ci-bolla-chianti-f033a8be266c785c.jpeg?auto=format%2Ccompress&fm=jpg&q=20', N'RED Wine 1973 Extra flavor', 50, 1, CAST(N'2021-01-18' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'WN002', N'Chateau Ste. Michelle Dry Riesling', 100, N'WN', N'https://products3.imgix.drizly.com/ci-chateau-ste-michelle-dry-riesling-41e43855893ad7ab.png?auto=format%2Ccompress&fm=jpg&q=20', N'WHITE Wine 1989', 50, 1, CAST(N'2021-01-18' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'WN003', N'Chateau Ste. Michelle Columbia Valley Rosé', 12, N'WN', N'https://products0.imgix.drizly.com/ci-chateau-ste-michelle-columbia-valley-rose-7b8d2a147668ee41.jpeg?auto=format%2Ccompress&fm=jpg&q=20', N'A Pink Special Wine', 1120, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'WN004', N'19 Crimes Cali Red Snoop Dogg', 50, N'WN', N'https://products2.imgix.drizly.com/ci-19-crimes-cali-red-snoop-dogg-3626d13bef906933.png?auto=format%2Ccompress&fm=jpg&q=20', N'RED Wine Snoop Dog Wine on label', 25, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'WN005', N'Apothic Red', 50, N'WN', N'https://products3.imgix.drizly.com/ci-apothic-red-dbc426614a35d54e.jpeg?auto=format%2Ccompress&fm=jpg&q=20', N'RED Wine nice label', 25, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'WN006', N'Matua Marlborough Sauvignon Blanc', 25, N'WN', N'https://products0.imgix.drizly.com/ci-matua-sauvignon-blanc-8042761a1646208a.jpeg?auto=format%2Ccompress&fm=jpg&q=20', N'WHITE Wine like ocean in your meals', 1891, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'WN007', N'Meiomi Pinot Noir', 1, N'WN', N'https://products0.imgix.drizly.com/ci-meiomi-pinot-noir-5e9f6b426bbef182.jpeg?auto=format%2Ccompress&fm=jpg&q=20', N'RED Wine really really old time', 3899, 1, CAST(N'2021-01-19' AS Date))
INSERT [dbo].[tblItem] ([itemID], [itemName], [quantity], [categoryID], [imageLink], [description], [price], [status], [createDate]) VALUES (N'WN008', N'19 Crimes Cabernet Sauvignon', 15, N'WN', N'https://products3.imgix.drizly.com/ci-19-crimes-cabernet-sauvignon-e8810883bfcb6460.png?auto=format%2Ccompress&fm=jpg&q=20', N'RED  Wine - An expensive Wine', 1099, 1, CAST(N'2021-01-19' AS Date))
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([OrderID], [userID], [totalPrice], [orderDate], [status]) VALUES (1, N'MB001', 50, CAST(N'2021-01-19' AS Date), 1)
INSERT [dbo].[tblOrders] ([OrderID], [userID], [totalPrice], [orderDate], [status]) VALUES (2, N'MB001', 15, CAST(N'2021-01-19' AS Date), 1)
INSERT [dbo].[tblOrders] ([OrderID], [userID], [totalPrice], [orderDate], [status]) VALUES (3, N'MB001', 65, CAST(N'2021-01-19' AS Date), 1)
INSERT [dbo].[tblOrders] ([OrderID], [userID], [totalPrice], [orderDate], [status]) VALUES (4, N'MB001', 100, CAST(N'2021-01-21' AS Date), 1)
INSERT [dbo].[tblOrders] ([OrderID], [userID], [totalPrice], [orderDate], [status]) VALUES (5, N'test', 115, CAST(N'2021-03-16' AS Date), 1)
INSERT [dbo].[tblOrders] ([OrderID], [userID], [totalPrice], [orderDate], [status]) VALUES (6, N'test', 120, CAST(N'2021-03-16' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'MB', N'Member')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'MV', N'Vip Member')
GO
INSERT [dbo].[tblsOrderDetail] ([orderID], [itemID], [price], [quantity]) VALUES (4, N'WN001', 50, 2)
INSERT [dbo].[tblsOrderDetail] ([orderID], [itemID], [price], [quantity]) VALUES (5, N'DR002', 15, 1)
INSERT [dbo].[tblsOrderDetail] ([orderID], [itemID], [price], [quantity]) VALUES (5, N'WN001', 50, 1)
INSERT [dbo].[tblsOrderDetail] ([orderID], [itemID], [price], [quantity]) VALUES (5, N'WN002', 50, 1)
INSERT [dbo].[tblsOrderDetail] ([orderID], [itemID], [price], [quantity]) VALUES (6, N'DR003', 60, 2)
GO
INSERT [dbo].[tblUser] ([userID], [userName], [userPassword], [roleID], [email], [phone], [address], [status]) VALUES (N'AD001', N'Jay Sparrow', N'jack0330', N'AD', N'Jack3460@gmail.com', N'0938190114', N'somewhere i dont know', 1)
INSERT [dbo].[tblUser] ([userID], [userName], [userPassword], [roleID], [email], [phone], [address], [status]) VALUES (N'admin', N'Add MIN', N'123456', N'AD', N'MIN@gmail.com', N'012345678', N'still nothing information about that', 1)
INSERT [dbo].[tblUser] ([userID], [userName], [userPassword], [roleID], [email], [phone], [address], [status]) VALUES (N'MB001', N'To Hell', N'123456', N'MB', N'ToHell@Satan.lu.Hell', N'666666', N'Hell maybe, just maybe', 1)
INSERT [dbo].[tblUser] ([userID], [userName], [userPassword], [roleID], [email], [phone], [address], [status]) VALUES (N'test', N'testdy bear', N'123456', N'MB', N'tesst@gamil.com', N'123456789', N'i don''t know, maybe teacher know', 1)
GO
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblItem] FOREIGN KEY([itemID])
REFERENCES [dbo].[tblItem] ([itemID])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblItem]
GO
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblUser]
GO
ALTER TABLE [dbo].[tblItem]  WITH CHECK ADD  CONSTRAINT [FK_tblItem_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblItem] CHECK CONSTRAINT [FK_tblItem_tblCategory]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUser]
GO
ALTER TABLE [dbo].[tblsOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblsOrderDetail_tblItem] FOREIGN KEY([itemID])
REFERENCES [dbo].[tblItem] ([itemID])
GO
ALTER TABLE [dbo].[tblsOrderDetail] CHECK CONSTRAINT [FK_tblsOrderDetail_tblItem]
GO
ALTER TABLE [dbo].[tblsOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblsOrderDetail_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([OrderID])
GO
ALTER TABLE [dbo].[tblsOrderDetail] CHECK CONSTRAINT [FK_tblsOrderDetail_tblOrders]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
USE [master]
GO
ALTER DATABASE [Assignment1_NguyenPhamHoangAn] SET  READ_WRITE 
GO
