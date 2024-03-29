USE [TestDbFinal]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 24.05.2023 18:26:05 ******/
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
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleId], [Role]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [Role]) VALUES (2, N'Client')
INSERT [dbo].[Roles] ([RoleId], [Role]) VALUES (3, N'Manager')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
