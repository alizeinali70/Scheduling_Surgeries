USE [master]
GO
/****** Object:  Database [Scheduling_Surgeries_DB]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  Table [dbo].[T_Do_Surgery]    Script Date: 17/08/2022 23:03:16 ******/
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
	[P_ID] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NOT NULL,
	[Start_Time] [nvarchar](50) NOT NULL,
	[End_Time] [nvarchar](50) NOT NULL,
	[Emergency] [bit] NULL,
 CONSTRAINT [PK_T_Do_Surgery] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Doctor]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  Table [dbo].[T_Nurse]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  Table [dbo].[T_Patient]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  Table [dbo].[T_Surgery_Name]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  Table [dbo].[T_Surgery_Room]    Script Date: 17/08/2022 23:03:16 ******/
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
SET IDENTITY_INSERT [dbo].[T_Doctor] ON 

INSERT [dbo].[T_Doctor] ([ID], [Fullname], [Specialist], [Busy]) VALUES (1, N'Doctor1', N'Heart', 0)
SET IDENTITY_INSERT [dbo].[T_Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Nurse] ON 

INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (1, N'Nurse1', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (2, N'Nurse2', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (3, N'Nurse3', 0)
INSERT [dbo].[T_Nurse] ([ID], [Fullname], [Busy]) VALUES (4, N'Nurse4', 0)
SET IDENTITY_INSERT [dbo].[T_Nurse] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Patient] ON 

INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (1, N'Patient1', N'Open Heart')
INSERT [dbo].[T_Patient] ([ID], [Fullname], [Type_Of_Surgery]) VALUES (2, N'Patient2', N'Close Heart')
SET IDENTITY_INSERT [dbo].[T_Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Surgery_Name] ON 

INSERT [dbo].[T_Surgery_Name] ([ID], [Fullname], [Min_Duration], [Max_Duration]) VALUES (1, N'Open Heart', 13, 121)
INSERT [dbo].[T_Surgery_Name] ([ID], [Fullname], [Min_Duration], [Max_Duration]) VALUES (2, N'Close Heart', 21, 60)
SET IDENTITY_INSERT [dbo].[T_Surgery_Name] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Surgery_Room] ON 

INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (1, N'Surgery Room1', 0)
INSERT [dbo].[T_Surgery_Room] ([ID], [Fullname], [Busy]) VALUES (2, N'Surgery Room2', 0)
SET IDENTITY_INSERT [dbo].[T_Surgery_Room] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_do_surgery_insert]    Script Date: 17/08/2022 23:03:16 ******/
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
,@Date		   nvarchar(50)
,@Start_Time   nvarchar(50)
,@End_Time	   nvarchar(50)
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
/****** Object:  StoredProcedure [dbo].[sp_do_surgery_select]    Script Date: 17/08/2022 23:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_do_surgery_select]

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

GO
/****** Object:  StoredProcedure [dbo].[sp_do_surgery_update]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_doctor_insert]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_doctor_select]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_doctor_update]    Script Date: 17/08/2022 23:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[sp_doctor_update]
@ID int,
@Fullname nvarchar(50),
@Specialist nvarchar(50),
@Busy bit

as



UPDATE [dbo].[T_Doctor]
   SET [Fullname] = @Fullname
      ,[Specialist] = @Specialist
      ,[Busy] = @Busy
 WHERE ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_nurse_insert]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_nurse_select]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_nurse_update]    Script Date: 17/08/2022 23:03:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[sp_nurse_update]
@ID int,
@Fullname nvarchar(50),
@Busy bit
as


UPDATE [dbo].[T_Nurse]
   SET [Fullname] = @Fullname,
   [Busy]=@Busy
 WHERE ID=@ID
GO
/****** Object:  StoredProcedure [dbo].[sp_patient_insert]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_patient_select]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_patient_update]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_surgery_name_insert]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_surgery_name_select]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_surgery_name_update]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_surgery_room_insert]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_surgery_room_select]    Script Date: 17/08/2022 23:03:16 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_surgery_room_update]    Script Date: 17/08/2022 23:03:16 ******/
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
