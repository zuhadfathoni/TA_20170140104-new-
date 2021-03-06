USE [master]
GO
/****** Object:  Database [tokosepatu]    Script Date: 15-Jul-19 16:54:48 ******/
CREATE DATABASE [tokosepatu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tokosepatu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\tokosepatu.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tokosepatu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\tokosepatu_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [tokosepatu] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tokosepatu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tokosepatu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tokosepatu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tokosepatu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tokosepatu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tokosepatu] SET ARITHABORT OFF 
GO
ALTER DATABASE [tokosepatu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tokosepatu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tokosepatu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tokosepatu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tokosepatu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tokosepatu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tokosepatu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tokosepatu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tokosepatu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tokosepatu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [tokosepatu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tokosepatu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tokosepatu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tokosepatu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tokosepatu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tokosepatu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tokosepatu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tokosepatu] SET RECOVERY FULL 
GO
ALTER DATABASE [tokosepatu] SET  MULTI_USER 
GO
ALTER DATABASE [tokosepatu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tokosepatu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tokosepatu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tokosepatu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [tokosepatu] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'tokosepatu', N'ON'
GO
USE [tokosepatu]
GO
/****** Object:  Table [dbo].[tbl_barang]    Script Date: 15-Jul-19 16:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_barang](
	[KodeBarang] [char](4) NOT NULL,
	[NamaBarang] [varchar](50) NOT NULL,
	[Warna] [varchar](50) NOT NULL,
	[Ukuran] [int] NOT NULL,
	[Stok] [int] NOT NULL,
	[Harga] [int] NOT NULL,
 CONSTRAINT [PK_tbl_barang] PRIMARY KEY CLUSTERED 
(
	[KodeBarang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_dtlPenjualan]    Script Date: 15-Jul-19 16:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_dtlPenjualan](
	[NoKwitansi] [varchar](50) NOT NULL,
	[KodeBarang] [char](4) NOT NULL,
	[Jumlah] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_pelanggan]    Script Date: 15-Jul-19 16:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_pelanggan](
	[IdPelanggan] [char](4) NOT NULL,
	[NamaPelanggan] [varchar](50) NOT NULL,
	[Alamat] [varchar](100) NULL,
	[NoTelepon] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_pelanggan] PRIMARY KEY CLUSTERED 
(
	[IdPelanggan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_penjualan]    Script Date: 15-Jul-19 16:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_penjualan](
	[NoKwitansi] [varchar](50) NOT NULL,
	[TglKwitansi] [date] NOT NULL,
	[IdPelanggan] [char](4) NOT NULL,
 CONSTRAINT [PK_tbl_penjualan] PRIMARY KEY CLUSTERED 
(
	[NoKwitansi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vw_cetaktransaksi]    Script Date: 15-Jul-19 16:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_cetaktransaksi]
AS
SELECT dbo.tbl_dtlPenjualan.NoKwitansi, dbo.tbl_penjualan.TglKwitansi, dbo.tbl_penjualan.IdPelanggan, dbo.tbl_pelanggan.NamaPelanggan, dbo.tbl_dtlPenjualan.KodeBarang, dbo.tbl_barang.NamaBarang, dbo.tbl_barang.Warna, 
                  dbo.tbl_barang.Ukuran, dbo.tbl_barang.Harga, dbo.tbl_dtlPenjualan.Jumlah, dbo.tbl_barang.Harga * dbo.tbl_dtlPenjualan.Jumlah AS JumlahBayar
FROM     dbo.tbl_barang INNER JOIN
                  dbo.tbl_dtlPenjualan ON dbo.tbl_barang.KodeBarang = dbo.tbl_dtlPenjualan.KodeBarang INNER JOIN
                  dbo.tbl_penjualan ON dbo.tbl_dtlPenjualan.NoKwitansi = dbo.tbl_penjualan.NoKwitansi INNER JOIN
                  dbo.tbl_pelanggan ON dbo.tbl_penjualan.IdPelanggan = dbo.tbl_pelanggan.IdPelanggan

GO
/****** Object:  View [dbo].[vw_detail]    Script Date: 15-Jul-19 16:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_detail]
AS
SELECT dbo.tbl_dtlPenjualan.NoKwitansi, dbo.tbl_dtlPenjualan.KodeBarang, dbo.tbl_barang.NamaBarang, dbo.tbl_barang.Harga, dbo.tbl_barang.Ukuran, dbo.tbl_barang.Warna, dbo.tbl_dtlPenjualan.Jumlah
FROM     dbo.tbl_barang INNER JOIN
                  dbo.tbl_dtlPenjualan ON dbo.tbl_barang.KodeBarang = dbo.tbl_dtlPenjualan.KodeBarang

GO
/****** Object:  View [dbo].[vw_penjualan]    Script Date: 15-Jul-19 16:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_penjualan]
AS
SELECT dbo.tbl_penjualan.NoKwitansi, dbo.tbl_penjualan.TglKwitansi, dbo.tbl_pelanggan.NamaPelanggan
FROM     dbo.tbl_penjualan INNER JOIN
                  dbo.tbl_pelanggan ON dbo.tbl_penjualan.IdPelanggan = dbo.tbl_pelanggan.IdPelanggan

GO
ALTER TABLE [dbo].[tbl_dtlPenjualan]  WITH CHECK ADD  CONSTRAINT [Relasi_Detail_Barang] FOREIGN KEY([KodeBarang])
REFERENCES [dbo].[tbl_barang] ([KodeBarang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_dtlPenjualan] CHECK CONSTRAINT [Relasi_Detail_Barang]
GO
ALTER TABLE [dbo].[tbl_dtlPenjualan]  WITH CHECK ADD  CONSTRAINT [Relasi_Detail_Penjualan] FOREIGN KEY([NoKwitansi])
REFERENCES [dbo].[tbl_penjualan] ([NoKwitansi])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_dtlPenjualan] CHECK CONSTRAINT [Relasi_Detail_Penjualan]
GO
ALTER TABLE [dbo].[tbl_penjualan]  WITH CHECK ADD  CONSTRAINT [Relasi_Penjualan_Pelanggan] FOREIGN KEY([IdPelanggan])
REFERENCES [dbo].[tbl_pelanggan] ([IdPelanggan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_penjualan] CHECK CONSTRAINT [Relasi_Penjualan_Pelanggan]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[22] 2[21] 3) )"
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
         Begin Table = "tbl_barang"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tbl_dtlPenjualan"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_pelanggan"
            Begin Extent = 
               Top = 0
               Left = 728
               Bottom = 163
               Right = 933
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_penjualan"
            Begin Extent = 
               Top = 168
               Left = 509
               Bottom = 309
               Right = 703
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_cetaktransaksi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_cetaktransaksi'
GO
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
         Begin Table = "tbl_barang"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tbl_dtlPenjualan"
            Begin Extent = 
               Top = 54
               Left = 426
               Bottom = 195
               Right = 620
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_detail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_detail'
GO
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
         Begin Table = "tbl_penjualan"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_pelanggan"
            Begin Extent = 
               Top = 22
               Left = 342
               Bottom = 185
               Right = 547
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_penjualan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_penjualan'
GO
USE [master]
GO
ALTER DATABASE [tokosepatu] SET  READ_WRITE 
GO
