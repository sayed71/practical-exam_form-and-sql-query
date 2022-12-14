USE [TEST]
GO
/****** Object:  Table [dbo].[Upload]    Script Date: 22/09/2019 1:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Upload](
	[ID] [varchar](50) NOT NULL,
	[InstituteName] [nvarchar](50) NULL,
	[Subject] [nvarchar](50) NULL,
 CONSTRAINT [PK_Upload] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UploadDetails]    Script Date: 22/09/2019 1:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UploadID] [varchar](50) NULL,
	[UploadType] [varchar](50) NULL,
	[FileName] [nvarchar](max) NULL,
 CONSTRAINT [PK_UploadDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[UploadResult]    Script Date: 22/09/2019 1:37:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UploadResult]
AS
SELECT        t2.UploadID, t1.InstituteName, t1.Subject,
                             (SELECT        COUNT(*) AS MCQ
                               FROM            dbo.UploadDetails
                               WHERE        (UploadID = t2.UploadID) AND (UploadType = 'CQ')) AS CQ,
                             (SELECT        COUNT(*) AS MCQ
                               FROM            dbo.UploadDetails AS UploadDetails_1
                               WHERE        (UploadID = t2.UploadID) AND (UploadType = 'MCQ')) AS MCQ
FROM            dbo.Upload AS t1 INNER JOIN
                         dbo.UploadDetails AS t2 ON t1.ID = t2.UploadID
GROUP BY t2.UploadID, t1.InstituteName, t1.Subject

GO
INSERT [dbo].[Upload] ([ID], [InstituteName], [Subject]) VALUES (N'001', N'Lalmatia Mohila College', N'Physics 1st Paper')
INSERT [dbo].[Upload] ([ID], [InstituteName], [Subject]) VALUES (N'002', N'Lalmatia Mohila College', N'ICT')
INSERT [dbo].[Upload] ([ID], [InstituteName], [Subject]) VALUES (N'003', N'Lalmatia Mohila College', N'Physics 2nd Paper')
INSERT [dbo].[Upload] ([ID], [InstituteName], [Subject]) VALUES (N'004', N'Hamdard Public College', N'English 2nd Paper')
INSERT [dbo].[Upload] ([ID], [InstituteName], [Subject]) VALUES (N'005', N'Hamdard Public College', N'Bangla 1st Paper')
INSERT [dbo].[Upload] ([ID], [InstituteName], [Subject]) VALUES (N'006', N'Hamdard Public College', N'Bangla 2nd Paper')
SET IDENTITY_INSERT [dbo].[UploadDetails] ON 

INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (1, N'001', N'MCQ', N'001-PHY1-MCQ-001.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (2, N'001', N'MCQ', N'001-PHY1-MCQ-002.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (3, N'002', N'CQ', N'002-ICT-CQ-001.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (4, N'002', N'MCQ', N'002-ICT-MCQ-001.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (5, N'002', N'MCQ', N'002-ICT-MCQ-002.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (6, N'003', N'CQ', N'003- PHY2-CQ-001.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (7, N'003', N'CQ', N'003- PHY2-CQ-002.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (8, N'003', N'MCQ', N'003- PHY2-MCQ-002.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (9, N'005', N'CQ', N'005- BN1-CQ-001.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (10, N'005', N'MCQ', N'005- BN1-MCQ-001.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (11, N'005', N'MCQ', N'005- BN1-MCQ-002.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (12, N'006', N'CQ', N'006- BN2-CQ-001.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (13, N'006', N'CQ', N'006- BN2-CQ-002.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (14, N'006', N'MCQ', N'006- BN2-MCQ-001.pdf')
INSERT [dbo].[UploadDetails] ([ID], [UploadID], [UploadType], [FileName]) VALUES (15, N'006', N'MCQ', N'006- BN2-MCQ-002.pdf')
SET IDENTITY_INSERT [dbo].[UploadDetails] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "t1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t2"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UploadResult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UploadResult'
GO
