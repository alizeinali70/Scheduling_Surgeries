USE [master]
GO
/****** Object:  Database [Scheduling_Surgeries_DB]    Script Date: 18/09/2022 13:55:20 ******/
CREATE DATABASE [Scheduling_Surgeries_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Scheduling_Surgeries_DB', FILENAME = N'D:\C#.Net\Scheduling_Surgeries\SQL\Scheduling_Surgeries_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Scheduling_Surgeries_DB_log', FILENAME = N'D:\C#.Net\Scheduling_Surgeries\SQL\Scheduling_Surgeries_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Scheduling_Surgeries_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET QUERY_STORE = OFF
GO
USE [Scheduling_Surgeries_DB]
GO
/****** Object:  Table [dbo].[T_Do_Surgery]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Do_Surgery](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Dr_ID] [nvarchar](50) NOT NULL,
	[N_ID] [nvarchar](50) NOT NULL,
	[S_ID] [nvarchar](50) NOT NULL,
	[S_R_ID] [nvarchar](50) NOT NULL,
	[P_ID] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Start_Time] [time](7) NOT NULL,
	[End_Time] [time](7) NOT NULL,
	[Emergency] [bit] NOT NULL,
 CONSTRAINT [PK_T_Do_Surgery] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Doctor]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Doctor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Specialist] [nvarchar](50) NULL,
	[Busy] [bit] NULL,
 CONSTRAINT [PK_T_Doctor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Nurse]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Nurse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Busy] [bit] NULL,
 CONSTRAINT [PK_T_Nurse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Patient]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Type_Of_Surgery] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Surgery_Name]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Surgery_Name](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Min_Duration] [int] NULL,
	[Max_Duration] [int] NULL,
 CONSTRAINT [PK_T_Surgery_Name] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Surgery_Room]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Surgery_Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NULL,
	[Busy] [bit] NULL,
 CONSTRAINT [PK_T_Surgery_Room] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_Do_Surgery] ON 

INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (1, N'Doctor1', N'Nurse1,Nurse2,', N'Open Heart', N'Surgery Room1', N'Patient1', CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'10:00:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (2, N'Doctor2', N'Nurse3,Nurse4,', N'Close Heart', N'Surgery Room2', N'Patient2', CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:05:00.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (3, N'Doctor3', N'Nurse5,Nurse6', N'Open Heart', N'Surgery Room3', N'Patient3', CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:05:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (4, N'Doctor4', N'Nurse7,Nurse8,', N'Open Heart', N'Surgery Room4', N'Patient4', CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:25:42.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (5, N'Doctor5', N'Nurse9,Nurse10,', N'Close Heart', N'Surgery Room5', N'Patient5', CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'15:00:42' AS Time), CAST(N'15:20:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (6, N'Doctor6', N'Nurse11,Nurse12,', N'thoracic', N'Surgery Room6', N'Patient6', CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'08:40:42' AS Time), CAST(N'09:52:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (7, N'Doctor7', N'Nurse13,Nurse15,', N'Open Heart', N'Surgery Room7', N'Patient7', CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'11:10:42' AS Time), CAST(N'11:23:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (8, N'Doctor8', N'Nurse16,Nurse17,', N'Close Heart', N'Surgery Room8', N'Patient8', CAST(N'2022-09-01T00:00:00.000' AS DateTime), CAST(N'10:40:42' AS Time), CAST(N'11:40:00.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (9, N'Doctor1', N'Nurse1,Nurse2,', N'Open Heart', N'Surgery Room1', N'Patient11', CAST(N'2022-09-02T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:01:42.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (10, N'Doctor2', N'Nurse3,Nurse4,', N'Close Heart', N'Surgery Room2', N'Patient21', CAST(N'2022-09-02T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:45:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (11, N'Doctor3', N'Nurse5,Nurse6', N'Open Heart', N'Surgery Room3', N'Patient31', CAST(N'2022-09-02T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:25:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (12, N'Doctor4', N'Nurse7,Nurse8,', N'Open Heart', N'Surgery Room4', N'Patient42', CAST(N'2022-09-02T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:44:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (13, N'Doctor5', N'Nurse9,Nurse10,', N'Close Heart', N'Surgery Room5', N'Patient54', CAST(N'2022-09-02T00:00:00.000' AS DateTime), CAST(N'15:00:42' AS Time), CAST(N'16:30:00.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (14, N'Doctor6', N'Nurse11,Nurse12,', N'thoracic', N'Surgery Room6', N'Patient65', CAST(N'2022-09-02T00:00:00.000' AS DateTime), CAST(N'08:40:42' AS Time), CAST(N'09:10:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (15, N'Doctor7', N'Nurse13,Nurse15,', N'Open Heart', N'Surgery Room7', N'Patient70', CAST(N'2022-09-02T00:00:00.000' AS DateTime), CAST(N'11:10:42' AS Time), CAST(N'11:55:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (16, N'Doctor8', N'Nurse16,Nurse17,', N'Close Heart', N'Surgery Room8', N'Patient8', CAST(N'2022-09-02T00:00:00.000' AS DateTime), CAST(N'10:40:42' AS Time), CAST(N'12:02:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (17, N'Doctor9', N'Nurse11,Nurse12,', N'Open Heart', N'Surgery Room10', N'Patient10', CAST(N'2022-09-03T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:01:42.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (18, N'Doctor10', N'Nurse13,Nurse14,', N'Close Heart', N'Surgery Room9', N'Patient20', CAST(N'2022-09-03T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:45:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (19, N'Doctor3', N'Nurse15,Nurse16', N'Open Heart', N'Surgery Room6', N'Patient30', CAST(N'2022-09-03T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:25:42.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (20, N'Doctor4', N'Nurse17,Nurse18,', N'Open Heart', N'Surgery Room4', N'Patient40', CAST(N'2022-09-03T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:44:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (21, N'Doctor5', N'Nurse19,Nurse20,', N'Close Heart', N'Surgery Room5', N'Patient50', CAST(N'2022-09-03T00:00:00.000' AS DateTime), CAST(N'15:00:42' AS Time), CAST(N'16:30:00.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (22, N'Doctor6', N'Nurse21,Nurse22,', N'thoracic', N'Surgery Room6', N'Patient60', CAST(N'2022-09-03T00:00:00.000' AS DateTime), CAST(N'08:40:42' AS Time), CAST(N'09:10:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (23, N'Doctor7', N'Nurse23,Nurse25,', N'transplant and vascular', N'Surgery Room7', N'Patient72', CAST(N'2022-09-03T00:00:00.000' AS DateTime), CAST(N'11:10:42' AS Time), CAST(N'11:55:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (24, N'Doctor8', N'Nurse26,Nurse27,', N'Close Heart', N'Surgery Room8', N'Patient80', CAST(N'2022-09-03T00:00:00.000' AS DateTime), CAST(N'10:40:42' AS Time), CAST(N'12:02:00.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (25, N'Doctor9', N'Nurse1,Nurse12,', N'Open Heart', N'Surgery Room10', N'Patient19', CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:01:42.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (26, N'Doctor10', N'Nurse23,Nurse14,', N'Close Heart', N'Surgery Room9', N'Patient20', CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:45:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (27, N'Doctor3', N'Nurse5,Nurse16', N'Open Heart', N'Surgery Room6', N'Patient30', CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:25:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (28, N'Doctor4', N'Nurse27,Nurse18,', N'Open Heart', N'Surgery Room4', N'Patient40', CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:44:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (29, N'Doctor5', N'Nurse29,Nurse20,', N'Close Heart', N'Surgery Room5', N'Patient50', CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'15:00:42' AS Time), CAST(N'16:30:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (30, N'Doctor6', N'Nurse31,Nurse22,', N'thoracic', N'Surgery Room6', N'Patient60', CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'08:40:42' AS Time), CAST(N'09:10:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (31, N'Doctor7', N'Nurse33,Nurse25,', N'transplant and vascular', N'Surgery Room7', N'Patient70', CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'11:10:42' AS Time), CAST(N'11:55:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (32, N'Doctor8', N'Nurse16,Nurse27,', N'Close Heart', N'Surgery Room8', N'Patient80', CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'10:40:42' AS Time), CAST(N'12:02:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (33, N'Doctor9', N'Nurse28,Nurse29,', N'Open Heart', N'Surgery Room9', N'Paient9', CAST(N'2022-09-04T00:00:00.000' AS DateTime), CAST(N'09:40:42' AS Time), CAST(N'11:40:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (34, N'Doctor11', N'Nurse1,Nurse12,', N'Open Heart', N'Surgery Room10', N'Patient15', CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:01:42.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (35, N'Doctor12', N'Nurse23,Nurse14,', N'thoracic', N'Surgery Room9', N'Patient25', CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:45:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (36, N'Doctor13', N'Nurse5,Nurse16', N'Open Heart', N'Surgery Room6', N'Patient35', CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:25:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (37, N'Doctor14', N'Nurse27,Nurse18,', N'Open Heart', N'Surgery Room4', N'Patient45', CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:44:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (38, N'Doctor15', N'Nurse29,Nurse20,', N'Close Heart', N'Surgery Room5', N'Patient55', CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'15:00:42' AS Time), CAST(N'16:30:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (39, N'Doctor16', N'Nurse31,Nurse22,', N'thoracic', N'Surgery Room6', N'Patient65', CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'08:40:42' AS Time), CAST(N'09:10:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (40, N'Doctor17', N'Nurse33,Nurse25,', N'transplant and vascular', N'Surgery Room7', N'Patient70', CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'11:10:42' AS Time), CAST(N'11:55:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (41, N'Doctor10', N'Nurse26,Nurse27,', N'Close Heart', N'Surgery Room8', N'Patient58', CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'10:40:42' AS Time), CAST(N'12:02:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (42, N'Doctor6', N'Nurse28,Nurse19,', N'Open Heart', N'Surgery Room9', N'Patient44', CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'09:40:42' AS Time), CAST(N'11:40:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (43, N'Doctor11', N'Nurse1,Nurse12,', N'Open Heart', N'Surgery Room10', N'Patient25', CAST(N'2022-09-06T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:01:42.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (44, N'Doctor18', N'Nurse23,Nurse14,', N'thoracic', N'Surgery Room9', N'Patient15', CAST(N'2022-09-06T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:45:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (45, N'Doctor17', N'Nurse5,Nurse16', N'Open Heart', N'Surgery Room6', N'Patient65', CAST(N'2022-09-06T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:25:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (46, N'Doctor16', N'Nurse27,Nurse18,', N'Open Heart', N'Surgery Room4', N'Patient55', CAST(N'2022-09-06T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:44:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (47, N'Doctor15', N'Nurse29,Nurse20,', N'Close Heart', N'Surgery Room5', N'Patient43', CAST(N'2022-09-06T00:00:00.000' AS DateTime), CAST(N'15:00:42' AS Time), CAST(N'16:30:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (48, N'Doctor14', N'Nurse31,Nurse22,', N'thoracic', N'Surgery Room6', N'Patient33', CAST(N'2022-09-06T00:00:00.000' AS DateTime), CAST(N'08:40:42' AS Time), CAST(N'09:10:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (49, N'Doctor13', N'Nurse33,Nurse25,', N'transplant and vascular', N'Surgery Room7', N'Patient70', CAST(N'2022-09-06T00:00:00.000' AS DateTime), CAST(N'11:10:42' AS Time), CAST(N'11:55:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (50, N'Doctor12', N'Nurse26,Nurse27,', N'Close Heart', N'Surgery Room8', N'Patient28', CAST(N'2022-09-06T00:00:00.000' AS DateTime), CAST(N'10:40:42' AS Time), CAST(N'12:02:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (51, N'Doctor17', N'Nurse1,Nurse12,', N'Open Heart', N'Surgery Room1', N'Patient66', CAST(N'2022-09-07T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:01:42.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (52, N'Doctor16', N'Nurse23,Nurse14,', N'thoracic', N'Surgery Room2', N'Patient29', CAST(N'2022-09-07T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:45:00.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (53, N'Doctor15', N'Nurse5,Nurse16', N'Open Heart', N'Surgery Room3', N'Patient56', CAST(N'2022-09-07T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'09:25:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (54, N'Doctor14', N'Nurse27,Nurse18,', N'Open Heart', N'Surgery Room4', N'Patient45', CAST(N'2022-09-07T00:00:00.000' AS DateTime), CAST(N'08:00:00' AS Time), CAST(N'08:44:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (55, N'Doctor13', N'Nurse29,Nurse20,', N'Close Heart', N'Surgery Room5', N'Patient39', CAST(N'2022-09-07T00:00:00.000' AS DateTime), CAST(N'15:00:42' AS Time), CAST(N'16:30:00.2887196' AS Time), 1)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (56, N'Doctor12', N'Nurse31,Nurse22,', N'thoracic', N'Surgery Room6', N'Patient31', CAST(N'2022-09-07T00:00:00.000' AS DateTime), CAST(N'08:40:42' AS Time), CAST(N'09:10:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (57, N'Doctor11', N'Nurse33,Nurse25,', N'transplant and vascular', N'Surgery Room7', N'Patient50', CAST(N'2022-09-07T00:00:00.000' AS DateTime), CAST(N'11:10:42' AS Time), CAST(N'11:55:42.2887196' AS Time), 0)
INSERT [dbo].[T_Do_Surgery] ([ID], [Dr_ID], [N_ID], [S_ID], [S_R_ID], [P_ID], [Date], [Start_Time], [End_Time], [Emergency]) VALUES (58, N'Doctor1', N'Nurse26,Nurse27,', N'Close Heart', N'Surgery Room8', N'Patient48', CAST(N'2022-09-07T00:00:00.000' AS DateTime), CAST(N'10:40:42' AS Time), CAST(N'12:02:00.2887196' AS Time), 1)
SET IDENTITY_INSERT [dbo].[T_Do_Surgery] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Doctor] ON 

INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (1, N'Doctor1', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (2, N'Doctor2', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (3, N'Doctor3', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (4, N'Doctor4', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (5, N'Doctor5', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (6, N'Doctor6', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (7, N'Doctor7', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (8, N'Doctor8', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (9, N'Doctor9', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (10, N'Doctor10', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (11, N'Doctor11', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (12, N'Doctor12', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (13, N'Doctor13', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (14, N'Doctor14', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (15, N'Doctor15', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (16, N'Doctor16', N'Heart', 0)
INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (17, N'Doctor17', N'Heart', 0)
SET IDENTITY_INSERT [dbo].[T_Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Nurse] ON 

INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (1, N'Nurse1', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (2, N'Nurse2', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (3, N'Nurse3', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (4, N'Nurse4', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (5, N'Nurse5', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (6, N'Nurse6', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (7, N'Nurse7', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (8, N'Nurse8', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (9, N'Nurse9', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (10, N'Nurse10', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (11, N'Nurse11', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (12, N'Nurse12', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (13, N'Nurse13', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (14, N'Nurse14', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (15, N'Nurse15', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (16, N'Nurse16', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (17, N'Nurse17', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (18, N'Nurse18', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (19, N'Nurse19', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (20, N'Nurse20', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (21, N'Nurse21', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (22, N'Nurse22', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (23, N'Nurse23', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (24, N'Nurse24', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (25, N'Nurse25', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (26, N'Nurse26', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (27, N'Nurse27', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (28, N'Nurse28', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (29, N'Nurse29', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (30, N'Nurse30', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (31, N'Nurse31', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (32, N'Nurse23', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (33, N'Nurse33', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (34, N'Nurse34', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (35, N'Nurse35', 0)
SET IDENTITY_INSERT [dbo].[T_Nurse] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Patient] ON 

INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (1, N'Patient1', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (2, N'Patient2', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (3, N'Patient3', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (4, N'Patient4', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (5, N'Patient5', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (6, N'Patient6', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (7, N'Patient7', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (8, N'Patient8', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (9, N'Patient9', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (10, N'Patient10', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (11, N'Patient11', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (12, N'Patient12', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (13, N'Patient13', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (14, N'Patient14', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (15, N'Patient15', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (16, N'Patient16', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (17, N'Patient17', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (18, N'Patient18', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (19, N'Patient19', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (20, N'Patient20', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (21, N'Patient21', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (22, N'Patient22', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (23, N'Patient23', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (24, N'Patient24', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (25, N'Patient25', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (26, N'Patient26', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (27, N'Patient27', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (28, N'Patient28', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (29, N'Patient29', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (30, N'Patient30', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (31, N'Patient31', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (32, N'Patient32', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (33, N'Patient33', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (34, N'Patient34', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (35, N'Patient35', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (36, N'Patient36', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (37, N'Patient37', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (38, N'Patient38', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (39, N'Patient39', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (40, N'Patient40', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (41, N'Patient41', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (42, N'Patient42', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (43, N'Patient43', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (44, N'Patient44', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (45, N'Patient45', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (46, N'Patient46', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (47, N'Patient47', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (48, N'Patient48', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (49, N'Patient49', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (50, N'Patient50', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (51, N'Patient51', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (52, N'Patient52', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (53, N'Patient53', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (54, N'Patient54', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (55, N'Patient55', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (56, N'Patient56', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (57, N'Patient57', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (58, N'Patient58', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (59, N'Patient59', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (60, N'Patient60', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (61, N'Patient61', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (62, N'Patient62', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (63, N'Patient63', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (64, N'Patient64', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (65, N'Patient65', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (66, N'Patient66', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (67, N'Patient67', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (68, N'Patient68', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (69, N'Patient69', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (70, N'Patient70', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (71, N'Patient71', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (72, N'Patient72', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (73, N'Patient73', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (74, N'Patient74', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (75, N'Patient75', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (76, N'Patient76', N'transplant and vascular')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (77, N'Patient77', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (78, N'Patient78', N'Close Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (79, N'Patient79', N'thoracic')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (80, N'Patient80', N'transplant and vascular')
SET IDENTITY_INSERT [dbo].[T_Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Surgery_Name] ON 

INSERT [dbo].[T_Surgery_Name] ([ID], [Fullname], [Min_Duration], [Max_Duration]) VALUES (1, N'Open Heart', 13, 121)
INSERT [dbo].[T_Surgery_Name] ([ID], [Fullname], [Min_Duration], [Max_Duration]) VALUES (2, N'Close Heart', 21, 60)
INSERT [dbo].[T_Surgery_Name] ([ID], [Fullname], [Min_Duration], [Max_Duration]) VALUES (3, N'thoracic', 21, 60)
INSERT [dbo].[T_Surgery_Name] ([ID], [Fullname], [Min_Duration], [Max_Duration]) VALUES (4, N'transplant and vascular', 21, 60)
SET IDENTITY_INSERT [dbo].[T_Surgery_Name] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Surgery_Room] ON 

INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (1, N'Surgery Room1', 0)
INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (2, N'Surgery Room2', 0)
INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (3, N'Surgery Room3', 0)
INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (4, N'Surgery Room4', 0)
INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (5, N'Surgery Room5', 0)
INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (6, N'Surgery Room6', 0)
INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (7, N'Surgery Room7', 0)
INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (8, N'Surgery Room8', 0)
INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (9, N'Surgery Room9', 0)
INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (10, N'Surgery Room10', 0)
SET IDENTITY_INSERT [dbo].[T_Surgery_Room] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_do_surgery_insert]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_do_surgery_insert]


@Dr_ID		   nvarchar(50)
,@N_ID		   nvarchar(50)
,@S_ID		   nvarchar(50)
,@S_R_ID	   nvarchar(50)
,@P_ID		   nvarchar(50)
,@Date		   datetime
,@Start_Time   time
,@End_Time	   time
,@Emergency bit

as

INSERT INTO [dbo].[T_Do_Surgery]
           ([Dr_ID]
           ,[N_ID]
           ,[S_ID]
           ,[S_R_ID]
		   ,[P_ID]
           ,[Date]
           ,[Start_Time]
           ,[End_Time]
		   ,[Emergency])
     VALUES
           (@Dr_ID,@N_ID,@S_ID,@S_R_ID,@P_ID,@Date,@Start_Time,@End_Time,@Emergency)
GO
/****** Object:  StoredProcedure [dbo].[sp_do_surgery_select]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_do_surgery_select]
@S_Date datetime,
@E_Date datetime
as

SELECT [ID]			  
      ,[Dr_ID]		  as 'Doctor_Name'
      ,[N_ID]		  as 'Nurse_Name'
      ,[S_ID]		  as 'Surgery_Name'
      ,[S_R_ID]		  as 'Surgery_Room'
	  ,[P_ID]		  as 'Ptient'
      ,[Date]		  
      ,[Start_Time]	  
      ,[End_Time]	  
	  ,[Emergency]	
  FROM [dbo].[T_Do_Surgery]

  where Date between  @S_Date and @E_Date
GO
/****** Object:  StoredProcedure [dbo].[sp_do_surgery_select_s_date]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_do_surgery_select_s_date]
@S_Date datetime
as

SELECT [ID]			  
      ,[Dr_ID]		  as 'Doctor_Name'
      ,[N_ID]		  as 'Nurse_Name'
      ,[S_ID]		  as 'Surgery_Name'
      ,[S_R_ID]		  as 'Surgery_Room'
	  ,[P_ID]		  as 'Ptient'
      ,[Date]		  
      ,[Start_Time]	  
      ,[End_Time]	  
	  ,[Emergency]	
  FROM [dbo].[T_Do_Surgery]

  where Date =  @S_Date
GO
/****** Object:  StoredProcedure [dbo].[sp_do_surgery_update]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_do_surgery_update]

 @ID		   nvarchar(50)
,@Dr_ID		   nvarchar(50)
,@N_ID		   nvarchar(50)
,@S_ID		   nvarchar(50)
,@S_R_ID	   nvarchar(50)
,@P_ID		   nvarchar(50)
,@Date		   nvarchar(50)
,@Start_Time   nvarchar(50)
,@End_Time	   nvarchar(50)
,@Emergency bit

as


UPDATE [dbo].[T_Do_Surgery]
   SET [Dr_ID] =@Dr_ID
      ,[N_ID] = @N_ID
      ,[S_ID] = @S_ID
      ,[S_R_ID]= @S_R_ID
	  ,[P_ID]=@P_ID
      ,[Date] = @Date
      ,[Start_Time] = @Start_Time
      ,[End_Time] = @End_Time
	  ,[Emergency]=@Emergency
 WHERE ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_doctor_insert]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_doctor_insert]

@Fullname nvarchar(50),
@Specialist nvarchar(50),
@Busy bit

as



INSERT INTO [dbo].[T_Doctor]
           ([Fullname]
           ,[Specialist]
           ,[Busy])
     VALUES
           (@Fullname,@Specialist,@Busy)
GO
/****** Object:  StoredProcedure [dbo].[sp_doctor_is_busy]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_doctor_is_busy]
@Fullname nvarchar(50)
,@Date datetime
,@End_Time time
as

SELECT [ID]
      ,[Dr_ID]
      ,[N_ID]
      ,[S_ID]
      ,[S_R_ID]
      ,[P_ID]
      ,[Date]
      ,[Start_Time]
      ,[End_Time]
      ,[Emergency]
  FROM [dbo].[T_Do_Surgery]

  where
  Dr_ID=@Fullname and Date=@Date and End_Time <= @End_Time
GO
/****** Object:  StoredProcedure [dbo].[sp_doctor_select]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_doctor_select]
as

SELECT [ID]
      ,[Fullname]
      ,[Specialist]
      ,[Busy]
  FROM [dbo].[T_Doctor]

GO
/****** Object:  StoredProcedure [dbo].[sp_doctor_update]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_doctor_update]

@Fullname nvarchar(50),
@Busy bit

as



UPDATE [dbo].[T_Doctor]
   SET [Fullname] = @Fullname     
      ,[Busy] = @Busy
 WHERE [Fullname] = @Fullname
GO
/****** Object:  StoredProcedure [dbo].[sp_nurse_insert]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_nurse_insert]

@Fullname nvarchar(50),
@Busy bit
as


INSERT INTO [dbo].[T_Nurse]
           ([Fullname],
		   [Busy])
     VALUES
           (@Fullname,@Busy)
GO
/****** Object:  StoredProcedure [dbo].[sp_nurse_select]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_nurse_select]
as



SELECT [ID]
      ,[Fullname]
	  ,[Busy]
  FROM [dbo].[T_Nurse]

GO
/****** Object:  StoredProcedure [dbo].[sp_nurse_update]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_nurse_update]

@Fullname nvarchar(50),
@Busy bit
as


UPDATE [dbo].[T_Nurse]
   SET [Fullname] = @Fullname,
   [Busy]=@Busy
 WHERE [Fullname] = @Fullname
GO
/****** Object:  StoredProcedure [dbo].[sp_patient_insert]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_patient_insert]
--@ID int
      @Fullname nvarchar(50)
      ,@Type_Of_Surgery nvarchar(50)

as


INSERT INTO [dbo].[T_Patient]
           ([Fullname]
           ,[Type_Of_Surgery])
     VALUES
           (@Fullname,@Type_Of_Surgery)
GO
/****** Object:  StoredProcedure [dbo].[sp_patient_select]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_patient_select]
as

SELECT [ID]
      ,[Fullname]
      ,[Type_Of_Surgery]
  FROM [dbo].[T_Patient]

GO
/****** Object:  StoredProcedure [dbo].[sp_patient_update]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_patient_update]
@ID int
, @Fullname nvarchar(50)
 ,@Type_Of_Surgery nvarchar(50)

as


UPDATE [dbo].[T_Patient]
   SET [Fullname] = @Fullname
      ,[Type_Of_Surgery] = @Type_Of_Surgery
 WHERE ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_surgery_name_insert]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_surgery_name_insert]
--@ID int,
@Fullname nvarchar(50),
@Min_Duration int,
@Max_Duration int

as


INSERT INTO [dbo].[T_Surgery_Name]
           ([Fullname]
           ,[Min_Duration],
		   [Max_Duration])
     VALUES
           (@Fullname,@Min_Duration,@Max_Duration)
GO
/****** Object:  StoredProcedure [dbo].[sp_surgery_name_select]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_surgery_name_select]
as



SELECT [ID]
      ,[Fullname]
      ,[Min_Duration]
      ,[Max_Duration]
  FROM [dbo].[T_Surgery_Name]

GO
/****** Object:  StoredProcedure [dbo].[sp_surgery_name_update]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_surgery_name_update]
@ID int,
@Fullname nvarchar(50),
@Min_Duration int,
@Max_Duration int

as

UPDATE [dbo].[T_Surgery_Name]
   SET [Fullname] = @Fullname
      ,[Min_Duration] = @Min_Duration,
	  [Max_Duration]= @Max_Duration
 WHERE ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_surgery_room_insert]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_surgery_room_insert]

@Fullname nvarchar(50),
@Busy		bit
as


INSERT INTO [dbo].[T_Surgery_Room]
           ([Fullname]
           ,[Busy])
     VALUES
           (@Fullname,@Busy)
GO
/****** Object:  StoredProcedure [dbo].[sp_surgery_room_select]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_surgery_room_select]

as



SELECT [ID]
      ,[Fullname]
      ,[Busy]
  FROM [dbo].[T_Surgery_Room]

GO
/****** Object:  StoredProcedure [dbo].[sp_surgery_room_update]    Script Date: 18/09/2022 13:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_surgery_room_update]
@ID int,
@Fullname nvarchar(50),
@Busy		bit


as



UPDATE [dbo].[T_Surgery_Room]
   SET [Fullname] = @Fullname
      ,[Busy] = @Busy
 WHERE Id=@ID
GO
USE [master]
GO
ALTER DATABASE [Scheduling_Surgeries_DB] SET  READ_WRITE 
GO
