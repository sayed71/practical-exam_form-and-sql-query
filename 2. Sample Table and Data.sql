USE [TEST]
GO
/****** Object:  Table [test].[Order]    Script Date: 22/09/2019 6:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [test].[Order](
	[OrderNo] [varchar](50) NOT NULL,
	[Date] [datetime] NULL,
	[CustomerName] [nvarchar](150) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [test].[OrderItem]    Script Date: 22/09/2019 6:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [test].[OrderItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](50) NULL,
	[Item] [nvarchar](150) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [test].[Order] ([OrderNo], [Date], [CustomerName]) VALUES (N'001', CAST(N'2019-09-11T00:00:00.000' AS DateTime), N'Sayed')
INSERT [test].[Order] ([OrderNo], [Date], [CustomerName]) VALUES (N'454', CAST(N'2019-09-22T00:00:00.000' AS DateTime), N'ddddddd')
INSERT [test].[Order] ([OrderNo], [Date], [CustomerName]) VALUES (N'dd', CAST(N'2019-09-22T00:00:00.000' AS DateTime), N'ddddd')
SET IDENTITY_INSERT [test].[OrderItem] ON 

INSERT [test].[OrderItem] ([ID], [OrderNo], [Item], [Quantity]) VALUES (14, N'001', N'Monitor', 1)
INSERT [test].[OrderItem] ([ID], [OrderNo], [Item], [Quantity]) VALUES (15, N'001', N'Pendrive', 2)
INSERT [test].[OrderItem] ([ID], [OrderNo], [Item], [Quantity]) VALUES (16, N'001', N'Scaner', 5)
INSERT [test].[OrderItem] ([ID], [OrderNo], [Item], [Quantity]) VALUES (21, N'454', N'dddd', 444)
SET IDENTITY_INSERT [test].[OrderItem] OFF
