USE [master]
GO
/****** Object:  Database [CATALOGO_DB]    Script Date: 20/9/2021 21:23:31 ******/
CREATE DATABASE [CATALOGO_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CATALOGO_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CATALOGO_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CATALOGO_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CATALOGO_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CATALOGO_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CATALOGO_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CATALOGO_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CATALOGO_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CATALOGO_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CATALOGO_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CATALOGO_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CATALOGO_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CATALOGO_DB] SET  MULTI_USER 
GO
ALTER DATABASE [CATALOGO_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CATALOGO_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CATALOGO_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CATALOGO_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CATALOGO_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CATALOGO_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CATALOGO_DB] SET QUERY_STORE = OFF
GO
USE [CATALOGO_DB]
GO
/****** Object:  Table [dbo].[MARCAS]    Script Date: 20/9/2021 21:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_MARCAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIAS]    Script Date: 20/9/2021 21:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ARTICULOS]    Script Date: 20/9/2021 21:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARTICULOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](150) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[ImagenUrl] [varchar](1000) NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_ARTICULOS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewListarArticulos]    Script Date: 20/9/2021 21:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewListarArticulos]
AS
SELECT a.Id, a.Codigo, a.Nombre, a.Descripcion, a.Precio, a.ImagenUrl, m.Descripcion AS Desmar, m.Id AS Idmar, c.Descripcion AS Descat, c.Id AS Idcat
FROM     dbo.ARTICULOS AS a INNER JOIN
                  dbo.MARCAS AS m ON a.IdMarca = m.Id INNER JOIN
                  dbo.CATEGORIAS AS c ON a.IdCategoria = c.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[49] 4[12] 2[20] 3) )"
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
         Begin Table = "a"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 224
               Left = 390
               Bottom = 343
               Right = 584
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 126
               Right = 726
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewListarArticulos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewListarArticulos'
GO
USE [master]
GO
ALTER DATABASE [CATALOGO_DB] SET  READ_WRITE 
GO
