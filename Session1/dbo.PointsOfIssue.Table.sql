USE [TestDbFinal]
GO
/****** Object:  Table [dbo].[PointsOfIssue]    Script Date: 24.05.2023 18:26:05 ******/
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
SET IDENTITY_INSERT [dbo].[PointsOfIssue] ON 

INSERT [dbo].[PointsOfIssue] ([PointId], [Address], [WorkTime]) VALUES (1, N'Bolshaya Krasnaya 55', N'12/12')
SET IDENTITY_INSERT [dbo].[PointsOfIssue] OFF
GO
