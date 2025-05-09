USE [ASM]
GO
/****** Object:  Table [dbo].[Carts_Detail]    Script Date: 18/11/2024 6:33:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts_Detail](
	[username] [varchar](255) NOT NULL,
	[product_id] [varchar](255) NOT NULL,
	[product_name] [nvarchar](255) NULL,
	[product_image] [varchar](255) NULL,
	[product_price] [float] NULL,
	[quantity] [int] NULL,
	[total_price] [float] NULL,
 CONSTRAINT [PK__Carts_De__B7ABE2ACD021941F] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 18/11/2024 6:33:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[id] [varchar](255) NOT NULL,
	[username] [varchar](255) NULL,
	[invoice_date] [varchar](255) NULL,
	[total_price] [float] NULL,
 CONSTRAINT [PK__Bills__3213E83F79B80D6F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice_Detail]    Script Date: 18/11/2024 6:33:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Detail](
	[bill_id] [varchar](255) NOT NULL,
	[product_id] [varchar](255) NOT NULL,
	[product_name] [nvarchar](255) NULL,
	[product_image] [varchar](255) NULL,
	[product_price] [float] NULL,
	[quantity] [int] NULL,
	[total_price] [float] NULL,
 CONSTRAINT [PK__Bills_De__9376FA6CB13C12F2] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18/11/2024 6:33:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [varchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[type] [nvarchar](255) NULL,
	[image] [varchar](255) NULL,
	[description] [nvarchar](255) NULL,
	[price] [float] NULL,
	[sale] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK__Products__3213E83F01346A55] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/11/2024 6:33:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[phone_number] [varchar](20) NULL,
	[role] [int] NULL,
	[email] [varchar](255) NULL,
	[address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 18/11/2024 6:33:14 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[username] [nvarchar](50) NOT NULL,
	[product_id] [nvarchar](50) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[product_image] [nvarchar](50) NULL,
	[product_price] [float] NULL,
 CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Carts_Detail] ([username], [product_id], [product_name], [product_image], [product_price], [quantity], [total_price]) VALUES (N'user1', N'product10', N'Modern soft chair', N'product-portrait-thumbnail-2.jpg', 120.25, 3, 360.75)
INSERT [dbo].[Carts_Detail] ([username], [product_id], [product_name], [product_image], [product_price], [quantity], [total_price]) VALUES (N'user1', N'product12', N'Comfort Recliner', N'product-portrait-thumbnail-4.jpg', 145.75, 1, 145.75)
INSERT [dbo].[Carts_Detail] ([username], [product_id], [product_name], [product_image], [product_price], [quantity], [total_price]) VALUES (N'user1', N'product7', N'Modern Plastic Chair', N'product-portrait-thumbnail-1.jpg', 195.65, 2, 391.3)
INSERT [dbo].[Carts_Detail] ([username], [product_id], [product_name], [product_image], [product_price], [quantity], [total_price]) VALUES (N'user2', N'product11', N'Vintage Leather Chair', N'product-portrait-thumbnail-3.jpg', 220.5, 2, 441)
INSERT [dbo].[Carts_Detail] ([username], [product_id], [product_name], [product_image], [product_price], [quantity], [total_price]) VALUES (N'user2', N'product3', N'European Style Chair', N'product-portrait-thumbnail-6.jpg', 80, 1, 80)
GO
INSERT [dbo].[Invoice] ([id], [username], [invoice_date], [total_price]) VALUES (N'bill1', N'user1', N'2024-03-19 19:30:45', 145.75)
INSERT [dbo].[Invoice] ([id], [username], [invoice_date], [total_price]) VALUES (N'bill2', N'user2', N'2024-04-20 13:30:15', 441)
INSERT [dbo].[Invoice] ([id], [username], [invoice_date], [total_price]) VALUES (N'bill3', N'user3', N'28-JUNE-2024', 145.75)
GO
INSERT [dbo].[Invoice_Detail] ([bill_id], [product_id], [product_name], [product_image], [product_price], [quantity], [total_price]) VALUES (N'bill1', N'product12', N'Comfort Recliner', N'product-portrait', 145.75, 1, 145.75)
INSERT [dbo].[Invoice_Detail] ([bill_id], [product_id], [product_name], [product_image], [product_price], [quantity], [total_price]) VALUES (N'bill2', N'product11', N'Vintage Leather Chair', N'product-portrait', 220.5, 2, 441)
INSERT [dbo].[Invoice_Detail] ([bill_id], [product_id], [product_name], [product_image], [product_price], [quantity], [total_price]) VALUES (N'bill3', N'product12', N'Comfort Recliner', N'product-portrait-thumbnail-4.jpg', 145.75, 1, 145.75)
GO
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product1', N'Modern Fabric Sofa', N'ModernChair', N'product-portrait-thumbnail-1.jpg', N'Ghe Sofa hien dai', 190, 1, 20)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product10', N'Modern soft chair', N'ModernChair', N'product-portrait-thumbnail-2.jpg', N'Bo ghe mem san', 120.25, 1, 7)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product11', N'Vintage Leather Chair', N'LuxuryChair', N'product-portrait-thumbnail-3.jpg', N'Ghe da co dien', 220.5, 0, 6)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product12', N'Comfort Recliner', N'ComfortableChair', N'product-portrait-thumbnail-4.jpg', N'Ghe nga thoai mai', 145.75, 0, 9)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product13', N'Swivel Office Chair', N'OfficeChair', N'product-portrait-thumbnail-5.jpg', N'Ghe van phong xoay', 85.3, 1, 20)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product14', N'Outdoor Patio Chair', N'ComfortableChair', N'product-portrait-thumbnail-6.jpg', N'Ghe ngoai troi', 75.45, 0, 30)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product15', N'Classic Rocking Chair', N'ComfortableChair', N'product-portrait-thumbnail-7.jpg', N'Ghe bap benh co dien', 95, 0, 12)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product16', N'Kids Study Chair', N'KidChair', N'product-portrait-thumbnail-8.jpg', N'Ghe hoc sinh', 50.95, 1, 25)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product17', N'Executive Office Chair', N'OfficeChair', N'product-portrait-thumbnail-9.jpg', N'Ghe van phong lanh dao', 250.15, 1, 10)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product18', N'Minimalist Dining Chair', N'ClassicChair', N'product-portrait-thumbnail-10.jpg', N'Ghe an toi toi gian', 40, 0, 14)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product19', N'Ergonomic Gaming Chair', N'GamingChair', N'product-portrait-thumbnail-11.jpg', N'Ghe choi game ergonomic', 200.39, 1, 9)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product2', N'Natural Wood Armchair', N'LuxuryChair', N'product-portrait-thumbnail-12.jpg', N'Ghe go tu nhien', 195.55, 0, 10)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product20', N'Bean Bag Chair', N'ClassicChair', N'product-portrait-thumbnail-13.jpg', N'Ghe tui hat xop', 60.7, 1, 20)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product3', N'European Style Chair', N'LuxuryChair', N'product-portrait-thumbnail-14.jpg', N'Ghe phong cach chau au', 80, 1, 5)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product4', N'Ergonomic Office Chair', N'OfficeChair', N'product-portrait-thumbnail-15.jpg', N'Ghe van phong ergonomic', 43.2, 0, 22)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product5', N'Relaxing Armchair', N'ClassicChair', N'product-portrait-thumbnail-16.jpg', N'Ghe banh thu gian', 150, 1, 12)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product6', N'Industrial Wooden Chair', N'ModernChair', N'product-portrait-thumbnail-17.jpg', N'Ghe go cong nghiep', 120.75, 0, 7)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product7', N'Modern Plastic Chair', N'ModernChair', N'product-portrait-thumbnail-18.jpg', N'Ghe nhua hien dai', 195.65, 0, 14)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product8', N'Elegant Plastic Chair', N'ModernChair', N'product-portrait-thumbnail-19.jpg', N'Ghe nhua sang trong', 82.9, 0, 10)
INSERT [dbo].[Products] ([id], [name], [type], [image], [description], [price], [sale], [quantity]) VALUES (N'product9', N'Modern orange sofa', N'ModernChair', N'product-portrait-thumbnail-20.jpg', N'Bo sofa sang trong', 869.99, 0, 10)
GO
INSERT [dbo].[Users] ([username], [password], [full_name], [phone_number], [role], [email], [address]) VALUES (N'admin', N'123', N'Lê Đào Tấn Thành', N'1023084123', 0, N'info@gmail.com', N'123 Ðu?ng ABC, Qu?n 1, TP.HCM')
INSERT [dbo].[Users] ([username], [password], [full_name], [phone_number], [role], [email], [address]) VALUES (N'staff1', N'123', N'Lê Hoàng Phúc', N'5123512334', 1, N'staff1@gmail.com', N'456 Ðu?ng DEF, Qu?n 2, TP.HCM')
INSERT [dbo].[Users] ([username], [password], [full_name], [phone_number], [role], [email], [address]) VALUES (N'staff2', N'123', N'Trần Văn Thảo', N'3245142523', 1, N'staff2@gmail.com', N'789 Ðu?ng GHI, Qu?n 3, TP.HCM')
INSERT [dbo].[Users] ([username], [password], [full_name], [phone_number], [role], [email], [address]) VALUES (N'staff3', N'123', N'Nguyễn Minh Quân', N'4552341234', 1, N'staff3@gmail.com', N'101 Ðu?ng JKL, Qu?n 4, TP.HCM')
INSERT [dbo].[Users] ([username], [password], [full_name], [phone_number], [role], [email], [address]) VALUES (N'user1', N'123', N'Nguyễn Thị Ngọc Minh', N'332412334', 2, N'user1@gmail.com', N'202 Ðu?ng MNO, Qu?n 5, TP.HCM')
INSERT [dbo].[Users] ([username], [password], [full_name], [phone_number], [role], [email], [address]) VALUES (N'user2', N'123', N'Trần Hồng Nhi', N'3423412342', 2, N'user2@gmail.com', N'303 Ðu?ng PQR, Qu?n 6, TP.HCM')
INSERT [dbo].[Users] ([username], [password], [full_name], [phone_number], [role], [email], [address]) VALUES (N'user3', N'123', N'Lê Quang Hải', N'2213412342', 2, N'user3@gmail.com', N'404 Ðu?ng STU, Qu?n 7, TP.HCM')
INSERT [dbo].[Users] ([username], [password], [full_name], [phone_number], [role], [email], [address]) VALUES (N'user4', N'123', N'Trần Triệu Hoàng Anh', N'4245123452', 2, N'user4@gmail.com', N'505 Ðu?ng VWX, Qu?n 8, TP.HCM')
GO
INSERT [dbo].[WishList] ([username], [product_id], [product_name], [product_image], [product_price]) VALUES (N'user1', N'product1', N'Modern Fabric Sofa', N'875.jpg', 8698000335693)
INSERT [dbo].[WishList] ([username], [product_id], [product_name], [product_image], [product_price]) VALUES (N'user1', N'product2', N'Natural Wood Armchair', N'product-portrait', 195.55)
INSERT [dbo].[WishList] ([username], [product_id], [product_name], [product_image], [product_price]) VALUES (N'user1', N'product9', N'Modern orange sofa', N'product-portrait', 869.99)
INSERT [dbo].[WishList] ([username], [product_id], [product_name], [product_image], [product_price]) VALUES (N'user2', N'product3', N'European Style Chair', N'product-portrait', 80)
INSERT [dbo].[WishList] ([username], [product_id], [product_name], [product_image], [product_price]) VALUES (N'user2', N'product4', N'Ergonomic Office Chair', N'product-portrait', 43.2)
INSERT [dbo].[WishList] ([username], [product_id], [product_name], [product_image], [product_price]) VALUES (N'user3', N'product16', N'Kids Study Chair', N'product-portrait-thumbnail-8.jpg', 50.950000762939453)
INSERT [dbo].[WishList] ([username], [product_id], [product_name], [product_image], [product_price]) VALUES (N'user3', N'product17', N'Executive Office Chair', N'product-portrait-thumbnail-9.jpg', 250.14999389648438)
INSERT [dbo].[WishList] ([username], [product_id], [product_name], [product_image], [product_price]) VALUES (N'user4', N'product7', N'Modern Plastic Chair', N'product-portrait', 195.65)
INSERT [dbo].[WishList] ([username], [product_id], [product_name], [product_image], [product_price]) VALUES (N'user4', N'product8', N'Elegant Plastic Chair', N'product-portrait', 82.9)
GO
ALTER TABLE [dbo].[Carts_Detail]  WITH CHECK ADD  CONSTRAINT [FK__Carts_Det__produ__3C69FB99] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Carts_Detail] CHECK CONSTRAINT [FK__Carts_Det__produ__3C69FB99]
GO
ALTER TABLE [dbo].[Carts_Detail]  WITH CHECK ADD  CONSTRAINT [FK__Carts_Det__usern__3B75D760] FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[Carts_Detail] CHECK CONSTRAINT [FK__Carts_Det__usern__3B75D760]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK__Bills__username__3F466844] FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK__Bills__username__3F466844]
GO
ALTER TABLE [dbo].[Invoice_Detail]  WITH CHECK ADD  CONSTRAINT [FK__Bills_Det__bill___4316F928] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Invoice] ([id])
GO
ALTER TABLE [dbo].[Invoice_Detail] CHECK CONSTRAINT [FK__Bills_Det__bill___4316F928]
GO
ALTER TABLE [dbo].[Invoice_Detail]  WITH CHECK ADD  CONSTRAINT [FK__Bills_Det__produ__440B1D61] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Invoice_Detail] CHECK CONSTRAINT [FK__Bills_Det__produ__440B1D61]
GO
