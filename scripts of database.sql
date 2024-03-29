USE [master]
GO
/****** Object:  Database [Domitory]    Script Date: 30/11/2022 2:39:46 CH ******/
CREATE DATABASE [Domitory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Domitory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Domitory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Domitory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Domitory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Domitory] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Domitory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Domitory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Domitory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Domitory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Domitory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Domitory] SET ARITHABORT OFF 
GO
ALTER DATABASE [Domitory] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Domitory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Domitory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Domitory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Domitory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Domitory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Domitory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Domitory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Domitory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Domitory] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Domitory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Domitory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Domitory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Domitory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Domitory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Domitory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Domitory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Domitory] SET RECOVERY FULL 
GO
ALTER DATABASE [Domitory] SET  MULTI_USER 
GO
ALTER DATABASE [Domitory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Domitory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Domitory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Domitory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Domitory] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Domitory] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Domitory', N'ON'
GO
ALTER DATABASE [Domitory] SET QUERY_STORE = OFF
GO
USE [Domitory]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlockManagements]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlockManagements](
	[BlockId] [int] NOT NULL,
	[ManagerId] [int] NOT NULL,
 CONSTRAINT [PK_BlockManagements] PRIMARY KEY CLUSTERED 
(
	[ManagerId] ASC,
	[BlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blocks]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blocks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Blocks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElectricWaterlogs]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElectricWaterlogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogDate] [datetime2](7) NOT NULL,
	[ElectricNew] [int] NOT NULL,
	[ElectricOld] [int] NOT NULL,
	[WaterOld] [int] NOT NULL,
	[WaterNew] [int] NOT NULL,
	[WaterUse] [int] NOT NULL,
	[ElectricUse] [int] NOT NULL,
	[ElectricFee] [int] NOT NULL,
	[WaterFee] [int] NOT NULL,
	[TotalFee] [int] NOT NULL,
	[FeeStatus] [bit] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_ElectricWaterlogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Furnitures]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Furnitures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [real] NOT NULL,
	[RepairDetailId] [int] NOT NULL,
 CONSTRAINT [PK_Furnitures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[IdentiFyCardNumber] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Gender] [bit] NOT NULL,
	[IdCard] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisterRooms]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterRooms](
	[StudentId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DateBegin] [datetime2](7) NOT NULL,
	[DateEnd] [datetime2](7) NOT NULL,
	[NumberOfMonth] [int] NOT NULL,
	[DomitoryFee] [int] NOT NULL,
	[DomitoryFeeStatus] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_RegisterRooms] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairDetails]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RepairDate] [datetime2](7) NOT NULL,
	[RepairFee] [real] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_RepairDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[SlotRemain] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[BlockId] [int] NOT NULL,
	[RoomTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumberOfSLot] [int] NOT NULL,
	[Furniture] [bit] NOT NULL,
	[DomitoryFee] [int] NOT NULL,
 CONSTRAINT [PK_RoomTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[Ethnic] [nvarchar](max) NOT NULL,
	[Nationnality] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[HomeAddress] [nvarchar](max) NOT NULL,
	[MainAddress] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Avartar] [varbinary](max) NOT NULL,
	[IdentifyCardNumber] [nvarchar](max) NOT NULL,
	[UniversitysutdentId] [nvarchar](max) NOT NULL,
	[Faculty] [nvarchar](max) NOT NULL,
	[Major] [nvarchar](max) NOT NULL,
	[SchoolYear] [nvarchar](max) NOT NULL,
	[RelatedPersonName] [nvarchar](max) NOT NULL,
	[RelatedPersonPhoneNumber] [nvarchar](max) NOT NULL,
	[status] [bit] NOT NULL,
	[accountId] [int] NOT NULL,
	[UniversityId] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Universities]    Script Date: 30/11/2022 2:39:47 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Universities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_BlockManagements_BlockId]    Script Date: 30/11/2022 2:39:47 CH ******/
CREATE NONCLUSTERED INDEX [IX_BlockManagements_BlockId] ON [dbo].[BlockManagements]
(
	[BlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ElectricWaterlogs_RoomId]    Script Date: 30/11/2022 2:39:47 CH ******/
CREATE NONCLUSTERED INDEX [IX_ElectricWaterlogs_RoomId] ON [dbo].[ElectricWaterlogs]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Furnitures_RepairDetailId]    Script Date: 30/11/2022 2:39:47 CH ******/
CREATE NONCLUSTERED INDEX [IX_Furnitures_RepairDetailId] ON [dbo].[Furnitures]
(
	[RepairDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Managers_AccountId]    Script Date: 30/11/2022 2:39:47 CH ******/
CREATE NONCLUSTERED INDEX [IX_Managers_AccountId] ON [dbo].[Managers]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RegisterRooms_RoomId]    Script Date: 30/11/2022 2:39:47 CH ******/
CREATE NONCLUSTERED INDEX [IX_RegisterRooms_RoomId] ON [dbo].[RegisterRooms]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RepairDetails_RoomId]    Script Date: 30/11/2022 2:39:47 CH ******/
CREATE NONCLUSTERED INDEX [IX_RepairDetails_RoomId] ON [dbo].[RepairDetails]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_BlockId]    Script Date: 30/11/2022 2:39:47 CH ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_BlockId] ON [dbo].[Rooms]
(
	[BlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_RoomTypeId]    Script Date: 30/11/2022 2:39:47 CH ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_RoomTypeId] ON [dbo].[Rooms]
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Students_accountId]    Script Date: 30/11/2022 2:39:47 CH ******/
CREATE NONCLUSTERED INDEX [IX_Students_accountId] ON [dbo].[Students]
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Students_UniversityId]    Script Date: 30/11/2022 2:39:47 CH ******/
CREATE NONCLUSTERED INDEX [IX_Students_UniversityId] ON [dbo].[Students]
(
	[UniversityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RegisterRooms] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Status]
GO
ALTER TABLE [dbo].[BlockManagements]  WITH CHECK ADD  CONSTRAINT [FK_BlockManagements_Blocks_BlockId] FOREIGN KEY([BlockId])
REFERENCES [dbo].[Blocks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlockManagements] CHECK CONSTRAINT [FK_BlockManagements_Blocks_BlockId]
GO
ALTER TABLE [dbo].[BlockManagements]  WITH CHECK ADD  CONSTRAINT [FK_BlockManagements_Managers_ManagerId] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Managers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlockManagements] CHECK CONSTRAINT [FK_BlockManagements_Managers_ManagerId]
GO
ALTER TABLE [dbo].[ElectricWaterlogs]  WITH CHECK ADD  CONSTRAINT [FK_ElectricWaterlogs_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ElectricWaterlogs] CHECK CONSTRAINT [FK_ElectricWaterlogs_Rooms_RoomId]
GO
ALTER TABLE [dbo].[Furnitures]  WITH CHECK ADD  CONSTRAINT [FK_Furnitures_RepairDetails_RepairDetailId] FOREIGN KEY([RepairDetailId])
REFERENCES [dbo].[RepairDetails] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Furnitures] CHECK CONSTRAINT [FK_Furnitures_RepairDetails_RepairDetailId]
GO
ALTER TABLE [dbo].[Managers]  WITH CHECK ADD  CONSTRAINT [FK_Managers_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Managers] CHECK CONSTRAINT [FK_Managers_Accounts_AccountId]
GO
ALTER TABLE [dbo].[RegisterRooms]  WITH CHECK ADD  CONSTRAINT [FK_RegisterRooms_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RegisterRooms] CHECK CONSTRAINT [FK_RegisterRooms_Rooms_RoomId]
GO
ALTER TABLE [dbo].[RegisterRooms]  WITH CHECK ADD  CONSTRAINT [FK_RegisterRooms_Students_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Students] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RegisterRooms] CHECK CONSTRAINT [FK_RegisterRooms_Students_RoomId]
GO
ALTER TABLE [dbo].[RepairDetails]  WITH CHECK ADD  CONSTRAINT [FK_RepairDetails_Rooms_RoomId] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RepairDetails] CHECK CONSTRAINT [FK_RepairDetails_Rooms_RoomId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Blocks_BlockId] FOREIGN KEY([BlockId])
REFERENCES [dbo].[Blocks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Blocks_BlockId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomTypes_RoomTypeId] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomTypes_RoomTypeId]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Accounts_accountId] FOREIGN KEY([accountId])
REFERENCES [dbo].[Accounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Accounts_accountId]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Universities_UniversityId] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[Universities] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Universities_UniversityId]
GO
USE [master]
GO
ALTER DATABASE [Domitory] SET  READ_WRITE 
GO
