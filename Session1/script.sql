USE [TestDbFinal]
GO
/****** Object:  Table [dbo].[Catalogs]    Script Date: 24.05.2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatalogName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Catalogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 24.05.2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
	[EmployeeRoleId] [int] NOT NULL,
	[EmployeeWorkingPlaceId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 24.05.2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[Article] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UnitType] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[MaxDiscountAmount] [int] NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
	[Supplier] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[CurrentDiscount] [int] NOT NULL,
	[AmountInStock] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Picture] [nvarchar](max) NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointsOfIssue]    Script Date: 24.05.2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointsOfIssue](
	[PointId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[WorkTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_PointsOfIssue] PRIMARY KEY CLUSTERED 
(
	[PointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 24.05.2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24.05.2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkersInfo]    Script Date: 24.05.2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkersInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatalogId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[WorkTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_WorkersInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'A436H7', N'Туалетная вода', N'шт.', 1000, 15, N'Dilis Parfum', N'Летуаль', N'Мужской парфюм', 4, 12, N'Туалетная вода Dilis Parfum Aqua Cool, 100 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'C323R4', N'Парфюмерная вода', N'шт.', 4100, 25, N'TRUSSARDI', N'Летуаль', N'Мужской парфюм', 4, 8, N'Парфюмерная вода TRUSSARDI Donna Trussardi (2011), 50 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'D344Y7', N'Парфюмерная вода', N'шт.', 223, 10, N'Today Parfum', N'Летуаль', N'Женский парфюм', 5, 16, N'Парфюмерная вода Today Parfum Prestige №6 Eclat, 17 мл', N'D344Y7.jpg')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'D378D3', N'Туалетная вода', N'шт.', 1500, 10, N'Dilis Parfum', N'Летуаль', N'Женский парфюм', 3, 16, N'Духи Dilis Parfum Classic Collection №18, 30 мл', N'D378D3.jpg')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'D526R4', N'Парфюмерная вода', N'шт.', 3600, 10, N'DOLCE & GABBANA', N'Летуаль', N'Женский парфюм', 3, 6, N'Парфюмерная вода DOLCE & GABBANA Dolce&Gabbana pour', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'D634D4', N'Туалетная вода', N'шт.', 367, 15, N'Paris Line', N'Рив Гош', N'Мужской парфюм', 2, 14, N'Туалетная вода Paris Line Parfums Dollar Diamond, 100 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'E245R5', N'Туалетная вода', N'шт.', 1000, 15, N'Dilis Parfum', N'Рив Гош', N'Женский парфюм', 5, 2, N'Туалетная вода Dilis Parfum Mila, 100 мл', N'E245R5.jpg')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'E479G6', N'Туалетная вода', N'шт.', 6100, 25, N'HUGO BOSS', N'Рив Гош', N'Мужской парфюм', 5, 3, N'Туалетная вода HUGO BOSS Boss Bottled, 100 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'E530Y6', N'Парфюмерная вода', N'шт.', 519, 15, N'Parfums Constantine', N'Летуаль', N'Женский парфюм', 3, 9, N'Парфюмерная вода Parfums Constantine Mademoiselle 5, 50 мл', N'E530Y6.jpg')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'E573G6', N'Духи', N'шт.', 1087, 15, N'Dilis Parfum', N'Рив Гош', N'Женский парфюм', 5, 13, N'Духи Dilis Parfum Classic Collection №34, 30 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'F344S4', N'Туалетная вода', N'шт.', 546, 5, N'Today Parfum', N'Рив Гош', N'Женский парфюм', 2, 9, N'Туалетная вода Today Parfum Cola Cherry, 50 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'F346G5', N'Туалетная вода', N'шт.', 450, 5, N'Today Parfum', N'Рив Гош', N'Женский парфюм', 3, 18, N'Туалетная вода Today Parfum G-Club Egoist, 100 мл', N'F346G5.jpg')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'F893T5', N'Туалетная вода', N'шт.', 327, 15, N'Paris Line', N'Рив Гош', N'Женский парфюм', 2, 14, N'Туалетная вода Paris Line Parfums Cosa Nostra Platinum, 100 мл', N'F893T5.jpg')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'G532R5', N'Парфюмерная вода', N'шт.', 640, 10, N'Parfums Constantine', N'Летуаль', N'Мужской парфюм', 3, 16, N'Парфюмерная вода Parfums Constantine New York Perfume Six, 50 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'G832G6', N'Туалетная вода', N'шт.', 368, 10, N'Paris Line', N'Рив Гош', N'Женский парфюм', 4, 7, N'Туалетная вода Paris Line Parfums Vodka Extreme, 100 мл', N'G832G6.jpg')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'H647R5', N'Туалетная вода', N'шт.', 555, 10, N'Parfums Constantine', N'Рив Гош', N'Женский парфюм', 4, 6, N'Туалетная вода Parfums Constantine Gentleman №3, 100 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'H732R5', N'Туалетная вода', N'шт.', 500, 15, N'Paris Line', N'Рив Гош', N'Женский парфюм', 5, 7, N'Туалетная вода Paris Line Parfums Cosa Nostra, 100 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'J432E4', N'Туалетная вода', N'шт.', 341, 5, N'Paris Line', N'Рив Гош', N'Женский парфюм', 2, 4, N'Туалетная вода Paris Line Parfums Dollar, 100 мл', N'J432E4.jpg')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'K535G6', N'Парфюмерная вода', N'шт.', 1200, 15, N'Yves de Sistelle', N'Рив Гош', N'Женский парфюм', 2, 5, N'Парфюмерная вода Yves de Sistelle Incidence pour Femme, 65 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'K742T5', N'Туалетная вода', N'шт.', 900, 15, N'Dilis Parfum', N'Летуаль', N'Мужской парфюм', 4, 6, N'Туалетная вода Dilis Parfum Cool&Grey, 100 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'L533E4', N'Туалетная вода', N'шт.', 3900, 15, N'HUGO BOSS', N'Рив Гош', N'Мужской парфюм', 4, 15, N'Туалетная вода HUGO BOSS Boss Bottled, 50 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'O875F6', N'Парфюмерная вода', N'шт.', 600, 10, N'Dilis Parfum', N'Рив Гош', N'Мужской парфюм', 2, 5, N'Dilis Parfum Мужской Walker Breeze', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'R464G6', N'Духи', N'шт.', 290, 5, N'Dilis Parfum', N'Летуаль', N'Женский парфюм', 2, 11, N'Духи Dilis Parfum Ночная Фиалка, 9.5 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'R563E3', N'Туалетная вода', N'шт.', 418, 5, N'Today Parfum', N'Летуаль', N'Мужской парфюм', 4, 9, N'Туалетная вода Today Parfum G-Club Millioner, 100 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'S346H6', N'Туалетная вода', N'шт.', 1000, 10, N'Dilis Parfum', N'Летуаль', N'Мужской парфюм', 4, 12, N'Туалетная вода Dilis Parfum Steelman Zone, 100 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'S753T5', N'Парфюмерная вода', N'шт.', 5200, 5, N'DOLCE & GABBANA', N'Летуаль', N'Женский парфюм', 4, 3, N'Парфюмерная вода DOLCE & GABBANA Dolce Shine, 75 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'V324R5', N'Парфюмерная вода', N'шт.', 519, 5, N'Parfums Constantine', N'Летуаль', N'Женский парфюм', 3, 5, N'Парфюмерная вода Parfums Constantine Mademoiselle 7, 50 мл', N'V324R5.jpg')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'V472S3', N'Парфюмерная вода', N'шт.', 2640, 30, N'LACOSTE', N'Рив Гош', N'Мужской парфюм', 4, 7, N'Парфюмерная вода LACOSTE Lacoste pour Femme, 30 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'V493E3', N'Туалетная вода', N'шт.', 3200, 10, N'DOLCE & GABBANA', N'Летуаль', N'Женский парфюм', 2, 8, N'Туалетная вода DOLCE & GABBANA 3 L''Imperatrice, 50 мл', N'')
INSERT [dbo].[Goods] ([Article], [Name], [UnitType], [Price], [MaxDiscountAmount], [Manufacturer], [Supplier], [Category], [CurrentDiscount], [AmountInStock], [Description], [Picture]) VALUES (N'А112Т4', N'Одеколон', N'шт.', 660, 30, N'Dragon', N'Летуаль', N'Мужской парфюм', 5, 6, N'Одеколон Dragon Parfums Dragon Noir, 100 мл', N'А112Т4.jpg')
GO
SET IDENTITY_INSERT [dbo].[PointsOfIssue] ON 

INSERT [dbo].[PointsOfIssue] ([PointId], [Address], [WorkTime]) VALUES (1, N'Bolshaya Krasnaya 55', N'12/12')
SET IDENTITY_INSERT [dbo].[PointsOfIssue] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [Role]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [Role]) VALUES (2, N'Client')
INSERT [dbo].[Roles] ([RoleId], [Role]) VALUES (3, N'Manager')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Login], [Password], [RoleId]) VALUES (1, N'user1', N'1', 1)
INSERT [dbo].[Users] ([UserId], [Login], [Password], [RoleId]) VALUES (2, N'user2', N'2', 2)
INSERT [dbo].[Users] ([UserId], [Login], [Password], [RoleId]) VALUES (4, N'user3', N'3', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Catalogs] FOREIGN KEY([EmployeeWorkingPlaceId])
REFERENCES [dbo].[Catalogs] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Catalogs]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Roles] FOREIGN KEY([EmployeeRoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_RoleId]
GO
