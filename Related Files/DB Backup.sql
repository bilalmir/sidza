USE [master]
GO
/****** Object:  Database [elearning]    Script Date: 4/5/2020 7:44:06 PM ******/
CREATE DATABASE [elearning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'elearning', FILENAME = N'E:\MSSQL.MSSQLSERVER\DATA\elearning.mdf' , SIZE = 5120KB , MAXSIZE = 204800KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'elearning_log', FILENAME = N'D:\MSSQL.MSSQLSERVER\DATA\elearning_log.ldf' , SIZE = 1024KB , MAXSIZE = 102400KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [elearning] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [elearning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [elearning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [elearning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [elearning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [elearning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [elearning] SET ARITHABORT OFF 
GO
ALTER DATABASE [elearning] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [elearning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [elearning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [elearning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [elearning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [elearning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [elearning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [elearning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [elearning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [elearning] SET  ENABLE_BROKER 
GO
ALTER DATABASE [elearning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [elearning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [elearning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [elearning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [elearning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [elearning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [elearning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [elearning] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [elearning] SET  MULTI_USER 
GO
ALTER DATABASE [elearning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [elearning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [elearning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [elearning] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [elearning] SET DELAYED_DURABILITY = DISABLED 
GO
USE [elearning]
GO
/****** Object:  User [adminsidza]    Script Date: 4/5/2020 7:44:11 PM ******/
CREATE USER [adminsidza] FOR LOGIN [adminsidza] WITH DEFAULT_SCHEMA=[adminsidza]
GO
/****** Object:  DatabaseRole [gd_execprocs]    Script Date: 4/5/2020 7:44:12 PM ******/
CREATE ROLE [gd_execprocs]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [adminsidza]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [adminsidza]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [adminsidza]
GO
ALTER ROLE [db_datareader] ADD MEMBER [adminsidza]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [adminsidza]
GO
/****** Object:  Schema [adminsidza]    Script Date: 4/5/2020 7:44:14 PM ******/
CREATE SCHEMA [adminsidza]
GO
/****** Object:  Table [dbo].[answer]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer](
	[answerid] [int] IDENTITY(1,1) NOT NULL,
	[answer] [nvarchar](max) NULL,
	[questionid] [int] NULL,
	[paperid] [int] NULL,
	[userid] [int] NULL,
	[marks] [int] NULL,
 CONSTRAINT [PK_answer] PRIMARY KEY CLUSTERED 
(
	[answerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[articlenews]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[articlenews](
	[typeid] [int] IDENTITY(2,1) NOT NULL,
	[type] [varchar](max) NULL,
 CONSTRAINT [PK_article] PRIMARY KEY CLUSTERED 
(
	[typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssignAssignment]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssignAssignment](
	[assignmentid] [int] IDENTITY(1,1) NOT NULL,
	[teachername] [varchar](50) NULL,
	[classid] [int] NULL,
	[subjectid] [int] NULL,
	[assignmentname] [varchar](max) NULL,
 CONSTRAINT [PK_AssignAssignment] PRIMARY KEY CLUSTERED 
(
	[assignmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[attendance]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[attendance](
	[attendanceid] [int] IDENTITY(1,1) NOT NULL,
	[paperid] [int] NULL,
	[name] [varchar](50) NULL,
	[userid] [int] NULL,
 CONSTRAINT [PK_attendance] PRIMARY KEY CLUSTERED 
(
	[attendanceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](20) NULL,
	[Message] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notification]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[notification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[filepath] [varchar](max) NULL,
	[date] [datetime] NULL,
	[filename] [varchar](max) NULL,
	[duration] [int] NULL,
	[status] [varchar](50) NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_notification] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objectiveanswers]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[objectiveanswers](
	[answerid] [int] IDENTITY(1,1) NOT NULL,
	[answer] [varchar](max) NULL,
	[questionid] [int] NULL,
	[paperid] [int] NULL,
	[userid] [int] NULL,
	[marks] [int] NULL,
	[marksobtained] [int] NULL,
	[answerkey] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objectiveattendance]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[objectiveattendance](
	[attendanceid] [int] IDENTITY(1,1) NOT NULL,
	[paperid] [int] NULL,
	[name] [varchar](50) NULL,
	[userid] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objectivepaperinformation]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[objectivepaperinformation](
	[paperid] [int] IDENTITY(1,1) NOT NULL,
	[classname] [varchar](50) NULL,
	[subjectname] [varchar](max) NULL,
	[papertime] [int] NULL,
	[papermarks] [int] NULL,
	[passmarks] [int] NULL,
	[chaptername] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objectivequestioninformation]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[objectivequestioninformation](
	[questionid] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](max) NULL,
	[answer1] [nvarchar](max) NULL,
	[answer2] [nvarchar](max) NULL,
	[answer3] [nvarchar](max) NULL,
	[answer4] [nvarchar](max) NULL,
	[paperid] [int] NULL,
	[quesno] [nvarchar](50) NULL,
	[answerkey] [nvarchar](max) NULL,
	[marksstatus] [int] NULL,
	[marks] [int] NULL,
	[image] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objectiveresult]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[objectiveresult](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[classname] [varchar](50) NULL,
	[subjectname] [varchar](50) NULL,
	[Totalmarks] [int] NULL,
	[percentage] [float] NULL,
	[result] [nchar](10) NULL,
	[paperid] [int] NULL,
	[remark] [bit] NULL,
	[remark1] [bit] NULL,
	[chaptername] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pagenames]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pagenames](
	[pageid] [int] IDENTITY(1,1) NOT NULL,
	[pagename] [varchar](50) NULL,
 CONSTRAINT [PK_pagenames] PRIMARY KEY CLUSTERED 
(
	[pageid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pagenumber]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagenumber](
	[roleid] [int] NULL,
	[pageid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[paperinformation]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paperinformation](
	[paperid] [int] IDENTITY(1,1) NOT NULL,
	[classname] [varchar](50) NULL,
	[subbjectname] [varchar](50) NULL,
	[papertime] [int] NULL,
	[papermarks] [int] NULL,
	[passmarks] [int] NULL,
 CONSTRAINT [PK_paperinformation] PRIMARY KEY CLUSTERED 
(
	[paperid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[questoninformation]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[questoninformation](
	[questionid] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](max) NULL,
	[answer] [varchar](max) NULL,
	[paperid] [int] NULL,
	[quesno] [varchar](50) NULL,
	[marks] [int] NULL,
	[marksstatus] [int] NULL,
 CONSTRAINT [PK_questoninformation] PRIMARY KEY CLUSTERED 
(
	[questionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[result]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[result](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[classname] [varchar](50) NULL,
	[subjectname] [varchar](50) NULL,
	[marksobtained] [int] NULL,
	[result] [nvarchar](50) NULL,
	[remark] [bit] NULL,
	[paperid] [int] NOT NULL,
	[remark1] [bit] NULL,
 CONSTRAINT [PK_result] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[role]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleid] [int] NOT NULL,
	[rolename] [nvarchar](50) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubmitAssignment]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubmitAssignment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[assignmentname] [varchar](max) NULL,
	[filename] [varchar](50) NULL,
	[classid] [int] NULL,
	[subjectid] [int] NULL,
	[assignmentid] [int] NULL,
	[remark] [bit] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_SubmitAssignment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblarticle]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblarticle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeid] [int] NOT NULL,
	[title] [varchar](max) NOT NULL,
	[filesize] [int] NOT NULL,
	[filename] [varchar](max) NOT NULL,
	[linkexpiry] [date] NOT NULL,
	[status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tblarticle2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblclass]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblclass](
	[classid] [int] IDENTITY(1,1) NOT NULL,
	[classname] [varchar](50) NULL,
 CONSTRAINT [PK_tblclass] PRIMARY KEY CLUSTERED 
(
	[classid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblcomunication_teach_stu]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblcomunication_teach_stu](
	[studentid] [int] IDENTITY(1,1) NOT NULL,
	[studentname] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[contact] [bigint] NOT NULL,
	[teachermessage] [varchar](max) NULL,
	[studentmessage] [varchar](max) NULL,
	[teacheremail] [varchar](100) NOT NULL,
	[grade] [varchar](50) NOT NULL,
	[emailflag] [bit] NOT NULL,
 CONSTRAINT [PK_tblcomunication_teach_stu] PRIMARY KEY CLUSTERED 
(
	[studentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbllesson]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbllesson](
	[lessonid] [int] IDENTITY(1,1) NOT NULL,
	[lessonname] [varchar](max) NULL,
	[subjectid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[lessonid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblmaterial]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblmaterial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeid] [int] NULL,
	[subjectid] [int] NULL,
	[lessonid] [int] NULL,
	[classid] [int] NULL,
	[filesize] [int] NULL,
	[filename] [varchar](max) NULL,
 CONSTRAINT [PK_tblmaterial1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblmaterial2]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblmaterial2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeid] [int] NULL,
	[subjectid] [int] NULL,
	[filesize] [int] NULL,
	[filename] [varchar](max) NULL,
 CONSTRAINT [PK_tblmaterial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblquestionSyllabus]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblquestionSyllabus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeid] [int] NULL,
	[subjectid] [int] NULL,
	[classid] [int] NULL,
	[filesize] [int] NULL,
	[filename] [varchar](max) NULL,
 CONSTRAINT [PK_tblquestionpapers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblscheduleclass]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblscheduleclass](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teacheremail] [varchar](100) NOT NULL,
	[studentemail] [varchar](100) NOT NULL,
	[subject] [varchar](100) NOT NULL,
	[topic] [varchar](max) NOT NULL,
	[grade] [varchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[timefrom] [varchar](50) NOT NULL,
	[timeto] [varchar](50) NOT NULL,
	[sessionlink] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblscheduleclass] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblsubject]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblsubject](
	[subjectid] [int] IDENTITY(1,1) NOT NULL,
	[subjectname] [varchar](max) NULL,
	[classid] [int] NULL,
 CONSTRAINT [PK_tblsubject1] PRIMARY KEY CLUSTERED 
(
	[subjectid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblsubject2]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblsubject2](
	[subjectid] [int] IDENTITY(1,1) NOT NULL,
	[subjectname] [varchar](50) NULL,
	[classid] [int] NULL,
	[userid] [int] NULL,
 CONSTRAINT [PK_tblsubject] PRIMARY KEY CLUSTERED 
(
	[subjectid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbltitle]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbltitle](
	[titleid] [int] IDENTITY(1,1) NOT NULL,
	[titlename] [varchar](max) NULL,
	[lessonid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[titleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbltutorsubject]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbltutorsubject](
	[t_subjectid] [int] IDENTITY(1,1) NOT NULL,
	[t_subjectname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbltutorsubject] PRIMARY KEY CLUSTERED 
(
	[t_subjectid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbltype]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbltype](
	[typeid] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_tbltype1] PRIMARY KEY CLUSTERED 
(
	[typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbltype2]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbltype2](
	[typeid] [int] IDENTITY(2,1) NOT NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_tbltype] PRIMARY KEY CLUSTERED 
(
	[typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblvideomaterial]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblvideomaterial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeid] [int] NULL,
	[subjectid] [int] NOT NULL,
	[lessonid] [int] NOT NULL,
	[classid] [int] NOT NULL,
	[filename] [varchar](max) NOT NULL,
	[title] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tblvideomaterial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[contact] [bigint] NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleid] [int] NOT NULL,
	[limit] [int] NOT NULL,
	[lock] [int] NULL,
	[random] [int] NULL,
	[duration] [int] NULL,
	[currenttime] [datetime] NULL,
	[classid] [int] NULL,
	[board] [varchar](30) NULL,
	[profileimage] [varchar](max) NULL,
	[teacherSubject] [varchar](30) NULL,
	[qualification1] [nvarchar](50) NULL,
	[qualification2] [nvarchar](50) NULL,
	[qualification3] [nvarchar](50) NULL,
	[address] [varchar](max) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user3]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user3](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NOT NULL,
	[contact] [bigint] NULL,
	[qualification] [nvarchar](50) NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleid] [int] NOT NULL,
	[limit] [int] NOT NULL,
	[lock] [int] NULL,
	[random] [int] NULL,
	[duration] [int] NULL,
	[currenttime] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[verification]    Script Date: 4/5/2020 7:44:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[verification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[documents] [nvarchar](50) NULL,
	[isvalid] [bit] NOT NULL,
	[userid] [int] NOT NULL,
	[subjectid] [int] NULL,
 CONSTRAINT [PK_verification] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[articlenews] ON 

INSERT [dbo].[articlenews] ([typeid], [type]) VALUES (2, N'NEWS')
INSERT [dbo].[articlenews] ([typeid], [type]) VALUES (3, N'ARTICLE')
SET IDENTITY_INSERT [dbo].[articlenews] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [Name], [Email], [Contact], [Message]) VALUES (1, N'Bilal Ahmad Mir', N'bhatjavid@gmail.com', N'9907712347', N'Hello I am happy to have this type of website where I can learn any subject.')
INSERT [dbo].[Feedback] ([FeedbackID], [Name], [Email], [Contact], [Message]) VALUES (4, N'BILAL AHMAD', N'bilalkhaja15@gmail.com', N'9086909262', N'hi ')
INSERT [dbo].[Feedback] ([FeedbackID], [Name], [Email], [Contact], [Message]) VALUES (5, N'BILAL AHMAD', N'chemicalbilal@rediffmail.com', N'+919086909262', N'hi i want to know ..........')
INSERT [dbo].[Feedback] ([FeedbackID], [Name], [Email], [Contact], [Message]) VALUES (6, N'sofi yasir', N'sofiyasir909 @gmail.com', N'8082457731', N'')
INSERT [dbo].[Feedback] ([FeedbackID], [Name], [Email], [Contact], [Message]) VALUES (7, N'Kathy Albert', N'kathylbrt02@gmail.com', N'206-309-5272', N'Hi
We can help your website to get on first page of Google and increase the number of leads and sales you are getting from your website. Please email us back for full proposal.

Best Regards
Kathy')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[objectiveanswers] ON 

INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (408, N'Glass', 1, 2, 17, 1, 1, N'Glass')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (409, N'solids are always crystalline in nature', 2, 2, 17, 1, 1, N'solids are always crystalline in nature')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (410, N'Glass ', 3, 2, 17, 1, 0, N'Glass')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (411, N'Glass ', 5, 2, 17, 1, 0, N'W')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (412, N'LiF', 6, 2, 17, 1, 1, N'LiF')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (413, N'2 and 4 are correct', 7, 2, 17, 1, 1, N'2 and 4 are correct')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (414, N'Super cooled liquid', 8, 2, 17, 1, 1, N'Super cooled liquid')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1261, N'Generates energy', 182, 16, 87, 1, 0, N'Synthesis proteins              ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1262, N'Leaf', 183, 16, 87, 1, 0, N'Root')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1263, N'The activities of the cell will not be controlled', 180, 16, 87, 1, 1, N'The activities of the cell will not be controlled')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1264, N'', 66, 7, 2, 1, 0, N'0.1')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1265, N'16/3.0 x `10^23`', 116, 10, 2, 1, 0, N'6.022 x `10^23`')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1266, N'0.5 M', 117, 10, 2, 1, 1, N'0.5 M')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1267, N'One litre of the solvent', 118, 10, 2, 1, 0, N'1000 g of the solvent ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1274, N'Photosynthesis', 206, 12, 2, 1, 0, N'Respiration')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1275, N'Plasmodium   ', 207, 12, 2, 1, 1, N'Plasmodium   ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (415, N'Body centered cubic', 9, 2, 17, 1, 1, N'Body centered cubic')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (416, N'Body centered cubic', 10, 2, 17, 1, 0, N'4')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (417, N'', 11, 2, 17, 1, 0, N'6')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (418, N'', 12, 2, 17, 1, 0, N'6')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (419, N'', 13, 2, 17, 1, 0, N'12')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (420, N'', 14, 2, 17, 1, 0, N'6')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (421, N'2:1', 15, 2, 17, 1, 0, N'1:2')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (422, N'2:1', 16, 2, 17, 1, 0, N'4')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (423, N'6', 17, 2, 17, 1, 0, N'12')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (424, N'6', 18, 2, 17, 1, 0, N'CsI')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1276, N'Glass', 1, 2, 2, 1, 1, N'Glass')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1277, N'solids are always crystalline in nature', 2, 2, 2, 1, 1, N'solids are always crystalline in nature')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1278, N'NaCl', 3, 2, 2, 1, 0, N'Glass')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1279, N'Si', 5, 2, 2, 1, 0, N'W')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1280, N'LiF', 6, 2, 2, 1, 1, N'LiF')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1065, N'1.06 Å ', 129, 13, 2, 1, 0, N'2.12 Å ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1066, N'5p < 4f < 6s <5d', 130, 13, 2, 1, 0, N'5p < 6s < 4f <5d ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1067, N'`F^-`,O', 131, 13, 2, 1, 0, N'`F^-`, `O^2-` ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1076, N'Glass', 1, 2, 10, 1, 1, N'Glass')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1077, N'Solids have high  density and low compressibility', 2, 2, 10, 1, 0, N'solids are always crystalline in nature')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1078, N'CaF2	', 3, 2, 10, 1, 0, N'Glass')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1079, N'AgCl', 5, 2, 10, 1, 0, N'W')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1080, N'Silicone', 6, 2, 10, 1, 0, N'LiF')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1081, N'2 and 4 are correct', 7, 2, 10, 1, 1, N'2 and 4 are correct')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1082, N'Substance with definite melting point', 8, 2, 10, 1, 0, N'Super cooled liquid')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1281, N'2 and 3 are correct', 7, 2, 2, 1, 0, N'2 and 4 are correct')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1282, N'Liquid in real sense', 8, 2, 2, 1, 0, N'Super cooled liquid')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1283, N'Body centered cubic', 9, 2, 2, 1, 1, N'Body centered cubic')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1284, N'4', 10, 2, 2, 1, 1, N'4')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1106, N'H', 142, 14, 62, 1, 0, N'Li')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1107, N'', 140, 14, 62, 1, 0, N'Cs < Rb < Na ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1108, N'Electronegativity', 136, 14, 62, 1, 1, N'Electronegativity')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1109, N'Sixteen', 139, 14, 62, 1, 1, N'Sixteen')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1110, N'F > Cl', 143, 14, 62, 1, 0, N'F > l ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1111, N'`Fe^3+`', 144, 14, 62, 1, 0, N'`Co^3+`')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1112, N'`Na^+`', 141, 14, 62, 1, 0, N'`Si^4+` ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1113, N's– block ', 137, 14, 62, 1, 1, N's– block ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1117, N'Chloroplast', 208, 12, 2, 1, 1, N'Chloroplast')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1118, N'CaF2', 1, 2, 75, 1, 0, N'Glass')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1119, N'Solids have definite volume', 2, 2, 75, 1, 0, N'solids are always crystalline in nature')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1120, N'CaF2	', 3, 2, 75, 1, 0, N'Glass')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1121, N'AgCl', 5, 2, 75, 1, 0, N'W')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1122, N'LiF', 6, 2, 75, 1, 1, N'LiF')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1123, N'', 7, 2, 75, 1, 0, N'2 and 4 are correct')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (928, N'Plasmodium   ', 225, 26, 2, 1, 0, N'Plasmodium')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (929, N'Ovules', 226, 26, 2, 1, 0, N'Pollen grains')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (930, N'Sexual reproduction involves the fusion of two dissimilar reproductive cells.', 227, 26, 2, 1, 0, N'The offspring represents the characteristics of only one parent')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (931, N'Binary fission in amoeba', 228, 26, 2, 1, 0, N'Reproduction in earthworms ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (932, N'Uterus wall', 229, 26, 2, 1, 0, N'Placenta ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (933, N'Fallopian tube', 230, 26, 2, 1, 1, N'Fallopian tube')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (944, N'Lamarck    ', 243, 27, 2, 1, 1, N'Lamarck    ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (945, N'August Weisman', 244, 27, 2, 1, 1, N'August Weisman')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (946, N'Organisms with unfavourable characters are selected by nature', 245, 27, 2, 1, 0, N'Organisms with favourable characters are selected by nature')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (947, N'Natural selection', 246, 27, 2, 1, 1, N'Natural selection')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (938, N'', 237, 27, 2, 1, 0, N'Genetics')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (939, N'Part of a chromosome that transmits a trait', 238, 27, 2, 1, 1, N'Part of a chromosome that transmits a trait')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (940, N'The act of special creation that brought all the organisms into this world.', 239, 27, 2, 1, 0, N'Formation of more and more complex organisms from simpler ones through gradual changes.')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (941, N'a bird.', 240, 27, 2, 1, 0, N'an invertebrate')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (942, N'Charles Darwin', 241, 27, 2, 1, 0, N'Gregor Mendel')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (943, N'Struggle for existence', 242, 27, 2, 1, 0, N'Philosophic Zoologique')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1254, N'1.25', 265, 4, 2, 1, 1, N'1.25')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1255, N'2 and 3', 268, 4, 2, 1, 0, N'3 and 4')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1256, N'100% ionisation of electrolyte at normal dilution.', 258, 4, 2, 1, 0, N'Increase in ionic mobility of ions.')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1257, N'may increases or decrease depending upon cell reaction.', 271, 4, 2, 1, 0, N'drops to zero')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1258, N'Decreases', 264, 4, 2, 1, 1, N'Decreases')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1259, N'+4', 270, 4, 2, 1, 0, N'+3')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1260, N'BeCl2', 266, 4, 2, 1, 0, N'SrCl2')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1204, N'6.022 x `10^21` molecules of CO2', 119, 10, 2, 1, 0, N'22.4 L of CO¬¬2 at N.T.P.')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1205, N'2.24 litres ', 120, 10, 2, 1, 1, N'2.24 litres ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1206, N'Na2SO4.5H2O', 121, 10, 2, 1, 0, N'Na2SO4.10H2O ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1207, N'3.0 x `10^-23`  `cm^3`', 122, 10, 2, 1, 1, N'3.0 x `10^-23`  `cm^3`')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1208, N'48 g of O3', 123, 10, 2, 1, 0, N'8 g of H2 ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (750, N'Xylem', 194, 22, 2, 1, 0, N'All of the above                 ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (751, N'Epithelial', 195, 22, 2, 1, 0, N'Connective ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1273, N'Food pipe ', 115, 12, 2, 1, 0, N'c')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1285, N'`Cl^-` and Ar ', 126, 13, 2, 1, 1, N'`Cl^-` and Ar ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1286, N'Excited state of fluorine', 127, 13, 2, 1, 0, N'Excited state of neon ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1287, N'p', 128, 13, 2, 1, 1, N'p')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (546, N'Just more than 125 ml', 90, 7, 10, 1, 0, N'Close to 125 ml')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (547, N'0.15 N', 74, 7, 10, 1, 0, N'0.175 N')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (548, N'0.46 N', 73, 7, 10, 1, 0, N'4.6 N')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (549, N'120', 96, 7, 10, 1, 0, N'178.2')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (550, N'0.02 M', 76, 7, 10, 1, 0, N'0.2 M')
GO
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (551, N'0.1 Molal', 71, 7, 10, 1, 1, N'0.1 Molal')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (552, N'Acetone-chloroform', 94, 7, 10, 1, 0, N'Benzene-methanol')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (553, N'0.7', 66, 7, 10, 1, 0, N'0.1')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (554, N'1/3', 75, 7, 10, 1, 0, N'1/6')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (555, N'0.83 N', 67, 7, 10, 1, 0, N'1.7 N')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (556, N'0.30', 97, 7, 10, 1, 0, N'0.015')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (557, N'25 ml of 0.2 M solution', 78, 7, 10, 1, 0, N'25 ml of 0.1 M solution ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (558, N'Number of particles present in the solution', 79, 7, 10, 1, 1, N'Number of particles present in the solution')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1057, N'Malaria.', 201, 24, 2, 1, 0, N'Jaundice.')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1058, N'Tuberculosis ', 202, 24, 2, 1, 1, N'Tuberculosis ')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1059, N'Streptomycin', 203, 24, 2, 1, 0, N'Penicillin')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1060, N'Increase in body weight and tiredness', 204, 24, 2, 1, 1, N'Increase in body weight and tiredness')
INSERT [dbo].[objectiveanswers] ([answerid], [answer], [questionid], [paperid], [userid], [marks], [marksobtained], [answerkey]) VALUES (1061, N'Antibiotics', 205, 24, 2, 1, 0, N'Antibodies')
SET IDENTITY_INSERT [dbo].[objectiveanswers] OFF
SET IDENTITY_INSERT [dbo].[objectiveattendance] ON 

INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (7, 6, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (4, 2, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (5, 4, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (6, 2, N'Umer', 10)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (8, 7, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (9, 9, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (10, 9, N'Umer', 10)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (11, 2, N'USAMA BUBERE', 11)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (12, 12, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (13, 7, N'Umer', 10)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (14, 2, N'Ananya R', 17)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (15, 10, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (16, 13, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (17, 14, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (18, 5, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (20, 26, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (21, 25, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (22, 27, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (23, 24, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (30, 10, N'Umer', 10)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (31, 10, N'shabir ahmad', 59)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (33, 14, N'Kaiser lone', 62)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (34, 2, N'Adibdar', 75)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (35, 7, N'Faaiza', 82)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (36, 16, N'parisa', 87)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (19, 16, N'bilal ahmad', 2)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (24, 16, N'Umer', 10)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (32, 10, N'Kaiser lone', 62)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (25, 22, N'Umer', 10)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (26, 12, N'Umer', 10)
INSERT [dbo].[objectiveattendance] ([attendanceid], [paperid], [name], [userid]) VALUES (27, 26, N'Umer', 10)
SET IDENTITY_INSERT [dbo].[objectiveattendance] OFF
SET IDENTITY_INSERT [dbo].[objectivepaperinformation] ON 

INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (2, N'12th', N'Chemistry', NULL, 80, 40, N'Solid State')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (4, N'12th', N'Chemistry', NULL, 100, 40, N'Electrochemistry')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (5, N'12th', N'Chemistry', NULL, NULL, NULL, N'Haloalkanes and Haloarenes')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (6, N'11th', N'Chemistry', NULL, NULL, NULL, N'Hydrocarbons')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (7, N'12th', N'Chemistry', NULL, NULL, NULL, N'Solutions')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (10, N'11th', N'Chemistry', NULL, NULL, NULL, N'Some Basic concepts in Chemistry')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (11, N'12th', N'Chemistry', NULL, NULL, NULL, N'Chemical Kinetics')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (12, N'10th', N'Science', NULL, NULL, NULL, N'Life processes')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (13, N'11th', N'Chemistry', NULL, NULL, NULL, N'Atomic Structure')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (14, N'11th', N'Chemistry', NULL, NULL, NULL, N'Classification of Elements and Periodicity in Properties')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (16, N'9th', N'Science', NULL, NULL, NULL, N'Cell - Basic Unit of life')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (19, N'11th', N'Chemistry', NULL, NULL, NULL, N'States of Matter : gases and liquids')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (20, N'9th', N'Science', NULL, NULL, NULL, N'Motion')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (22, N'9th', N'Science', NULL, NULL, NULL, N'Tissues, Organs, Organ System, Organism')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (23, N'10th', N'Science', NULL, NULL, NULL, N'Natural Phenomena: Reflection & Refraction of light')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (24, N'9th', N'Science', NULL, NULL, NULL, N'Health and Diseases')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (25, N'10th', N'Science', NULL, NULL, NULL, N'Control and co-ordination in animals and plants')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (26, N'10th', N'Science', NULL, NULL, NULL, N'Reproduction')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (27, N'10th', N'Science', NULL, NULL, NULL, N'Heredity and Evolution')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (30, N'@classname ', N'@subjectname', NULL, NULL, NULL, N'@chaptername')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (35, N'10th', N'Science', NULL, NULL, NULL, N'Our environment')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (37, N'12th', N'Chemistry', NULL, NULL, NULL, N'Aldehydes, ketones, carboxylic acids')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (39, N'12th', N'Chemistry', NULL, NULL, NULL, N'Chemistry in Everyday Life')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (40, N'JEE MAIN', N'chemistry', NULL, NULL, NULL, N'Haloalkanes and Haloarenes')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (9, N'12th', N'Chemistry', NULL, NULL, NULL, N'Surface Chemistry')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (17, N'9th', N'Science', NULL, NULL, NULL, N'Matter-Nature and Behaviour')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (18, N'10th', N'Science', NULL, NULL, NULL, N'Acids, bases and salts')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (36, N'10th', N'Science', NULL, NULL, NULL, N'Management of natural resources')
INSERT [dbo].[objectivepaperinformation] ([paperid], [classname], [subjectname], [papertime], [papermarks], [passmarks], [chaptername]) VALUES (38, N'12th', N'Chemistry', NULL, NULL, NULL, N'Polymers')
SET IDENTITY_INSERT [dbo].[objectivepaperinformation] OFF
SET IDENTITY_INSERT [dbo].[objectivequestioninformation] ON 

INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (1, N'Which of the following is a pseudo solid ', N'CaF2', N'Glass', N' NaCl', N'All of these', 2, N'Q', N'Glass', 1, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (2, N'Which is not property of solids', N'solids are always crystalline in nature', N'Solids have high  density and low compressibility', N'The diffusion of solids is very low', N'Solids have definite volume', 2, N'Q', N'solids are always crystalline in nature', 2, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (3, N'Which of the following is non-crystalline solid', N' CsCI ', N'NaCl', N'CaF2	', N'Glass ', 2, N'Q', N'Glass', 3, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (5, N'Which of the following is an example of metallic crystal solid', N'C', N'Si', N'W', N'AgCl', 2, N'Q', N'W', 5, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (6, N'Which of the following is an example of ionic crystal solid', N'Diamond', N'LiF', N'Li', N'Silicone', 2, N'Q', N'LiF', 6, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (7, N'Amorphous substances show    (1)	Short and long range order       (2)	Short range order   (3)	Long range order     (4)	Have no sharp M.P.', N'1 and 3 are correct', N'2 and 3 are correct', N'3 and 4 are correct', N'2 and 4 are correct', 2, N'Q', N'2 and 4 are correct', 7, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (8, N'Amorphous solids are', N'Solid substance in real sense', N'Liquid in real sense', N'Super cooled liquid', N'Substance with definite melting point', 2, N'Q', N'Super cooled liquid', 8, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (9, N'If the number of atoms per unit in a crystal is 2, the structure of crystal is', N'Octahedral ', N'Body centered cubic', N'Face centered cubic', N'Simple cubic', 2, N'Q', N'Body centered cubic', 9, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (10, N'If the coordination number of Ca3+ in CaF2 is 8, then the coordination number of F- ion would be', N'3', N'4', N'6', N'8', 2, N'Q', N'4', 10, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (11, N'How many chloride ions are there around sodium ion in sodium chloride crystal', N'3', N'8', N'4', N'6', 2, N'Q', N'6', 11, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (12, N'The structure of MgO is similar to NaCl. What would be the coordination number of magnesium?', N'2', N'4', N'6', N'8', 2, N'Q', N'6', 12, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (13, N'The coordination number of a metal crystallizing in a hexagonal close packed structure is', N'4', N'12', N'8', N'6', 2, N'Q', N'12', 13, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (14, N'In NaCl lattice the coordination number of Cl- ion is', N'2', N'4', N'6', N'8', 2, N'Q', N'6', 14, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (15, N'The ratio of close-packed atoms to tetrahedral holes in cubic close packing is', N'1:1', N'1:2', N'1:3', N'2:1', 2, N'Q', N'1:2', 15, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (16, N'The number of octahedral voids in a unit cell of cubical closest packed structure is', N'1', N'2', N'4', N'8', 2, N'Q', N'4', 16, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (17, N'In FCC lattice, the neighboring number of ions for any lattice point is', N'6', N'8', N'12', N'14', 2, N'Q', N'12', 17, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (18, N'In the crystals, which of the following ionic compounds would you expect maximum distance between centres of cations and anions', N'LiF', N'CsF', N'CsI', N'LiI', 2, N'Q', N'CsI', 18, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (33, N'Which of the following is not the Huckel Number?', N'6', N'2', N'8', N'14', 6, N'Q', N'8', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (34, N'Mark out the anti-aromatic species', N'a', N'b', N'c', N'd', 6, N'Q', N'a', NULL, 1, N'/Upload/QuestionPapers/image.PNG')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (66, N'If 0.50 mole of BaCl2 is mixed with 0.20 mole of Na3PO4, the maximum number of moles of Ba3(PO4)2 that can be formed is ', N'0.1', N'0.2', N'0.5', N'0.7', 7, N'Q', N'0.1', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (67, N'The normality of 10% (weight/volume) acetic acid is', N'1N', N'10 N', N'1.7 N', N'0.83 N', 7, N'Q', N'1.7 N', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (68, N'30 ml of solution is neutralized by 15ml of 0.2 N base. The strength of the acid solution is ', N'0.1 N', N'0.15 N', N'0.3 N', N'0.4 N', 7, N'Q', N'0.1 N', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (69, N'The formula weight of H2SO4 is 98. The weight of the acid in 400 ml of 0.1 M solution is', N'2.45 g', N'3.92 g', N'4.90 g', N'9.8 g', 7, N'Q', N'3.92 g', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (70, N'10 ml of 3N-HCL, 20 ml of N/2 H2SO4 and 30 ml of N/3 HNO3 are mixed together and volume made to one litre. The normality of the resulting solution is ', N'N/2', N'N/10', N'N/20', N'N/40', 7, N'Q', N'N/20', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (71, N'To 5.85 g of NaCl, one kg of water is added to prepare a solution. What is the strength of NaCl in this solution? (Molecular weight of NaCl = 58.5)', N'0.1 Normal', N'0.1 Molal', N'0.1 Molar', N'0.1 Formal', 7, N'Q', N'0.1 Molal', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (72, N'What is the normality of a 1 M solution of H3PO4?', N'0.5 N', N'1.0 N', N'2.0 N', N'3.0 N', 7, N'Q', N'3.0 N', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (73, N'The normality of a 2.3 M sulphuric acid solution is ', N'0.46 N', N'0.23 N', N'2.3 N', N'4.6 N', 7, N'Q', N'4.6 N', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (74, N'50ml of 0.2N HCl, 50 ml of 0.1N H2SO4 and 100 ml 0.2N HNO3 are mixed. The normality of resulting solution is', N'0.10 N', N'0.15 N', N'0.175 N', N'0.20 N', 7, N'Q', N'0.175 N', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (75, N'In a solution of 7.8 g of benzene (C6H6) and 46 g of toluene (C6H5CH3), the mole fraction of benzene is', N'1/6', N'1/5', N'1/2', N'1/3', 7, N'Q', N'1/6', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (65, N'In which mode of expression, the concentration of solution remains independent of temperature?', N'Molarity', N'Normality', N'Formality', N'Molality', 7, N'Q', N'Molality', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (77, N'Molarity of a solution containing 1g NaOH in 250 ml of solution is', N'0.1 M', N'1 M', N'0.01 M', N'0.001 M', 7, N'Q', N'0.1 M', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (78, N'Which one of the following solutions of sulphuric acid will exactly neutralize 25 ml of 0.2 M sodium hydroxide solution?', N'12.5 ml of 0.1 M solution', N'25 ml of 0.1 M solution ', N'25 ml of 0.2 M solution', N'50 ml of 0.2 M solution', 7, N'Q', N'25 ml of 0.1 M solution ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (79, N'Colligative properties of the solution depend on ', N'Nature of solute', N'Nature of solvent', N'Number of particles present in the solution', N'Number of moles of solvent only', 7, N'Q', N'Number of particles present in the solution', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (80, N'Which one is a Colligative property?', N'Boiling point', N'Vapour pressure', N'Osmotic pressure', N'Freezing point', 7, N'Q', N'Osmotic pressure', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (81, N'A solution that obeys Raoult’s law is', N'Normal', N'Molar', N'Ideal', N'Saturated', 7, N'Q', N'Ideal', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (115, N'The process of digestion of food in humans begins in ', N'Stomach', N'Food pipe ', N'Mouth     ', N'Small intestine', 12, N'Q', N'c', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (116, N'The number of molecules in 16g of methane is:', N'3 x `10^23`', N'6.022 x `10^23`', N'16/6.022 x `10^23`', N'16/3.0 x `10^23`', 10, N'Q', N'6.022 x `10^23`', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (117, N'The maximum amount of BaSO4 precipitated on mixing BaCl2 (0.5M) with H2SO4 (1M) will correspond to:', N'0.05 M', N'0.5 M', N'1.0 M', N'2.0 M', 10, N'Q', N'0.5 M', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (118, N'One molal solution contains 1 mole of a solute in:', N'1000 g of the solvent ', N'One litre of the solvent', N'One litre of the solution', N'22.4 liters of the solution', 10, N'Q', N'1000 g of the solvent ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (126, N'Which of the following atoms or atom/ion have identical ground state configuration?', N'`Li^+` and `He^+` ', N'`Cl^-` and Ar ', N'Na and K ', N'`F^+` and Ne', 13, N'Q', N'`Cl^-` and Ar ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (127, N'The configuration 1s2 2s2 2p5 3s1 shows:', N'Ground state of fluorine', N'Excited state of fluorine', N'Excited state of neon ', N'Excited state of `0^2-` ion', 13, N'Q', N'Excited state of neon ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (128, N'Which of the following orbitals has dumb-bell shape?', N's', N'p', N'd', N'f', 13, N'Q', N'p', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (129, N'Bohr’s radius for the H-atom (n = 1) is approximately 0.53&#197;. the radius of the first excited state (n = 2) is:', N'0.13 Å', N'1.06 Å ', N'4.77 Å', N'2.12 Å ', 13, N'Q', N'2.12 Å ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (130, N'The correct order of increasing energy of atomic orbitals is:', N'5p < 4f < 6s <5d', N'5p < 6s < 4f <5d ', N'4f < 5p < 5d < 6s', N'5p < 5d <4f < 6s', 13, N'Q', N'5p < 6s < 4f <5d ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (131, N'Isoelectronic species are:', N'`F^-`, `O^2-` ', N'`F^-`,O', N'`F^-`, `O^+`', N'`F^-`, `O^2+`', 13, N'Q', N'`F^-`, `O^2-` ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (132, N'The energy of second Bohr orbit of hydrogen atom is -328 KJ mol-1. Hence the energy of fourth orbit would be', N'-41 KJ `mol^-1`', N'-82 KJ  `mol^-1`', N'-164 KJ  `mol^-1`', N'-1312 KJ  `mol^-1`', 13, N'Q', N'-82 KJ  `mol^-1`', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (133, N'Which of the following ions have electronic configuration [Ar] `3d^6`?', N'`Ni^3+`', N'`Mn^3+`', N'`Fe^3+`', N'`Co^3+`', 13, N'Q', N'`Co^3+`', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (134, N'The maximum number of electrons in a sub-shell with l = 3 and n = 4 is:', N'14', N'16', N'10', N'12', 13, N'Q', N'14', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (135, N'The value of plank’s constant is 6.63 x `10^-34` Js. The speed of light is 3 x `10^17` nm `s^-1` ?', N'75', N'10', N'25', N'50', 13, N'Q', N'50', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (136, N'The attraction which an atom exerts on a pair of electrons that are being shared with another atom for forming covalent bond is known as:', N'Electron affinity', N'Electronegativity', N'Ionization energy', N'Valence', 14, N'Q', N'Electronegativity', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (137, N'The element with atomic number 55 belongs to which block of the periodic table?', N's– block ', N'p– block ', N'd– block ', N'f– block ', 14, N'Q', N's– block ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (139, N'In the periodic table, the element with atomic number 16 will be placed in the group ', N'Fourteen', N'Sixteen', N'Thirteen', N'Fifteen', 14, N'Q', N'Sixteen', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (140, N'Correct order of ionization enthalpies is:', N'Zn < Cd < Hg', N'Cd < Hg < Zn', N'Na < Cs < Rb ', N'Cs < Rb < Na ', 14, N'Q', N'Cs < Rb < Na ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (141, N' The smallest ion among the following is:', N'`Na^+`', N'`Al^3+`', N'`Mg^2+`', N'`Si^4+` ', 14, N'Q', N'`Si^4+` ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (142, N'Which has the least first ionization enthalpy (IE1)?', N'H', N'He', N'Xe', N'Li', 14, N'Q', N'Li', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (76, N'The molarity of a solution of Na2CO3 having 10.6 g/500ml of solution is', N'0.2 M', N'2 M', N'20 M', N'0.02 M', 7, N'Q', N'0.2 M', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (88, N'In adsorption of oxalic acid on activated charcoal, the activated charcoal is known as', N'Adsorbent', N'Adsorbate', N'Adsorber', N'Absorber', 9, N'Q', N'Adsorbent', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (89, N'Adsorption is phenomenon is which a substance', N'Goes into the body of the other substance', N'Remains close the other substance', N'Accumulates on the surface of the other substance', N'None of these', 9, N'Q', N'Accumulates on the surface of the other substance', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (90, N'100 ml of a liquid A was mixed with 25 ml of a liquid B to give a non-ideal solution of A-B mixture. The volume of this mixture would be', N'75 ml', N'125 ml', N'Close to 125 ml', N'Just more than 125 ml', 7, N'Q', N'Close to 125 ml', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (93, N'A mixture of benzene and toluene forms', N'An ideal solution ', N'Non-ideal solution', N'Suspension', N'Emulsion', 7, N'Q', N'An ideal solution', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (94, N'	Which of the following liquid pairs shows a positive deviation from Raoult’s law?', N'Water-hydrochloric acid', N'Water-nitric acid', N'Acetone-chloroform', N'Benzene-methanol', 7, N'Q', N'Benzene-methanol', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (95, N'Which of the following pair shows a negative deviation from Raoult’s law?', N'Acetone-benzene', N'Acetone-ethanol', N'Acetone-chloroform', N'Benzene- methanol', 7, N'Q', N'Acetone-chloroform', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (96, N'Vapour pressure of a solution of 5 g of non-electrolyte is 100 g of water at a particular temperature is 2985 N/m2. The vapour pressure of pure water is 3000 N/m2, the molecular weight of the solute is ', N'60', N'120', N'178.2', N'380', 7, N'Q', N'178.2', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (97, N'When 1.345 g of CuCl2 is dissolved in 1 kg of water, the elevation in boiling point will be (Kb = 0.52, molar mass of  CuCl2 = 134.5)', N'0.05', N'0.30', N'0.15', N'0.015', 7, N'Q', N'0.015', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (98, N'Adsorption is always', N'Endothermic', N'Exothermic', N'Either (a) or (b)', N'None of these', 9, N'Q', N'Exothermic', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (101, N'There is desorption of physical adsorption when', N'Temperature is increased', N'Temperature is decreased', N'Pressure is increased', N'Concentration is increased', 9, N'Q', N'Temperature is increased', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (102, N'Sorption is the term used when', N'Adsorption takes place', N'Absorption takes place', N'Both (a) and (b)', N'Desorption takes place', 9, N'Q', N'Both (a) and (b)', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (103, N'Adsorption is multilayered in the case of', N'Physical adsorption', N'Chemisorption', N'Both', N'None of both', 9, N'Q', N'Physical adsorption', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (104, N'Which of the following is not a characteristic of chemisorption', N'?H is of the order of 400 kJ', N'Adsorption is irreversible', N'Adsorption may be multimolecular layer', N'Adsorption is specific', 9, N'Q', N'Adsorption may be multimolecular layer', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (105, N'If the absorbate is held on a surface by weak Vander Waal’s forces, the absorption process is called', N'Physical adsorption', N'Chemical adsorption', N'Heat of adsorption', N'Enthalpy of adsorption', 9, N'Q', N'Physical adsorption', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (106, N'Physical adsorption is essentially quite appreciable', N'At room temperature', N'At higher temperature', N'At lower temperature', N'None of these', 9, N'Q', N'At lower temperature', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (107, N'Chemisorption', N'Increases with temperature', N'Decreases with temperature', N'Remains unaffected by change of temperature', N'first increases then decreases with temperature', 9, N'Q', N'first increases then decreases with temperature', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (110, N'When the temperature is lowered and pressure is raised, the adsorption of a gas on a solid', N'Decreases', N'Increases', N'Remains unaffected', N'Decreases first then increases', 9, N'Q', N'Increases', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (111, N'Which plot is the adsorption isobar for chemisorption where x is the amount of gas adsorbed on mass m (at constant pressure) at temperature T', N'a', N'b', N'c', N'd', 9, N'Q', N'c', NULL, 1, N'/Upload/QuestionPapers/image.PNG')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (112, N'Which plot is the adsorption isobar for chemisorption where x is the amount of gas adsorbed on mass m (at constant pressure) at temperature T', N'a', N'b', N'c', N'd', 9, N'Q', N'c', NULL, 1, N'/Upload/QuestionPapers/Untitled.png')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (143, N'For the electron affinity of halogens which of the following is correct?', N'Br > F', N'F > Cl', N'Br > Cl', N'F > l ', 14, N'Q', N'F > l ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (144, N'Which of the following ions has the electronic configuration (Ar) `3d^6`?', N'`Ni^3+`', N'`Mn^2+`', N'`Fe^3+`', N'`Co^3+`', 14, N'Q', N'`Co^3+`', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (113, N'According to Langmuir adsorption isotherm, the amount of gas adsorbed at very high pressures', N'Reaches a constant limiting value', N'Goes on increasing with pressure', N'Goes on decreasing with pressure', N'Increases first and decreases later with pressure', 9, N'Q', N'Reaches a constant limiting value', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (114, N'For the adsorption of a gas on a solid, the plot of log (x/m) versus log P is linear with slope equal to', N'k', N'log k', N'n', N'1/n', 9, N'Q', N'1/n', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (138, N'The ionic radii of `N^3-`, `O^2-`, `F^-`, `Na^+` follow the order:', N'`N^3-` > `O^2-` > `F^-` > `Na^+` ', N'`N^3-` > `Na^+` > `O^2-` > `F^-` ', N'`Na^+` >`O^2-` > `F^-` >  `N^3-`', N'`O^2-` >`N^3-` > `Na^+` >  `F^-` ', 14, N'Q', N'`N^3-` > `O^2-` > `F^-` > `Na^+` ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (166, N'In CH3CH2Br, % of Br is', N'80', N'73', N'70', N'7', 5, N'Q', N'73', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (167, N'Haloforms are trihalogen derivatives of', N'ethane', N'methane', N'propane', N'Benzene', 5, N'Q', N'methane', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (168, N'Number of p-bonds present in B.H.C. (benzene hexachloride) are', N'6', N'zero', N'3', N'12', 5, N'Q', N'zero', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (169, N'Which of the following is a primary halide', N'Isopropyl', N'Secondary butyl iodide', N'Tertiary butyl bromide', N'Neo hexyl chloride', 5, N'Q', N'Neo hexyl chloride', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (175, N'The main product of this reaction is', N'a', N'b', N'c', N'd', 5, N'Q', N'a', NULL, 1, N'/Upload/QuestionPapers/3.JPG')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (119, N'Which has the maximum number of atoms?', N'6.022 x `10^21` molecules of CO2', N'22.4 L of CO2 at N.T.P.', N'0.44 g of CO2', N'None of these', 10, N'Q', N'22.4 L of CO¬¬2 at N.T.P.', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (120, N'The litres of CO2 represented by 4.4 g of CO2 at S.T.P are:', N'2.4 litres', N'2.24 litres ', N'44 litres', N'22.4 litres', 10, N'Q', N'2.24 litres ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (121, N'the crystalline salt Na2SO4.xH2O on heating loses 55.9% of its weight. The formula of the crystalline salt is:', N'Na2SO4.5H2O', N'Na2SO4.7H2O', N'Na2SO4.2H2O', N'Na2SO4.10H2O ', 10, N'Q', N'Na2SO4.10H2O ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (122, N'Volume occupied by one molecule of water (density = 1 g cm-3) is:', N'3.0 x `10^-23`  `cm^3`', N'5.5 x `10^-23` `cm^3`', N'9.0x `10^-23` `cm^3`', N'6.023  x `10^-23` `cm^3`', 10, N'Q', N'3.0 x `10^-23`  `cm^3`', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (123, N'which has maximum number of molecules among the following?', N'44 g of CO2', N'48 g of O3', N'8 g of H2 ', N'64 g of SO2', 10, N'Q', N'8 g of H2 ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (124, N'Mole fraction of solute in a 2.0 molal aqueous solution is', N'1.77', N'1.87', N'0.347', N'0.0347', 10, N'Q', N'0.0347', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (125, N'The number of water molecules is maximum in:', N'1.8 g of water', N'18 g of water', N'18 moles of water ', N'18 molecules of water', 10, N'Q', N'18 moles of water ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (165, N'Crystalline solids are ', N'Glass', N'Rubber ', N'Plastic', N'Sugar ', 2, N'Q', N'Sugar ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (182, N'Identify the function of Ribosome.', N'Generates energy', N'Synthesis lipids', N'Carries genetic material', N'Synthesis proteins              ', 16, N'Q', N'Synthesis proteins              ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (183, N'Chloroplast is absent in which of these cells?', N'Stem', N'Leaf', N'Root', N'Sepal ', 16, N'Q', N'Root', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (178, N'Identify the tissue that transports water to the plant body.', N'Xylem', N' Phloem', N'Cambium', N'all of these', 22, N'Q', N'Xylem', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (180, N'What would happen if &#39;nucleus&#39; is removed from the cell?', N'The activities of the cell will not be controlled', N'The cell will not have a regular shape', N'The cell will not be able to store food and water', N'The movement of substances in and out of the cell will not be controlled', 16, N'Q', N'The activities of the cell will not be controlled', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (181, N'Which of the following organelles is may responsible for mechanical support and enzyme transport?', N'Mitochondria', N'Endoplasmic Reticulum                  ', N'Chloroplast', N'Golgi-complex', 16, N'Q', N'Endoplasmic Reticulum                  ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (184, N'Identify the statement that is not true.', N'Cytoplasm contains jelly-like substance.', N'Nucleus makes food for the plant', N'Chloroplast contains chlorophyll', N'Cytoplasm is the site where many cell activities take place', 16, N'Q', N'Nucleus makes food for the plant', NULL, 1, N'')
GO
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (185, N'What is the function of the Chloroplast?', N'To absorb carbon dioxide during photosynthesis', N'To break up water into hydrogen and oxygen during photosynthesis', N'To absorb food', N'To form protein and amino acids in the presence of sunlight', 16, N'Q', N'To break up water into hydrogen and oxygen during photosynthesis', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (186, N'Which cell organelles is/are absent in an animal cell ?', N'A nucleus', N'A cell wall', N'A large vacuole', N'Both [b] and [c]             ', 16, N'Q', N'Both [b] and [c]             ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (187, N'Plant cells contain a cell wall. Which substance is present in the cell wall?', N'Protein', N'Carbohydrate', N'Starch', N'Cellulose   ', 16, N'Q', N'Cellulose   ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (188, N'Which of these are parts of the protoplasm?', N'Cell membrane and cytoplasm', N'Chloroplast and cell wall', N'Cytoplasm and nucleus', N'Vacuole and cytoplasm', 16, N'Q', N'Cytoplasm and nucleus', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (189, N'Identify the organism that contains nerve cell.', N' Yeast', N'Spirogyra', N'Earthworm ', N'Amoeba', 16, N'Q', N'Earthworm ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (190, N'Identify the tissue that transports water to the plant body.', N'Xylem', N'Phloem', N'Cambium', N' all of these', 22, N'Q', N'Xylem', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (191, N'Which of the following tissues lines body cavities and covers the body surface?', N'Nervous', N'Epithelial', N'Muscle', N'Connective', 22, N'Q', N'Epithelial', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (192, N'Which of the following tissues includes bone and cartilage?', N'Muscle tissue', N'Nervous tissue', N'Epithelial tissue', N'Connective tissue', 22, N'Q', N'Connective tissue', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (193, N'Which of the following organs contain(s) smooth muscles?', N'Iris of eye', N' Uterus', N'Bronchi', N'All of the above', 22, N'Q', N'All of the above', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (194, N'Which of the following is/are connective tissues?', N' Bone', N'Cartilage', N'Blood', N'All of the above                 ', 22, N'Q', N'All of the above                 ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (195, N'Which of the following tissues supports, defends, and transports food in the body?', N'Epithelial', N'Connective ', N'Nervous', N'Muscular', 22, N'Q', N'Connective ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (196, N'Which of the following statements is true about tissue?', N'Cells with similar structures but have different functions.', N'A diverse group of cells that perform similar functions.', N'Cells with similar structures and functions.', N'Cells with different structures but the same function.', 22, N'Q', N'Cells with similar structures and functions.', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (197, N'Which of the following epithelial tissues lines the inner surface of the trachea?', N'Squamous', N'Cuboidal', N'Hyaline cartilage', N'Ciliated ', 22, N'Q', N'Ciliated ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (215, N'The sheath which covers the axon of a neuron is made up of', N'glucose.', N'protein.', N'minerals.', N'myelin', 25, N'Q', N'myelin', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (217, N'Which of the following is an example of a reflex action?', N'A knee-jerk', N'Blinking of an eye', N'Pumping of blood by the heart', N'Both (a) and (b)', 25, N'Q', N'Both (a) and (b)', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (198, N'Which of the following tissues is responsible for receiving, interpreting and producing response to stimulus?', N'Muscle tissue', N'Connective tissue', N'Nervous tissue', N'Epithelial tissue', 22, N'Q', N'Nervous tissue', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (199, N'Which of the following substances is present in the cell walls of sclerenchyma?', N' Cellulose', N'Pectin', N'Lignin  ', N'Hemicellulose', 22, N'Q', N'Lignin  ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (200, N'Which of the following does not lose its nucleus at maturity?', N'Best fibre', N'Companion cell', N'Red blood cell', N'Sieve tube cell', 22, N'Q', N'Companion cell', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (206, N'In which of the following processes the energy stored in carbohydrates is released?', N'Photosynthesis', N'Respiration', N'Reproduction', N'Nutrition', 12, N'Q', N'Respiration', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (207, N'The organism having parasitic mode of nutrition is ', N'Penicillium', N'Plasmodium   ', N'Paramecium', N'Parrot', 12, N'Q', N'Plasmodium   ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (208, N'Which of the following cell organelles carries out photosynthesis?', N'Chloroplast', N'Mitochondria', N'Cytoplasm', N'Nucleus', 12, N'Q', N'Chloroplast', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (209, N'Identify the process of respiration in amoeba.', N'Transpiration ', N'Osmosis', N'Diffusion', N'Inhalation', 12, N'Q', N'Diffusion', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (210, N'Which of the following glands produce amylolytic enzymes?', N'Salivary glands and liver  ', N'Stomach and pancreas', N'Salivary glands and pancreas', N'Stomach and liver', 12, N'Q', N'Salivary glands and pancreas', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (211, N'Which of the following enzymes helps in the curdling of milk?', N'Pepsin  ', N'Renin', N'HCl', N'Trypsin', 12, N'Q', N'Renin', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (212, N'Which of the following is the structural and functional unit of the excretory system?', N'Neuron', N'Nephron ', N'Alveolus', N'Both (a) and (b)', 12, N'Q', N'Nephron ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (213, N'Which of the following cannot be considered a receptor?', N'ear', N'nose', N'Muscle', N'eye', 25, N'Q', N'Muscle', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (214, N'Cerebellum , medulla and pons are the parts of  :', N'Mid-brain', N'Hind-brain ', N'Forebrain', N'Spinal cord', 25, N'Q', N'Hind-brain ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (225, N'One of the following organisms does not reproduce by binary fission. This is', N'Amoeba', N'Plasmodium   ', N'Leishmania', N'Paramecium', 26, N'Q', N'Plasmodium', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (226, N'The anther contains', N'Sepals', N'Ovules', N'Carpel', N'Pollen grains', 26, N'Q', N'Pollen grains', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (227, N'Which of the following is NOT a characteristic feature of sexual reproduction?', N'Sexual reproduction involves the fusion of two dissimilar reproductive cells.', N'Sexual reproduction is observed in most organisms', N'Fertilization may take place inside or outside the body of the female.', N'The offspring represents the characteristics of only one parent', 26, N'Q', N'The offspring represents the characteristics of only one parent', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (228, N'Which of the following is NOT an example of asexual reproduction?', N'Budding in hydra', N'Binary fission in amoeba', N'Formation of spores in ferns', N'Reproduction in earthworms ', 26, N'Q', N'Reproduction in earthworms ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (229, N'Which of the following parts within the uterus prevents the mixing of the blood of the foetus with that of the mother?', N'Umbilical cord', N'Uterus wall', N'Placenta ', N'Water sac', 26, N'Q', N'Placenta ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (230, N'Where does the fertilization of the female egg usually occur in human beings?', N'Vagina', N' Uterus', N'Ovary', N'Fallopian tube', 26, N'Q', N'Fallopian tube', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (231, N'Which of these statements about the reproductive system of a plant is NOT true?', N'The male organs are the stamens.', N'The anthers produce female gametes', N'The male gametes are present in the pollen grains.', N'A male gamete from a pollen grain fertilize a female gamete in an ovule.', 26, N'Q', N'The anthers produce female gametes', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (256, N'In an experiment 0.04 F was passed through 400 ml of 1 M
solution of NaCl. What would be the pH of the solution
after the electrolysis ?', N'8', N'10', N'9', N'6', 4, N'Q', N'9', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (263, N'A current of 0.5 ampere is passed for 30 minute through a
voltameter containing CuSO4 solution. The weight of Cu
deposited will be', N'3.18 g', N'0.318 g', N'0.296 g', N'0.150 g', 4, N'Q', N'0.296 g', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (270, N'A current of 2.0 A passed for 5 hours through a molten
metal salt deposits 22.2 g of metal (At wt. = 177). The
oxidation state of the metal in the metal salt is', N'+1', N'+2', N'+3', N'+4', 4, N'Q', N'+3', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (201, N'A person is suffering from loss of appetite, nausea, mild fever and dark coloured urine. The patient is suffering from', N'Malaria.', N'Cholera.', N'Jaundice.', N'Typhoid.', 24, N'Q', N'Jaundice.', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (202, N'Loss of body weight, persistent cough with blood stained yellowish green sputum are the symptoms of', N'Tuberculosis ', N'Typhoid.', N'Hepatitis-B.', N'Cholera.', 24, N'Q', N'Tuberculosis ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (203, N'Which antibiotic is extracted from fungi?', N'Streptomycin', N'Penicillin', N'Chloromycetin', N'Framycetin', 24, N'Q', N'Penicillin', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (204, N'Which of the following is not a symptom of tuberculosis?', N'Increase in body weight and tiredness', N'More than two weeks of coughing bouts', N'Thick yellowish green sputum produced', N'An X-ray shows dark spots in the lungs', 24, N'Q', N'Increase in body weight and tiredness', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (205, N'Which substance is/are produced within an organism to prevent the spread of microorganism?', N' Antiseptics', N'Antibiotics', N'Antibodies', N'all of these', 24, N'Q', N'Antibodies', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (216, N'Which of the following functions is performed by the sensory neuron?', N'It transfers impulses from the receptor to the effector.', N'It transfers impulses from the effector to the motor neuron.', N'It transfers impulses from the receptor to the central nervous system.', N'It transfers impulses from the central nervous system to the receptor', 25, N'Q', N'It transfers impulses from the receptor to the central nervous system.', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (218, N'Which statement about the human brain is incorrect?', N'Human brain is made up of cerebrum, cerebrellum and medulla oblongata.', N'The outer brain is white and the inner one is grey in colour', N'Brain is the main controlling centre of the human nervous system.', N'Brain receives impulses from the sensory organs.', 25, N'Q', N'The outer brain is white and the inner one is grey in colour', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (219, N'Which of the following transport(s) hormones from the place of origin to the place of target?', N' Ducts', N'Blood ', N'Nerves', N'All these', 25, N'Q', N'Blood ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (220, N'Which of the following is used to destroy dicotyledonous weeds?', N'Indole acetic acid', N'2, 4- dichlorophenoxy acetic acid', N'Abscisic acid', N'Naphthalene acetic acid', 25, N'Q', N'2, 4- dichlorophenoxy acetic acid', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (221, N'Which of the following hormones causes the shedding of leaves and fruits?', N'Indole acetic acid', N'Naphthalene acetic acid', N'Gibberellins', N'Abscisic acid', 25, N'Q', N'Abscisic acid', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (222, N'Which of the following hormones helps in parthenocarpy?', N'Abscisic acid', N'Gibberellin  ', N'Ethylene', N'Cytokinin', 25, N'Q', N'Gibberellin  ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (223, N'Which of the following hormones plays an important function in embryo implantation?', N'Testosterone', N'Insulin', N' Prolactin', N'Progesterone ', 25, N'Q', N'Progesterone ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (224, N'Which of the following is a mixed gland?', N'Pituitary', N'Adrenal', N'Pancreas', N'Ovary      ', 25, N'Q', N'Pancreas', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (237, N'The science of heredity is known as ', N'Biology', N'Embryology', N'Genetics', N'Biochemistry', 27, N'Q', N'Genetics', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (238, N'A gene is a:', N'Hybrid', N'Heritable traits', N'Pure breed', N'Part of a chromosome that transmits a trait', 27, N'Q', N'Part of a chromosome that transmits a trait', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (239, N'What is organic evolution?', N'Formation of more and more complex organisms from simpler ones through gradual changes.', N'The act of special creation that brought all the organisms into this world.', N'Life started from non-living matter in one day.', N'Developed from organisms which arose from chemical reactions in the ocean.', 27, N'Q', N'Formation of more and more complex organisms from simpler ones through gradual changes.', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (240, N'The fossil trilobite was originally', N'a vertebrate.', N'an invertebrate', N'a reptile.', N'a bird.', 27, N'Q', N'an invertebrate', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (241, N'Who among the following did not propose the theory of evolution?', N'Jean Baptiste Lamark', N'Hugo Devries', N'Gregor Mendel', N'Charles Darwin', 27, N'Q', N'Gregor Mendel', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (242, N'In which book did Lamark publish his theory of organic evolution?', N'Origin of life', N'Philosophic Zoologique', N'Surival of the fittest', N'Struggle for existence', 27, N'Q', N'Philosophic Zoologique', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (232, N'Which of the following is true about the use of the nectary in a flower?', N'Supplies sugar for the growth of the pollen tubes', N'Supplies a lubricant for the pollen tubes to enter the ovules', N'Gives a pleasant smell to spread in air', N'Produces a sweet liquid to attract animals', 26, N'Q', N'Produces a sweet liquid to attract animals', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (233, N'Where does fertilization take place in a plant?', N'Pollen grains', N'Anthers', N'Stigma', N'Ovules ', 26, N'Q', N'Ovules ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (234, N'Why do flowering plants show double fertilisation?', N'To produce the endosperm which contains food and ensures that the seed germinates successfully ', N'To protect the seeds', N'To ensure the survival of the diploid zygote.', N'To ensure that the ovary will not develop if double fertilisation does not take place.', 26, N'Q', N'To produce the endosperm which contains food and ensures that the seed germinates successfully ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (235, N'Which of the following are modes of asexual reproduction?', N'Budding', N'Binary fission', N'Spore formation', N'All of these', 26, N'Q', N'All of these', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (236, N'Amoeba reproduces by which of the following methods?', N'Binary fission', N'Budding', N'Germination', N'All of the above', 26, N'Q', N'Binary fission', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (248, N'Which of the following statements is (are) true of palaeontology?', N'It provides indirect evidence in favour of organic evolution.', N'It does not help us to compare the past with the present.', N'It helps us to know the exact period of the formation of a species', N'All of the above', 27, N'Q', N'It helps us to know the exact period of the formation of a species', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (249, N'Which of the following is the connecting link between the birds and reptiles?', N'Dinosaurs', N' Mammoths', N'Archaeopteryx', N'Pliohippus', 27, N'Q', N'Archaeopteryx', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (250, N' Which of the following processes is responsible for the change in the wing colour of peppered moths in industrial areas of Britain?', N' Hybridisation', N' Mutation  ', N'Artificial selection', N'Evolution', 27, N'Q', N' Mutation  ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (251, N'Which of these are identified to be the earliest of the life forms?', N' Fungi', N'Cyanobacteria ', N'Protozoa', N' Plants', 27, N'Q', N'Cyanobacteria ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (261, N'The standard emf of a galvanic cell involving 3 moles of
electrons in a redox reaction is 0.59 V. The equilibrium
constant for the reaction of the cell is', N'`10^25`', N'`10^20`', N'`10^15`', N'`10^30`', 4, N'Q', N'`10^30`', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (262, N'Consider the following four electrodes :
P = Cu2+ (0.0001 M)/Cu (s)
Q = Cu2+ (0.1 M)/Cu (s)
R = Cu2+ (0.01 M)/Cu (s)
S = Cu2+ (0.001 M)/Cu (s)
If the standard electrode potential of Cu2+/Cu is + 0.34 V,
the reduction potentials in volts of the above electrodes
follow the order', N'P > S > R > Q', N'S > R > Q > P', N'R > S > Q > P', N'Q > R > S > P', 4, N'Q', N'Q > R > S > P', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (264, N'Conductivity of 0.01 M Nacl solution is 0.00147 ohm–1 cm–1.
What happens to this conductivity if extra 100 ml of H2O
will be added to the above solution ?', N'Increases', N'Decreases', N'Remains unchanged', N'first increases and then decreases', 4, N'Q', N'Decreases', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (271, N'If the salt bridge is removed suddenly from a working
cell, the voltage', N'increases', N'decreases', N'drops to zero', N'may increases or decrease depending upon cell reaction.', 4, N'Q', N'drops to zero', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (272, N'Which of the following is a natural polymer ?', N'Protein', N'Polythene', N'Buna-S', N'Bakelite', 38, N'Q', N'Protein', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (289, N'Which of the following is an antibiotic', N'Terramycin', N'Aspirin', N'Paracetamol', N'Chloroquine', 39, N'Q', N'Terramycin', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (243, N'Who suggested the theory that organs which are not used may eventually lose their function and may even disappear?', N'Mendel', N'Darwin', N' Devries', N'Lamarck    ', 27, N'Q', N'Lamarck    ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (244, N'Who among the following scientists rejected and disproved the Lamarckian m theory?', N'Gregor Mendel', N'Hugo de Vries', N'August Weisman', N'Francis Crick', 27, N'Q', N'August Weisman', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (245, N'Which of the following statements is true of Natural selection?', N'Organisms with favourable characters are selected by nature', N'Organisms with unfavourable characters are selected by nature', N'Organisms with favourable characters are selected by man', N'Organisms with favourable and unfavourable characters are selected by man', 27, N'Q', N'Organisms with favourable characters are selected by nature', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (246, N'In the industrial areas of Britain, light coloured peppered moths gradually became black to blend with the changing environment, which of the following principles is highlighted in the given example?', N'Artificial selection', N'Natural selection', N'Lamarckism', N'Speciation', 27, N'Q', N'Natural selection', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (252, N'What provides energy which flows through a food chain?', N'Glucose', N'Oxygen', N'Respiration ', N'Sunlight ', 27, N'Q', N'Sunlight ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (258, N'An increase in equivalent conductance of a strong
electrolyte with dilution is mainly due', N'Increase in number of ions', N'Increase in ionic mobility of ions.', N'100% ionisation of electrolyte at normal dilution.', N'Increase in both, i.e., number of ions and ionic mobility of ions', 4, N'Q', N'Increase in ionic mobility of ions.', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (265, N'When same quantity of electricity is passed for half an
hour, the amount of Cu and Cr deposited are respectively
0.375 g and 0.30 g. Ratio of electrochemical equivalents of
Cu and Cr is', N'0.8', N'1.25', N'2.5', N'1.62', 4, N'Q', N'1.25', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (290, N'Which of the following is used as antipyretic', N'Paracetamol', N'Chloroquine', N'Chloramphenicol', N'LSD', 39, N'Q', N'Paracetamol', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (291, N'Aspirin is a/an', N'narcotic', N'antipyretic', N'tranquillizer', N'anaesthetic', 39, N'Q', N'antipyretic', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (292, N'Dettol consists of', N'cresol + ethanol', N'xylenol + terpeneol', N'chloroxylenol + terpeneol', N'none of these', 39, N'Q', N'chloroxylenol + terpeneol', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (260, N'For the reduction of silver ions with copper metal, the
standard cell potential was found to be + 0.46 V at 25oC.
The value of standard Gibbs energy, `Delta` Go will be', N'– 98.0 kJ', N'– 89.0 kJ', N'– 89.0 J', N'– 44.5 kJ', 4, N'Q', N'– 89.0 kJ', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (266, N'The compound exhibiting maximum value of equivalent
conductance in a fused state is', N'SrCl2', N'CaCl2', N'MgCl2', N'BeCl2', 4, N'Q', N'SrCl2', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (267, N'A certain current liberates 0.504 g of hydrogen in 2 hours.
How many grams of oxygen can be liberated by the same
current in the same time ?', N'2.0 g', N'0.4 g', N'4.0 g', N'8.0 g', 4, N'Q', N'4.0 g', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (268, N'Consider the following statements
When a direction current is passed through an aqueous
concentrated solution of NaCl.
1. pH of the solution decreases.
2. Metallic sodium will be deposited at the cathode.
3. Chlorine gas will be liberated at the anode.
4. pH of the solution increase.
Which of the statements given above are correct ?', N'1 and 2', N'2 and 3', N'3 and 4', N'1 and 3', 4, N'Q', N'3 and 4', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (269, N'In the electrolytic cell, flow of electrons is from', N'cathode to anode in the solution', N'cathode to anode through external supply', N'cathode to anode through internal supply', N'anode to cathode thorugh internal supply', 4, N'Q', N'cathode to anode through external supply', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (273, N'The monomers used in the manufacture of nylon-6,6 are', N'sebacic acid and hexamethylene diamine', N'adipic acid and butadiene', N'sebacic acid and butadiene', N'adipic acid and hexamethylene diamine', 38, N'Q', N'adipic acid and hexamethylene diamine', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (274, N'PVC polymer can be prepared by which of the monomers ?', N'CH3CH=CH2', N'C6H5CH=CH2', N'CH2=CHCl', N'CH2=CH2', 38, N'Q', N'CH2=CHCl', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (275, N'Which of the following sets contains only addition polymers ?', N'Polyethylene, polypropylene, terylene', N'Polyethylene, PVC, acrilon', N'Buna-S, nylon, polybutadiene', N'Bakelite, PVC, polyethylene', 38, N'Q', N'Polyethylene, PVC, acrilon', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (276, N'Nylon is', N'polyester fibre', N'polyamide fibre', N'polythene derivative', N'polyethylene methyl acrylate fibre', 38, N'Q', N'polyamide fibre', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (277, N'Which one of the following statements is wrong ?', N'PVC stands for poly vinyl chloride', N'PTFE stands for teflon', N'PMMA stands for polymethyl metha acrylate', N'Buna-S stands for natural rubber', 38, N'Q', N'Buna-S stands for natural rubber', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (278, N'Which of the following is a bio-degradable polymer ?', N'PVC', N'Nylon-6', N'Cellulose', N'Polythene', 38, N'Q', N'Cellulose', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (279, N'Which of the following is a polyamide ?', N'Teflon', N'Nylon-6,6', N'Terylene', N'Bakelite', 38, N'Q', N'Nylon-6,6', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (280, N'Buna-S is a polymer of', N'butadiene only', N'butadiene and nitryl', N'styrene only', N'butadiene and styrene', 38, N'Q', N'butadiene and styrene', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (281, N'Condensation product of caprolactum is', N'nylon-6', N'nylon-6,6', N'nylon-60', N'nylon-6,10', 38, N'Q', N'nylon-6', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (282, N'Which of the following is a cross-linked polymer ?', N'Teflon', N'Orlon', N'Nylon', N'Bakelite', 38, N'Q', N'Bakelite', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (283, N'Dacron is an example of', N'polyamide', N'polypropylene', N'polyurethane', N'polyester', 38, N'Q', N'polyester', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (284, N'Bakelite is obtained from phenol by reacting with', N'formaldehyde', N'acetaldehyde', N'chlorobenzene', N'acetal', 38, N'Q', N'formaldehyde', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (285, N'Heating of rubber with sulphur is known as', N'galvanisation', N'bessemerisation', N'vulcanisation', N'sulphonation', 38, N'Q', N'vulcanisation', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (286, N'Natural rubber is a polymer of', N'neoprene', N'isoprene', N'chloroprene', N'butadiene', 38, N'Q', N'isoprene', NULL, 1, N'')
GO
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (287, N'In elastomer, intermolecular forces are', N'nil', N'weak', N'strong', N'very strong', 38, N'Q', N'weak', NULL, 1, N'')
INSERT [dbo].[objectivequestioninformation] ([questionid], [question], [answer1], [answer2], [answer3], [answer4], [paperid], [quesno], [answerkey], [marksstatus], [marks], [image]) VALUES (288, N'The fibre obtained by the condensation of hexamethylene
diamine and adipic acid is', N'dacron', N'nylon-6,6', N'rayon', N'teflon', 38, N'Q', N'nylon-6,6', NULL, 1, N'')
SET IDENTITY_INSERT [dbo].[objectivequestioninformation] OFF
SET IDENTITY_INSERT [dbo].[objectiveresult] ON 

INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (3, 8, N'12th', N'Chemistry', 0, 0, N'Fail      ', 2, 1, NULL, N'Solid State')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (4, 2, N'12th', N'Chemistry', 5, 55.555555555555557, N'Fail      ', 2, 1, NULL, N'Solid State')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (5, 2, N'12th', N'Chemistry', 2, 28.571428571428573, N'Fail      ', 4, 1, NULL, N'Electrochemistry')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (6, 10, N'12th', N'Chemistry', 2, 28.571428571428573, N'Fail      ', 2, 1, NULL, N'Solid State')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (7, 2, N'11th', N'Chemistry', 0, 0, N'Fail      ', 6, 1, NULL, N'Hydrocarbons')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (8, 2, N'12th', N'Chemistry', 0, 0, N'Fail      ', 7, 1, NULL, N'Solutions')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (9, 2, N'12th', N'Chemistry', 0, 0, N'Fail      ', 9, 1, NULL, N'Surface Chemistry')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (10, 10, N'12th', N'Chemistry', 2, 14.285714285714287, N'Fail      ', 9, 1, NULL, N'Surface Chemistry')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (11, 11, N'12th', N'Chemistry', 0, 0, N'Fail      ', 2, 1, NULL, N'Solid State')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (12, 2, N'10th', N'Science', 2, 50, N'Fail      ', 12, 1, NULL, N'Life processes')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (13, 10, N'12th', N'Chemistry', 2, 20, N'Fail      ', 7, 1, NULL, N'Solutions')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (14, 17, N'12th', N'Chemistry', 6, 35.294117647058826, N'Fail      ', 2, 1, NULL, N'Solid State')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (15, 2, N'11th', N'Chemistry', 3, 37.5, N'Fail      ', 10, 1, NULL, N'Some Basic concepts in Chemistry')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (16, 2, N'11th', N'Chemistry', 2, 33.333333333333336, N'Fail      ', 13, 1, NULL, N'Atomic Structure')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (49, 2, N'12th', N'Chemistry', 2, 100, N'Fail      ', 5, 1, NULL, N'Haloalkanes and Haloarenes')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (51, 2, N'10th', N'Science', 0, 0, N'Fail      ', 26, 1, NULL, N'Reproduction')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (52, 2, N'10th', N'Science', 1, 50, N'Fail      ', 25, 1, NULL, N'Control and co-ordination in animals and plants')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (53, 2, N'10th', N'Science', 2, 50, N'Fail      ', 27, 1, NULL, N'Heredity and Evolution')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (54, 2, N'9th', N'Science', 2, 40, N'Fail      ', 24, 1, NULL, N'Health and Diseases')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (56, 10, N'9th', N'Science', 4, 33.333333333333336, N'Fail      ', 22, 1, NULL, N'Tissues, Organs, Organ System, Organism')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (57, 10, N'10th', N'Science', 3, 37.5, N'Fail      ', 12, 1, NULL, N'Life processes')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (58, 10, N'10th', N'Science', 2, 16.666666666666668, N'Fail      ', 26, 1, NULL, N'Reproduction')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (62, 59, N'11th', N'Chemistry', 2, 50, N'Fail      ', 10, 1, NULL, N'Some Basic concepts in Chemistry')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (63, 2, N'11th', N'Chemistry', 2, 22.222222222222221, N'Fail      ', 14, 1, NULL, N'Classification of Elements and Periodicity in Properties')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (61, 10, N'11th', N'Chemistry', 2, 20, N'Fail      ', 10, 1, NULL, N'Some Basic concepts in Chemistry')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (65, 62, N'11th', N'Chemistry', 3, 37.5, N'Fail      ', 14, 1, NULL, N'Classification of Elements and Periodicity in Properties')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (66, 75, N'12th', N'Chemistry', 1, 16.666666666666668, N'Fail      ', 2, 1, NULL, N'Solid State')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (67, 87, N'9th', N'Science', 1, 33.333333333333336, N'Fail      ', 16, 1, NULL, N'Cell - Basic Unit of life')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (50, 2, N'9th', N'Science', 3, 33.333333333333336, N'Fail      ', 16, 1, NULL, N'Cell - Basic Unit of life')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (55, 10, N'9th', N'Science', 3, 30, N'Fail      ', 16, 1, NULL, N'Cell - Basic Unit of life')
INSERT [dbo].[objectiveresult] ([id], [userid], [classname], [subjectname], [Totalmarks], [percentage], [result], [paperid], [remark], [remark1], [chaptername]) VALUES (64, 62, N'11th', N'Chemistry', 0, 0, N'Fail      ', 10, 1, NULL, N'Some Basic concepts in Chemistry')
SET IDENTITY_INSERT [dbo].[objectiveresult] OFF
SET IDENTITY_INSERT [dbo].[pagenames] ON 

INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (1, N'Default.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (2, N'ActiveUsers.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (3, N'AddChapter.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (4, N'AddClass.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (5, N'AddSubject.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (6, N'AddTitle.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (7, N'AdminLogin.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (8, N'AdminWelcome.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (9, N'BlockedUsers.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (10, N'FeedBack.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (11, N'Priviliges.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (12, N'UploadArticles.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (13, N'UploadMaterial.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (14, N'Verify.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (15, N'About.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (16, N'ContactUs.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (17, N'Disclaimer.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (18, N'LogRegister.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (19, N'ObjectiveExamination.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (20, N'QuestionsPapers.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (21, N'Register.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (22, N'ResetPassWord.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (23, N'Result.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (24, N'SetObjectivePaper.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (25, N'studymaterial.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (26, N'Syllabus.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (27, N'takeexam.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (28, N'VideoLectures.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (29, N'ViewMaterial.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (30, N'Articles.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (31, N'UploadVideo.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (32, N'RegistrationStatus.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (33, N'PrivacyPolicy.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (34, N'Login.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (35, N'MyStudents.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (36, N'MyTeacherProfile.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (37, N'MyTeachers.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (38, N'OnlineTutor.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (39, N'StudentProfile.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (40, N'StuEditProfile.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (41, N'TeacherEditProfile.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (42, N'TeacherProfile.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (43, N'TeacherRegistration.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (44, N'TeacherSessions.aspx')
INSERT [dbo].[pagenames] ([pageid], [pagename]) VALUES (45, N'WhiteboardLaunch.aspx')
SET IDENTITY_INSERT [dbo].[pagenames] OFF
INSERT [dbo].[role] ([roleid], [rolename]) VALUES (1, N'Student')
INSERT [dbo].[role] ([roleid], [rolename]) VALUES (2, N'Teacher')
INSERT [dbo].[role] ([roleid], [rolename]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[tblarticle] ON 

INSERT [dbo].[tblarticle] ([id], [typeid], [title], [filesize], [filename], [linkexpiry], [status]) VALUES (17, 3, N'Education online - A Healthy Option  Ahead by Dr Nissar Ahmad.html', 15045, N'/Upload/Articles/Education online - A Healthy Option  Ahead by Dr Nissar Ahmad.html', CAST(N'2018-01-13' AS Date), N'Latest')
INSERT [dbo].[tblarticle] ([id], [typeid], [title], [filesize], [filename], [linkexpiry], [status]) VALUES (18, 3, N'Olympiads -An Introduction.html', 18521, N'/Upload/Articles/Olympiads -An Introduction.html', CAST(N'2018-01-13' AS Date), N'Latest')
INSERT [dbo].[tblarticle] ([id], [typeid], [title], [filesize], [filename], [linkexpiry], [status]) VALUES (21, 3, N'Smart Classes.html', 20011, N'/Upload/Articles/Smart Classes.html', CAST(N'2018-01-13' AS Date), N'Latest')
INSERT [dbo].[tblarticle] ([id], [typeid], [title], [filesize], [filename], [linkexpiry], [status]) VALUES (22, 3, N'Co-Curricular Activities - Importance and Scope.html', 23916, N'/Upload/Articles/Co-Curricular Activities - Importance and Scope.html', CAST(N'2018-01-13' AS Date), N'Latest')
INSERT [dbo].[tblarticle] ([id], [typeid], [title], [filesize], [filename], [linkexpiry], [status]) VALUES (24, 3, N'How to Teach Online.html', 787486, N'/Upload/Articles/How to Teach Online.html', CAST(N'2018-01-13' AS Date), N'Latest')
INSERT [dbo].[tblarticle] ([id], [typeid], [title], [filesize], [filename], [linkexpiry], [status]) VALUES (36, 2, N'NEET 2018 question paper with solutions.html', 8965368, N'/Upload/Articles/NEET 2018 question paper with solutions.html', CAST(N'2018-05-12' AS Date), N'Latest')
INSERT [dbo].[tblarticle] ([id], [typeid], [title], [filesize], [filename], [linkexpiry], [status]) VALUES (38, 2, N'Surface chemistry NEET Solved Paper.html', 177883, N'/Upload/Articles/Surface chemistry NEET Solved Paper.html', CAST(N'2018-06-06' AS Date), N'Latest')
INSERT [dbo].[tblarticle] ([id], [typeid], [title], [filesize], [filename], [linkexpiry], [status]) VALUES (39, 2, N'Electrochemistry Solved Question Paper.html', 970880, N'/Upload/Articles/Electrochemistry Solved Question Paper.html', CAST(N'2018-06-06' AS Date), N'Latest')
SET IDENTITY_INSERT [dbo].[tblarticle] OFF
SET IDENTITY_INSERT [dbo].[tblclass] ON 

INSERT [dbo].[tblclass] ([classid], [classname]) VALUES (1, N'9th')
INSERT [dbo].[tblclass] ([classid], [classname]) VALUES (2, N'10th')
INSERT [dbo].[tblclass] ([classid], [classname]) VALUES (3, N'11th')
INSERT [dbo].[tblclass] ([classid], [classname]) VALUES (4, N'12th')
INSERT [dbo].[tblclass] ([classid], [classname]) VALUES (5, N'JEE MAIN')
SET IDENTITY_INSERT [dbo].[tblclass] OFF
SET IDENTITY_INSERT [dbo].[tbllesson] ON 

INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (1, N'Matter-Nature and Behaviour', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (2, N'Nature of matter', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (3, N'Particle nature, basic units', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (4, N'Structure of atoms', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (5, N'Motion', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (6, N'Force and Newton’s laws', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (7, N'Gravitation', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (8, N'Floatation', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (9, N'Work, energy and power', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (10, N'Sound', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (11, N'Cell - Basic Unit of life', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (12, N'Tissues, Organs, Organ System, Organism', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (13, N'Biological Diversity', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (14, N'Health and Diseases', 2)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (27, N'Natural Phenomena: Reflection & Refraction of light', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (28, N'Effects of Current', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (29, N'Magnetic effects of current', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (30, N'Sources of energy', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (31, N'Our environment', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (32, N'Management of natural resources', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (33, N'Chemical reactions', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (34, N'Acids, bases and salts', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (35, N'Metals and nonmetals', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (36, N'Carbon compounds', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (37, N'Periodic classification of elements', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (38, N'Life processes', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (39, N'Control and co-ordination in animals and plants', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (40, N'Reproduction', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (41, N'Heredity and Evolution', 4)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (42, N'Solid State', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (45, N'Solutions', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (47, N'Electrochemistry', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (48, N'Chemical Kinetics', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (49, N'Surface Chemistry', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (50, N'General Principles and Process of Isolation of Metals', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (51, N'p - Block Elements', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (52, N'd – and f – Block Elements', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (53, N'Co-ordination Compounds', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (54, N'Haloalkanes and Haloarenes', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (55, N'Alcohols, phenols, ethers', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (56, N'Aldehydes, ketones, carboxylic acids', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (57, N'Organic Compounds Containing Nitrogen', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (58, N'Polymers', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (59, N'Bio Molecules', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (60, N'Chemistry in Everyday Life', 11)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (61, N'Some Basic concepts in Chemistry', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (62, N'Atomic Structure', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (63, N'Classification of Elements and Periodicity in Properties', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (64, N'Chemical Bonding and Molecular Structure', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (65, N'States of Matter : gases and liquids', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (66, N'Chemical Thermodynamics', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (67, N'Equilibrium', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (68, N'Redox Reactions', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (69, N'Hydrogen', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (70, N's - Block Elements', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (71, N'Some p - Block Elements', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (72, N'Some Basic Principles and techniques  of Organic Chemistry', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (73, N'Hydrocarbons', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (74, N'Environmental chemistry', 7)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (75, N'Haloalkanes and Haloarenes', 14)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (76, N'Hydrocarbons', 14)
INSERT [dbo].[tbllesson] ([lessonid], [lessonname], [subjectid]) VALUES (77, N'Aromatic Compounds', 14)
SET IDENTITY_INSERT [dbo].[tbllesson] OFF
SET IDENTITY_INSERT [dbo].[tblmaterial] ON 

INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (39, 1, 11, 47, 4, 16139, N'/Upload/pdf/1.Electrochemistry-introduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (40, 1, 11, 47, 4, 15743, N'/Upload/pdf/Conductors and Non Conductors and  Electrolytes.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (41, 1, 11, 47, 4, 41499, N'/Upload/pdf/Galvanic cell.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (42, 1, 11, 47, 4, 15418, N'/Upload/pdf/Electrode Potential.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (43, 1, 11, 47, 4, 16686, N'/Upload/pdf/Measurement of the standard electrode potential, refrence electrode.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (44, 1, 11, 47, 4, 14807, N'/Upload/pdf/Cell potential,EMF OF CELL.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (46, 1, 11, 47, 4, 16468, N'/Upload/pdf/Electrochemical Series.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (47, 1, 11, 47, 4, 13874, N'/Upload/pdf/Application of Electrochemical series.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (48, 1, 11, 47, 4, 12672, N'/Upload/pdf/General properties of acids and bases.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (49, 1, 11, 47, 4, 16311, N'/Upload/pdf/EFFECT OF CONCENTRATION ON ELECTRODE POTENTIAL(nernst equation).html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (50, 1, 11, 47, 4, 86440, N'/Upload/pdf/Electrolytic Cell.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (51, 1, 11, 47, 4, 18969, N'/Upload/pdf/Conductance of Solution, electrolytic conductance.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (52, 1, 11, 47, 4, 87585, N'/Upload/pdf/Effect of concentration on Conductance.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (53, 1, 11, 47, 4, 53010, N'/Upload/pdf/Kohlrausch law.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (54, 1, 11, 47, 4, 23118, N'/Upload/pdf/Faradays laws of electrolysis.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (55, 1, 11, 47, 4, 61092, N'/Upload/pdf/Batteries.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (56, 1, 11, 42, 4, 14348, N'/Upload/pdf/1.The Solid state.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (57, 1, 11, 42, 4, 401091, N'/Upload/pdf/Calculation of number of particles per unit cell.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (58, 1, 11, 42, 4, 16698, N'/Upload/pdf/Classification of Solids.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (59, 1, 11, 42, 4, 108125, N'/Upload/pdf/Crystal Lattice and Unit Cells.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (60, 1, 11, 42, 4, 274096, N'/Upload/pdf/Close packing in crystals.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (61, 1, 11, 42, 4, 85048, N'/Upload/pdf/Tetrahedral and Octahedral voids.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (62, 1, 11, 42, 4, 111098, N'/Upload/pdf/Packing efficiency or Packing Fraction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (63, 1, 11, 42, 4, 116769, N'/Upload/pdf/Imperfection in solids.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (64, 1, 11, 42, 4, 20894, N'/Upload/pdf/Properties of solids.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (94, 1, 4, 34, 2, 25088, N'/Upload/pdf/Acids, Bases and Salts.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (95, 1, 4, 34, 2, 574363, N'/Upload/pdf/Acids, Bases and Salts.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (96, 1, 4, 34, 2, 25076, N'/Upload/pdf/Definition of acids and bases.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (97, 1, 4, 34, 2, 198656, N'/Upload/pdf/General properties of acids and bases.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (98, 1, 4, 34, 2, 30720, N'/Upload/pdf/Strength of Acids and Bases ,.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (99, 1, 4, 34, 2, 27251, N'/Upload/pdf/pH scale.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (100, 1, 4, 34, 2, 12510, N'/Upload/pdf/Importance of pH in everyday life.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (101, 1, 4, 34, 2, 21979, N'/Upload/pdf/Salts , Preparation and uses of Sodium Hydroxide.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (103, 1, 4, 33, 2, 15173, N'/Upload/pdf/Chemical Reactions and Equations.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (104, 1, 4, 33, 2, 121593, N'/Upload/pdf/Chemical reactions.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (105, 1, 4, 33, 2, 68563, N'/Upload/pdf/Balancing of a chemical equation.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (106, 1, 4, 33, 2, 312349, N'/Upload/pdf/Types of chemical reactions.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (108, 1, 4, 35, 2, 397227, N'/Upload/pdf/Metals and non-metals.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (109, 1, 4, 35, 2, 85908, N'/Upload/pdf/Properties of Metals and Non-metals.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (110, 1, 4, 35, 2, 57015, N'/Upload/pdf/Reactivity Series or Activity Series.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (111, 1, 4, 35, 2, 96112, N'/Upload/pdf/Formation and properties of ionic compounds.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (112, 1, 4, 35, 2, 158185, N'/Upload/pdf/Basic metallurgical processes,Extraction of Metals.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (113, 1, 4, 35, 2, 54396, N'/Upload/pdf/Corrosion and its prevention.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (114, 1, 4, 37, 2, 12707, N'/Upload/pdf/Need for the classification of elements.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (115, 1, 4, 37, 2, 59392, N'/Upload/pdf/Early attempts at classification of elements.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (116, 1, 4, 37, 2, 401798, N'/Upload/pdf/The Modern Periodic Table.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (117, 1, 4, 37, 2, 401475, N'/Upload/pdf/Trends in the modern periodic table.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (118, 1, 4, 36, 2, 189952, N'/Upload/pdf/Carbon and its compounds.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (119, 1, 4, 36, 2, 72754, N'/Upload/pdf/Covalent bonding in carbon compounds.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (120, 1, 4, 36, 2, 178176, N'/Upload/pdf/Allotropes of carbon.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (121, 1, 4, 36, 2, 30960, N'/Upload/pdf/Versatile nature of carbon.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (122, 1, 4, 36, 2, 245804, N'/Upload/pdf/Saturated hydrocarbons and unsaturated hydrocarbons.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (123, 1, 4, 36, 2, 312508, N'/Upload/pdf/Homologous Series.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (124, 1, 4, 36, 2, 14640, N'/Upload/pdf/Nomenclature of carbon compounds.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (125, 1, 4, 36, 2, 54019, N'/Upload/pdf/Chemical properties of carbon compounds.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (126, 1, 4, 36, 2, 81667, N'/Upload/pdf/Important carbon compounds-Ethanol and Ethanoic acid.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (127, 1, 4, 36, 2, 98034, N'/Upload/pdf/Soaps and detergents.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (128, 1, 7, 61, 3, 15505, N'/Upload/pdf/Importance of Chemistry.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (129, 1, 7, 61, 3, 36489, N'/Upload/pdf/Matter and its classification.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (130, 1, 7, 61, 3, 23415, N'/Upload/pdf/Laws of chemical combination.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (131, 1, 7, 61, 3, 12457, N'/Upload/pdf/Dalton Atomic Theory.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (133, 1, 7, 61, 3, 19893, N'/Upload/pdf/Atomic mass  and Molar mass.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (134, 1, 7, 61, 3, 22593, N'/Upload/pdf/Mole Concept.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (135, 1, 7, 61, 3, 13735, N'/Upload/pdf/Percentage Composition.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (136, 1, 7, 61, 3, 17443, N'/Upload/pdf/Empirical formula and molecular formula.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (137, 1, 7, 61, 3, 32242, N'/Upload/pdf/Stoichiometry and calculations based on stoichiometry.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (138, 1, 2, 1, 1, 13190, N'/Upload/pdf/Matter- Its Nature and Behavior.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (139, 1, 2, 1, 1, 211529, N'/Upload/pdf/Physical classification of Matter.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (140, 1, 2, 1, 1, 212517, N'/Upload/pdf/Characteristics of matter.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (141, 1, 2, 1, 1, 211647, N'/Upload/pdf/States of Matter.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (142, 1, 2, 1, 1, 197199, N'/Upload/pdf/Change of state.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (143, 1, 2, 2, 1, 12415, N'/Upload/pdf/Introduction -Is matter around us pure.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (144, 1, 2, 2, 1, 294667, N'/Upload/pdf/Pure substances-Elements and compounds..html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (145, 1, 2, 2, 1, 14867, N'/Upload/pdf/Impure substances-Mixtures..html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (146, 1, 2, 2, 1, 96773, N'/Upload/pdf/Solution, colloidal solution and suspension..html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (147, 1, 2, 2, 1, 218763, N'/Upload/pdf/Separating the components of a mixture..html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (148, 1, 2, 3, 1, 12637, N'/Upload/pdf/Introduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (149, 1, 2, 3, 1, 35237, N'/Upload/pdf/Laws of chemical combination.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (150, 1, 2, 3, 1, 144473, N'/Upload/pdf/Atoms and molecules..html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (151, 1, 2, 3, 1, 123388, N'/Upload/pdf/Atomic mass.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (152, 1, 2, 3, 1, 294617, N'/Upload/pdf/Writing chemical formulae..html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (153, 1, 2, 3, 1, 43696, N'/Upload/pdf/Molecular mass and mole concept.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (154, 1, 2, 5, 1, 13973, N'/Upload/pdf/Introduction- Motion.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (155, 1, 2, 5, 1, 29336, N'/Upload/pdf/Distance and Displacement.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (156, 1, 2, 5, 1, 13990, N'/Upload/pdf/Speed and velocity..html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (157, 1, 2, 5, 1, 12774, N'/Upload/pdf/Acceleration.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (158, 1, 2, 5, 1, 34269, N'/Upload/pdf/Uniform and Non-uniform motion.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (159, 1, 2, 5, 1, 57316, N'/Upload/pdf/Graphical representation of accelerated motion.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (160, 1, 2, 5, 1, 39145, N'/Upload/pdf/Derivation of equations of motion by graphical method.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (161, 1, 4, 29, 2, 53754, N'/Upload/pdf/INTRODUCTION - Oersteds Experiment.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (162, 1, 4, 29, 2, 38083, N'/Upload/pdf/Magnetic field and Magnetic field lines.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (163, 1, 4, 29, 2, 209571, N'/Upload/pdf/Magnetic field due to a current carrying circular coil.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (164, 1, 4, 29, 2, 169160, N'/Upload/pdf/Magnetic field due to a current carrying solenoid.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (165, 1, 4, 29, 2, 41981, N'/Upload/pdf/Electric Motor.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (166, 1, 4, 29, 2, 91214, N'/Upload/pdf/Electro-magnetic Induction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (167, 1, 4, 29, 2, 38835, N'/Upload/pdf/Electric Generator.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (168, 1, 4, 29, 2, 12115, N'/Upload/pdf/Domestic electric circuits.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (169, 1, 4, 28, 2, 13183, N'/Upload/pdf/Introduction To Electricity.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (170, 1, 4, 28, 2, 27170, N'/Upload/pdf/Electric Current And Circuit.html')
GO
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (171, 1, 4, 28, 2, 12659, N'/Upload/pdf/Electric Potential and Potential Difference.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (172, 1, 4, 28, 2, 33830, N'/Upload/pdf/OHMS Law.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (173, 1, 4, 28, 2, 13146, N'/Upload/pdf/Resistance and the factors on which it depends.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (174, 1, 4, 28, 2, 43444, N'/Upload/pdf/Resistance in series and parallel.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (175, 1, 4, 28, 2, 12828, N'/Upload/pdf/Heating effect of electric current.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (176, 1, 4, 28, 2, 13062, N'/Upload/pdf/Electric Power.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (178, 1, 2, 11, 1, 13359, N'/Upload/pdf/Introduction . The Fundamental Unit of Life.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (183, 1, 2, 11, 1, 19876, N'/Upload/pdf/Cell Theory.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (185, 1, 2, 11, 1, 478067, N'/Upload/pdf/Types Of Cells.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (186, 1, 2, 11, 1, 20609, N'/Upload/pdf/Structure Of Cell.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (187, 1, 2, 11, 1, 659511, N'/Upload/pdf/Cell Organelles and Cell Inclusion.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (188, 1, 2, 12, 1, 15880, N'/Upload/pdf/Introduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (189, 1, 2, 12, 1, 315926, N'/Upload/pdf/Plant Tissue.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (190, 1, 2, 12, 1, 346846, N'/Upload/pdf/Animal Tisuue.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (191, 1, 2, 14, 1, 16220, N'/Upload/pdf/Health And Diseases-Introduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (192, 1, 2, 14, 1, 18066, N'/Upload/pdf/Community Health.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (193, 1, 2, 14, 1, 17188, N'/Upload/pdf/Types of Diseases and Its Causes.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (194, 1, 2, 14, 1, 928994, N'/Upload/pdf/Micro Organisms.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (195, 1, 2, 14, 1, 245474, N'/Upload/pdf/Infectious Diseases and treatments.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (196, 1, 2, 14, 1, 245474, N'/Upload/pdf/Infectious Diseases and treatments.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (197, 1, 2, 13, 1, 18116, N'/Upload/pdf/Introduction. Biological Diversity.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (198, 1, 2, 13, 1, 19849, N'/Upload/pdf/Classification.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (199, 1, 2, 13, 1, 1442094, N'/Upload/pdf/Five kingdom classification.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (200, 1, 2, 13, 1, 980415, N'/Upload/pdf/Phylum.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (201, 1, 2, 13, 1, 673712, N'/Upload/pdf/Cold Blodded Animals.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (202, 1, 2, 13, 1, 288020, N'/Upload/pdf/Warm blodded animals.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (203, 1, 2, 13, 1, 16909, N'/Upload/pdf/Nomenclature.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (204, 1, 4, 40, 2, 17280, N'/Upload/pdf/Introduction - Reproduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (205, 1, 4, 40, 2, 421850, N'/Upload/pdf/Asexual Reproduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (206, 1, 4, 40, 2, 330390, N'/Upload/pdf/Sexual Reproduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (207, 1, 4, 40, 2, 18971, N'/Upload/pdf/Sexual Reproduction in Flowering Plants.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (208, 1, 4, 40, 2, 150971, N'/Upload/pdf/Reproduction in Human Beings.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (209, 1, 4, 40, 2, 19226, N'/Upload/pdf/Reproductive Health.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (210, 1, 4, 41, 2, 17807, N'/Upload/pdf/Introduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (211, 1, 4, 41, 2, 16409, N'/Upload/pdf/Types of Variation.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (212, 1, 4, 41, 2, 17709, N'/Upload/pdf/Monohybrid Cross.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (213, 1, 4, 41, 2, 213316, N'/Upload/pdf/Mendels DIhybrid Cross.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (214, 1, 4, 41, 2, 181811, N'/Upload/pdf/Evolution and Classification.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (215, 1, 4, 39, 2, 16787, N'/Upload/pdf/Introduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (216, 1, 4, 39, 2, 106349, N'/Upload/pdf/Nervous System.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (217, 1, 4, 39, 2, 175490, N'/Upload/pdf/Endocrine System.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (218, 1, 4, 39, 2, 128750, N'/Upload/pdf/Plant  Movements.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (219, 1, 4, 39, 2, 49814, N'/Upload/pdf/Plant Hormones.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (220, 1, 4, 38, 2, 14648, N'/Upload/pdf/Introduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (221, 1, 4, 38, 2, 36070, N'/Upload/pdf/Modes of Nutrition.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (222, 1, 4, 38, 2, 73960, N'/Upload/pdf/Human Digestive System.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (223, 1, 4, 38, 2, 68730, N'/Upload/pdf/Respiration.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (224, 1, 4, 38, 2, 27153, N'/Upload/pdf/Photosynthesis.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (225, 1, 4, 38, 2, 77246, N'/Upload/pdf/Excretion.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (226, 1, 4, 38, 2, 97232, N'/Upload/pdf/Human Heart.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (227, 1, 4, 31, 2, 15272, N'/Upload/pdf/Introduction-Environment.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (228, 1, 4, 31, 2, 238290, N'/Upload/pdf/Types of Ecosystem.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (229, 1, 4, 31, 2, 317406, N'/Upload/pdf/Food chain and food web.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (230, 1, 4, 31, 2, 19823, N'/Upload/pdf/Ozone layer.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (233, 1, 7, 68, 3, 14433, N'/Upload/pdf/Introduction - Redox Reaction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (234, 1, 7, 68, 3, 116656, N'/Upload/pdf/What is Oxidation and Reduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (235, 1, 7, 68, 3, 15575, N'/Upload/pdf/Oxidation state Or Oxidation Number.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (236, 1, 7, 68, 3, 87827, N'/Upload/pdf/Balancing Of Redox Reactions.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (237, 1, 7, 65, 3, 62640, N'/Upload/pdf/States of Matter - Introduction.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (238, 1, 7, 65, 3, 44085, N'/Upload/pdf/State Of a Gas.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (239, 1, 7, 65, 3, 37543, N'/Upload/pdf/Boyles Law.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (240, 1, 7, 65, 3, 169458, N'/Upload/pdf/Charles Law.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (241, 1, 7, 65, 3, 78044, N'/Upload/pdf/Avogadros Law.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (242, 1, 7, 65, 3, 16110, N'/Upload/pdf/COMBINED GAS LAW -IDEAL GAS EQUATION.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (243, 1, 7, 65, 3, 41323, N'/Upload/pdf/DALTON’S LAW OF PARTIAL PRESSURES.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (244, 1, 7, 65, 3, 99006, N'/Upload/pdf/GRAHAM’S LAW OF DIFFUSION.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (245, 1, 7, 65, 3, 59546, N'/Upload/pdf/KINETIC THEORY OF GASES.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (246, 1, 7, 65, 3, 115120, N'/Upload/pdf/MOLECULAR DISTRIBUTION OF SPEEDS (MAXWELL-BOLTZMANN DISTRIBUTION).html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (247, 1, 7, 65, 3, 125832, N'/Upload/pdf/BEHAVIOUR OF REAL GASES.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (248, 1, 7, 65, 3, 76175, N'/Upload/pdf/CRITICAL PHENOMENA-LIQUEFACTION OF GASES.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (249, 1, 7, 64, 3, 15390, N'/Upload/pdf/Introduction -  chemical Bonding.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (250, 1, 7, 64, 3, 110872, N'/Upload/pdf/Ionic Bonding.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (251, 1, 7, 64, 3, 14009, N'/Upload/pdf/Characteristics of ionic compounds.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (252, 1, 7, 64, 3, 16248, N'/Upload/pdf/Fajan’s rule-Polarisation.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (253, 1, 7, 64, 3, 171531, N'/Upload/pdf/Covalent Bond.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (254, 1, 7, 64, 3, 147096, N'/Upload/pdf/Valence Bond Theory (VBT).html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (255, 1, 7, 64, 3, 411963, N'/Upload/pdf/Valence Shell Electron Pair Repulsion Theory.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (256, 1, 7, 64, 3, 288416, N'/Upload/pdf/Hybridization and types Of Hybridisation.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (257, 1, 7, 64, 3, 18729, N'/Upload/pdf/Properties of Covalent Bond.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (258, 1, 7, 62, 3, 113206, N'/Upload/pdf/Dalton’s Atomic Theory.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (259, 1, 7, 62, 3, 244487, N'/Upload/pdf/Rutherford’s Model Of Atom.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (260, 1, 7, 62, 3, 38560, N'/Upload/pdf/Bohr’s Atomic Model.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (261, 1, 7, 62, 3, 814009, N'/Upload/pdf/Electronic Magnetic Radiation and Atomic Spectrum.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (262, 1, 7, 62, 3, 21241, N'/Upload/pdf/Planck’s Quantum Theory.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (263, 1, 7, 62, 3, 59096, N'/Upload/pdf/Photoelectric Effect.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (264, 1, 7, 62, 3, 119971, N'/Upload/pdf/Hydrogen Spectrum.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (265, 1, 7, 62, 3, 38729, N'/Upload/pdf/Wave Particle Duality De-Broglie Concept.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (266, 1, 7, 62, 3, 14384, N'/Upload/pdf/Heisenberg’s Uncertainty Principle.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (267, 1, 7, 62, 3, 30390, N'/Upload/pdf/Quantum Numbers.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (268, 1, 7, 66, 3, 15735, N'/Upload/pdf/INTRODUCTION-BASIC TERMS IN THERMODYNAMICS.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (269, 1, 7, 66, 3, 13837, N'/Upload/pdf/Thermodynamic Process and Its Types.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (270, 1, 7, 66, 3, 13771, N'/Upload/pdf/INTERNAL ENERGY OF A SYSTEM, U.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (271, 1, 7, 66, 3, 14088, N'/Upload/pdf/HEAT AND WORK MODES OF ENERGY TRANSFER.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (272, 1, 7, 66, 3, 14080, N'/Upload/pdf/FIRST LAW OF THERMODYNAMICS.html')
INSERT [dbo].[tblmaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filesize], [filename]) VALUES (273, 1, 7, 66, 3, 36757, N'/Upload/pdf/CONCEPT OF REVERSIBILITY.html')
SET IDENTITY_INSERT [dbo].[tblmaterial] OFF
SET IDENTITY_INSERT [dbo].[tblquestionSyllabus] ON 

INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (1, 3, 2, 1, 634939, N'/Upload/Syllabus/CLASS_-_IX_-_SCIENCE.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (2, 3, 3, 1, 573859, N'/Upload/Syllabus/class_IX_mathematics.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (3, 3, 4, 2, 588030, N'/Upload/Syllabus/CLASS_X_-SCIENCE.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (4, 3, 5, 2, 567616, N'/Upload/Syllabus/CLASS_X_MATHEMATICS.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (5, 3, 6, 3, 710224, N'/Upload/Syllabus/class_11th_-Physics.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (6, 3, 7, 3, 563010, N'/Upload/Syllabus/class_-XI_-Chemistry.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (7, 3, 8, 3, 481990, N'/Upload/Syllabus/Class_XI-_Biology.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (8, 3, 9, 3, 561450, N'/Upload/Syllabus/class-_XI-_Mathematics.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (9, 3, 10, 4, 596327, N'/Upload/Syllabus/CLASS_XII_-_PHYSICS.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (10, 3, 11, 4, 560899, N'/Upload/Syllabus/CLASS___XII__CHEMISTRY.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (11, 3, 12, 4, 477864, N'/Upload/Syllabus/CLASS_XII-BIOLOGY.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (12, 3, 13, 4, 583741, N'/Upload/Syllabus/CLASS-XII_-_MATHEMATICS.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (13, 4, 11, 4, 107779, N'/Upload/QuestionPapers/CBSE CHEMISTRY PAPER 12th for  2017.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (14, 4, 11, 4, 208413, N'/Upload/QuestionPapers/CBSE CHEMISTRY PAPER 12th for 2016.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (15, 4, 11, 4, 97349, N'/Upload/QuestionPapers/CBSE CHEMISTRY PAPER 12th for 2015.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (16, 4, 11, 4, 301231, N'/Upload/QuestionPapers/CBSE CHEMISTRY PAPER 12th for 2014.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (17, 4, 11, 4, 3863096, N'/Upload/QuestionPapers/CBSE CHEMISTRY PAPER 12th FOR 2013.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (18, 4, 4, 2, 326887, N'/Upload/QuestionPapers/CBSE SCIENCE Class 10  PAPER FOR 2017.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (19, 4, 4, 2, 180356, N'/Upload/QuestionPapers/CBSE SCIENCE Class 10  PAPER FOR 2016.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (20, 4, 4, 2, 302824, N'/Upload/QuestionPapers/CBSE SCIENCE Class 10  PAPER FOR 2015.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (21, 4, 4, 2, 8131265, N'/Upload/QuestionPapers/CBSE SCIENCE Class 10  PAPER FOR 2013.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (22, 4, 11, 4, 475269, N'/Upload/QuestionPapers/CBSE SAMPLE QUESTION PAPER  for chemistry 12th.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (23, 4, 4, 2, 1576135, N'/Upload/QuestionPapers/SAMPLE QUESTION PAPER SCIENCE FOR 10TH.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (25, 3, 11, 4, 223848, N'/Upload/Syllabus/CBSE CHEMISTRY  syllabus.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (26, 4, 7, 3, 115854, N'/Upload/QuestionPapers/Sample paper CBSE  Class 11 Chemistry.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (27, 4, 7, 3, 272964, N'/Upload/QuestionPapers/SAMPLE PAPER CHEMISTRY CBSE CLASS-11.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (28, 4, 14, 5, 7265713, N'/Upload/QuestionPapers/NEET 2018-Question paper.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (29, 4, 11, 4, 421596, N'/Upload/QuestionPapers/Surface chemistry Solved Questions NEET.pdf')
INSERT [dbo].[tblquestionSyllabus] ([id], [typeid], [subjectid], [classid], [filesize], [filename]) VALUES (30, 4, 11, 4, 560370, N'/Upload/QuestionPapers/Electrochemistry Solved Question Paper.pdf')
SET IDENTITY_INSERT [dbo].[tblquestionSyllabus] OFF
SET IDENTITY_INSERT [dbo].[tblsubject] ON 

INSERT [dbo].[tblsubject] ([subjectid], [subjectname], [classid]) VALUES (2, N'Science', 1)
INSERT [dbo].[tblsubject] ([subjectid], [subjectname], [classid]) VALUES (4, N'Science', 2)
INSERT [dbo].[tblsubject] ([subjectid], [subjectname], [classid]) VALUES (7, N'Chemistry', 3)
INSERT [dbo].[tblsubject] ([subjectid], [subjectname], [classid]) VALUES (11, N'Chemistry', 4)
INSERT [dbo].[tblsubject] ([subjectid], [subjectname], [classid]) VALUES (14, N'chemistry', 5)
SET IDENTITY_INSERT [dbo].[tblsubject] OFF
SET IDENTITY_INSERT [dbo].[tbltitle] ON 

INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (1, N'Bonding in carbon compounds', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (2, N'catenation', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (3, N'classification of hydrocarbons', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (4, N'Alkanes', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (5, N'Alkenes', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (6, N'Alkynes', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (7, N'IUPAC Part 1', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (8, N'IUPAC part 2', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (9, N'IUPAC-3', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (10, N'Homologous series', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (11, N'Functional groups', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (12, N'Types of reactions in organic compounds', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (13, N'The Solid state', 42)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (14, N'Calculation of number of particles per unit cell', 42)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (15, N'Classification of Solids', 42)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (16, N'Close packing in crystals', 42)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (17, N'Crystal Lattice and Unit Cells', 42)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (18, N'Imperfection in solids', 42)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (19, N'Packing efficiency or Packing Fraction', 42)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (20, N'Properties of solids', 42)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (21, N'Tetrahedral and Octahedral voids', 42)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (22, N'Electrochemistry-introduction', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (23, N'Application of Electrochemical series', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (24, N'Batteries', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (25, N'Cell potential,EMF OF CELL', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (26, N'Conductance of Solution, electrolytic conductance', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (27, N'Conductors and Non Conductors, electrolyte', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (28, N'Effect of concentration on Conductance', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (29, N'EFFECT OF CONCENTRATION ON ELECTRODE POTENTIAL(nernst equation)', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (30, N'Electrochemical Series', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (31, N'Electrode Potential', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (32, N'Electrolytic Cell', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (33, N'Faradays laws of electrolysis', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (34, N'Galvanic cell', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (35, N'Kohlrausch law', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (36, N'Measurement of the standard electrode potential, refrence electrode', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (37, N'Spontaneity of a reaction', 43)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (38, N'introduction', 33)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (39, N'introduction', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (40, N'Covalent bonding in carbon compounds.', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (41, N'Introduction.', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (42, N'Conductors and Non Conductors', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (43, N'Galvanic cell', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (44, N'Electrode Potential: WHAT IS ELECTRODE POTENTIAL ?', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (45, N'Measurement of the standard electrode potential (Eo):Reference Electrode', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (46, N'Cell potential / E.m.f. of cell', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (47, N'Electrochemical Series', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (48, N'Applications of Electrochemical Series', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (49, N'Spontaneity of a reaction (Relation     between Emf and Gibb’s free energy)', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (50, N'EFFECT OF CONCENTRATION ON ELECTRODE POTENTIAL (NERNST EQUATION):', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (51, N'Electrolytic Cell', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (52, N'Conductance of Solutions/ electrolytic conductance', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (53, N'Effect of concentration on Conductance', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (54, N'Kohlrausch’s law.', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (55, N'Faradays laws of electrolysis.', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (56, N'Batteries', 47)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (57, N'Chemical Reactions and Equations', 33)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (58, N'Chemical reactions', 33)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (59, N'Balancing of a chemical equation', 33)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (60, N'Types of chemical reactions', 33)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (61, N'Acids, Bases and Salts', 34)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (62, N'Acid-Base Indicators', 34)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (63, N'Definitions of acids and bases', 34)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (64, N'General properties of acids and Bases', 34)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (69, N'Strength of Acids and Bases', 34)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (70, N'pH scale', 34)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (71, N'Importance of pH in everyday life', 34)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (72, N'Salts, preparation and uses of Sodium Hydroxide', 34)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (73, N'Metals and non-metals', 35)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (74, N'Properties of metals and non-metals', 35)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (75, N'Reactivity series', 35)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (76, N'Formation and properties of ionic compounds', 35)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (77, N'Basic metallurgical processes', 35)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (78, N'Corrosion and its prevention', 35)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (79, N'Need for the classification of elements', 37)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (80, N'Early attempts at classification of elements', 37)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (81, N'Modern periodic table.', 37)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (82, N'Valency, Atomic number, Metallic and non-metallic properties', 37)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (83, N'Carbon and its compounds', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (84, N'Covalent bonding in carbon compounds', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (85, N'Allotropes of carbon', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (86, N'Versatile nature of carbon', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (87, N'Saturated hydrocarbons and unsaturated hydrocarbons', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (88, N'Homologous series', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (89, N'Nomenclature of carbon compounds containing functional groups', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (90, N'Chemical properties of carbon compounds', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (91, N'Ethanol and Ethanoic acid', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (92, N'Soaps and detergents', 36)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (93, N'Importance of Chemistry', 61)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (94, N'Nature of matter', 61)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (95, N'Laws of chemical combination', 61)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (97, N'Concept of elements, atoms and molecules', 61)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (99, N'Dalton s atomic theory', 61)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (100, N'Concept of elements, atoms and molecules', 61)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (101, N'Atomic and molecular masses', 61)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (102, N'Mole concept and molar mass', 61)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (103, N'Percentage composition', 61)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (104, N'Empirical and molecular formula', 61)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (105, N'Chemical reactions', 61)
GO
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (106, N'Stoichiometry and calculations based on stoichiometry', 61)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (107, N'Introduction-Matter', 1)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (108, N'Physical classification', 1)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (109, N'Characteristics of matter', 1)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (110, N'Characteristics of states of matter', 1)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (111, N'Change of state', 1)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (112, N'Introduction -Is matter around us pure', 2)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (113, N'Pure substances-Elements and compounds', 2)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (114, N'Impure substances-Mixtures', 2)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (115, N'Solution, colloidal solution and suspension', 2)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (116, N'Separating the components of a mixture', 2)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (117, N'Introduction', 3)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (118, N'Laws of chemical combination', 3)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (119, N'Atoms and molecules', 3)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (120, N'Atomic mass', 3)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (121, N'Writing chemical formulae', 3)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (122, N'Molecular mass and mole concept', 3)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (123, N'Introduction-Motion', 5)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (124, N'Distance and Displacement', 5)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (125, N'Speed and velocity', 5)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (126, N'Acceleration', 5)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (127, N'Uniform and Non-uniform motion', 5)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (128, N'Graphical representation of accelerated motion', 5)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (129, N'Derivation of equations of motion by graphical method', 5)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (130, N'Elementary idea of Uniform circular motion', 5)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (131, N'INTRODUCTION - Oersteds Experiment', 29)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (132, N'Magnetic field and Magnetic field lines', 29)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (134, N'Magnetic field due to a current carrying circular coil', 29)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (135, N'Magnetic field due to a current carrying solenoid', 29)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (136, N'Electric Motor', 29)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (137, N'Electro-magnetic Induction', 29)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (138, N'ELECTRIC GENERATOR', 29)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (139, N'Domestic electric circuits', 29)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (140, N'Introduction To Electricity', 28)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (141, N'Electric Current and Circuit', 28)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (142, N'Electric Potential and Potential Difference', 28)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (143, N'Ohm’S Law', 28)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (144, N'Resistance and the factors on which it depends', 28)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (145, N'Resistance in series and parallel', 28)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (146, N'Heating effect of electric current', 28)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (147, N'Electric Power', 28)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (148, N'Introduction', 11)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (149, N'Cell Theory', 11)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (150, N'Types of Cells', 11)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (151, N'Structure of Cell', 11)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (152, N'Cell Organelles', 11)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (153, N'Introduction', 12)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (154, N'Plant Tissues', 12)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (155, N'Animal Tissues', 12)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (156, N'Health and Diseases- Introduction', 14)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (157, N'Community Health', 14)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (158, N'Types of Diseases and Its Causes', 14)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (159, N'Micro-organisms', 14)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (160, N'Infectious Diseases', 14)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (161, N'National disease eradication programme', 14)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (162, N'BIOLOGICAL DIVERSITY - Introduction', 13)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (164, N'Classification', 13)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (165, N'Five kingdom classification', 13)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (166, N'Phylum', 13)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (167, N'Cold blooded organisms', 13)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (168, N'Warm blooded organisms', 13)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (169, N'Nomenclature', 13)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (170, N'Introduction', 40)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (171, N'Asexual Reproduction', 40)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (172, N'Sexual Reproduction', 40)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (173, N'Sexual Reproduction in Flowering Plants', 40)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (174, N'Reproduction in Human Beings', 40)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (175, N'Reproductive Health', 40)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (176, N'Introduction', 32)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (177, N'Introduction', 41)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (178, N'Types of Variation', 41)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (179, N'Monohybrid Cross', 41)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (180, N'Dihybrid Cross', 41)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (181, N'Evolution and Classification', 41)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (182, N'Introduction - Thermodynamics', 66)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (183, N'Introduction', 39)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (184, N'Nervous system', 39)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (185, N'Endocrine system', 39)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (186, N'Plant movement', 39)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (187, N'Plant hormones', 39)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (188, N'Introduction to life processes', 38)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (189, N'Modes of Nutrition', 38)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (190, N'Digestive system of Human', 38)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (191, N'Respiration', 38)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (192, N'Photosynthesis', 38)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (193, N'Excretion', 38)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (194, N'Human Heart', 38)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (195, N'Introduction: Environment', 31)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (196, N'Types of Ecosystem', 31)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (197, N'Food chain and Food Web', 31)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (198, N'Ozone layer', 31)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (201, N'Introduction - Redox reactions', 68)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (202, N'What is Oxidation and Reduction', 68)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (203, N'Oxidation State Or Oxidation Number', 68)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (204, N'Balancing Of Redox Reactions.', 68)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (205, N'States of Matter - Introduction', 65)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (206, N'gaseous state', 65)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (207, N'Boyles Law', 65)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (208, N'Charle''s Law', 65)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (209, N'Avogadros Law', 65)
GO
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (210, N'COMBINED GAS LAW -IDEAL GAS EQUATION', 65)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (211, N'DALTON’S LAW OF PARTIAL PRESSURES', 65)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (212, N'GRAHAM’S LAW OF DIFFUSION', 65)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (213, N'KINETIC THEORY OF GASES', 65)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (214, N'MOLECULAR DISTRIBUTION OF SPEEDS', 65)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (215, N'BEHAVIOR OF REAL GASES', 65)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (216, N'CRITICAL PHENOMENA: LIQUEFACTION OF GASES', 65)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (217, N'chemical Bonding -Introduction', 64)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (218, N'Ionic Bonding', 64)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (219, N'Characteristics of Ionic Compounds', 64)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (220, N'Fajan’s rule-Polarisation', 64)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (221, N'covalent Bonding', 64)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (222, N'Valence Bond Theory (VBT)', 64)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (223, N'Valence Shell Electron Pair Repulsion Theory', 64)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (224, N'Hybridization and types Of Hybridisation', 64)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (225, N'Properties of Covalent Bonds', 64)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (226, N'Dalton’s Atomic Theory', 62)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (227, N'Rutherford’s Model', 62)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (228, N'Bohr’s Atomic Model', 62)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (229, N'Electronic Magnetic Radiation and Atomic Spectrum', 62)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (230, N'Planck’s Quantum Theory', 62)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (231, N'Photoelectric Effect', 62)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (232, N'Hydrogen Spectrum', 62)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (233, N'Wave Particle Duality: De-Broglie Concept', 62)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (234, N'Heisenberg’s Uncertainty Principle', 62)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (235, N'Quantum Numbers', 62)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (236, N'Preparation of alkyl halides', 75)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (237, N'Properties of Alkyl halides SN1 and SN2', 75)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (238, N'Thermodynamic Process and Its types', 66)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (239, N'INTERNAL ENERGY OF A SYSTEM, U', 66)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (240, N'HEAT AND WORK: MODES OF ENERGY TRANSFER', 66)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (241, N'FIRST LAW OF THERMODYNAMICS', 66)
INSERT [dbo].[tbltitle] ([titleid], [titlename], [lessonid]) VALUES (242, N'CONCEPT OF REVERSIBILITY', 66)
SET IDENTITY_INSERT [dbo].[tbltitle] OFF
SET IDENTITY_INSERT [dbo].[tbltutorsubject] ON 

INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (1, N'Chemistry')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (2, N'Physics')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (3, N'Biology')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (4, N'Science')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (5, N'Mathematics')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (6, N'Statistics')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (7, N'Urdu')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (8, N'English')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (9, N'Arabic')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (10, N'Hindi')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (11, N'Islamic Studies')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (12, N'Accounting')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (13, N'Economics')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (14, N'Political Science')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (15, N'Education')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (16, N'History')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (17, N'Computer science')
INSERT [dbo].[tbltutorsubject] ([t_subjectid], [t_subjectname]) VALUES (18, N'Geography')
SET IDENTITY_INSERT [dbo].[tbltutorsubject] OFF
SET IDENTITY_INSERT [dbo].[tbltype] ON 

INSERT [dbo].[tbltype] ([typeid], [type]) VALUES (1, N'DOCUMENT')
INSERT [dbo].[tbltype] ([typeid], [type]) VALUES (3, N'SYLLABUS')
INSERT [dbo].[tbltype] ([typeid], [type]) VALUES (4, N'QUESTION PAPER')
SET IDENTITY_INSERT [dbo].[tbltype] OFF
SET IDENTITY_INSERT [dbo].[tblvideomaterial] ON 

INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (305, 2, 7, 67, 3, N'Hankm9wLCfc', N'Introduction - what is equillibrium')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (306, 2, 7, 67, 3, N'qCmU_1JU2W0', N'Physical and Chemical Equilibrium Examples')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (307, 2, 7, 67, 3, N'u4ifyrwhEd8', N'Characteristics Of Chemical equilibrium')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (308, 2, 7, 67, 3, N'nUFWpJJUros', N'Law of chemical equilibrium')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (309, 2, 7, 67, 3, N'yJ1Dow6PiMs', N'Equilibrium Constant- Important characteristics')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (310, 2, 7, 67, 3, N'meCF2h3H3kk', N'Le-Chatelier principle')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (313, 2, 7, 73, 3, N'0iMlRNjnbPE', N'What are alkanes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (314, 2, 7, 73, 3, N'qa2SFoX8pzw', N'Physical Properties of Alkanes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (315, 2, 7, 73, 3, N'FBJiAcv9EIY', N'Halogenation of Alkanes Part 1')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (316, 2, 7, 73, 3, N'up0QwqPB_pY', N'Halogenation of Alkanes Part 2')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (317, 2, 7, 73, 3, N'DCnL-87drmA', N'Conformational Isomers in Alkanes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (318, 2, 7, 73, 3, N'7bbXwz8eIOU', N'Geometrical Isomerism in Alkenes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (319, 2, 7, 73, 3, N'VVg4l9un4to', N'ELECTROPHILIC ADDITION REACTION')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (320, 2, 7, 73, 3, N'NR2IGm6IUes', N'REARRANEGEMENT REACTIONS OF CARBOCATIONS')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (321, 2, 7, 73, 3, N'_n7UTPFyDt4', N'Antimarkovnikov addition of HBr to alkenes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (322, 2, 7, 73, 3, N'rU8RSPT2P5U', N'HYDROGENATION OF ALKENES')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (323, 2, 7, 73, 3, N'32DWYmE7rwE', N'HALOGENATION OF ALKENES')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (324, 2, 7, 73, 3, N'GZajnuFNGuo', N'HYDRATION OF ALKENES')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (325, 2, 7, 73, 3, N'CRWk3DfMIM', N'Formation of halohydrin from alkenes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (326, 2, 7, 73, 3, N'fAACHU3FIWQ', N'Epoxidation and Anti-dihydroxylation')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (327, 2, 7, 73, 3, N'GN3DX0xZU6I', N'Halohydrin Formation Practice Problems')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (328, 2, 7, 73, 3, N'k6BgRd5qBr4', N'Reductive ozonolysis Of Alkenes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (329, 2, 7, 73, 3, N'g4wulRfFS6g', N'Electrophilic Addition Reactions')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (330, 2, 7, 73, 3, N'-FmPtsQ7I3s', N'ElectrophilicAddition Reactions')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (331, 2, 7, 73, 3, N'xSdLqX403Xk', N'ANTI MARKOWNIKOFF Addition')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (332, 2, 7, 73, 3, N'HziG1QyRrg8', N'Stability Of Alkenes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (333, 2, 7, 73, 3, N'yc1EqTGFrQI', N'What Are Aromatic Compounds')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (334, 2, 7, 73, 3, N'dlvumMt40mU', N'What Are Aromatic Compounds')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (335, 2, 7, 73, 3, N'Iqp_Rc7vHho', N'Numericals on Aromatic Compounds - NEET JEE Chemistry')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (336, 2, 7, 73, 3, N'IGgWdSojXEc', N'Electrophilic Aromatic Substitution Reacion - Mechanism')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (337, 2, 7, 73, 3, N'SFgKEaKU-HU', N'Halogenation and Nitration reactions')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (338, 2, 7, 73, 3, N'j1Wmg3PC_Zo', N'What are ortho-para and meta directing group')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (339, 2, 7, 73, 3, N'wqQkAmApiz4', N'Ortho-Para directing groups and Ring activators	')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (340, 2, 7, 73, 3, N'bheBE2FyOtI', N'Meta directing groups and Meta directing groups')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (341, 2, 7, 73, 3, N'YwWvctZ3F3c', N'Ring Activators and Ring Deactivators Numericals')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (342, 2, 7, 73, 3, N'RQEyL5FiphM', N'Electrophilic Attack on Disubstituted Benzenes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (343, 2, 11, 54, 4, N'm5_Mc1zT19Y', N'what are haloalkanes and haloarenes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (344, 2, 11, 54, 4, N'z40FgpgFpYg', N'Preparation of alkyl halides part 1')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (345, 2, 11, 54, 4, N'kSpseEhg_oc', N'Preparation of Alkyl Halides part2')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (346, 2, 11, 54, 4, N'FLEPsqdNSpI', N'Chemical Properties of alkyl halides - SN1 mechanism')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (347, 2, 11, 54, 4, N'ELbyMEd9IWU', N'Chemical Properties of alkyl halides - SN2 mechanism')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (348, 2, 11, 55, 4, N'KT8CzO3QL4Y', N'What are Alcohols and Phenols')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (349, 2, 11, 55, 4, N'vDKJa7ewEV0', N'Preparation of alcohols-Hydration of alkenes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (350, 2, 11, 55, 4, N'oqLwHBWTR5M', N'Alcohols from alkenes -by hydroboration-oxidation and oxymecuration -demercuration')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (351, 2, 11, 55, 4, N'o2rM39uq_S8', N'Preparation of Alcohols from aldehydes and ketones')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (352, 2, 11, 55, 4, N'ssQChbg5Kho', N'preparation of phenols from chlorobenzene , aniline and cumenes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (353, 2, 11, 55, 4, N'5OQJKkByjco', N'Acidic Nature of Alcohols and Phenols')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (354, 2, 11, 55, 4, N'wo4TQ8uRsHY', N'Reaction of Alcohols and Phenols with Active metals')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (355, 2, 11, 55, 4, N'Xo2IHR94S68', N'Esterfication Reaction and Acylation')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (356, 2, 11, 55, 4, N'AufJWmLVRpA', N'Reaction of Alcohols with Halogen acids')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (357, 2, 11, 55, 4, N'wSvTWp4FPWI', N'Mechanism of SN reactions')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (358, 2, 11, 55, 4, N'Elx6Ie-sySw', N'Reaction of Alcohols with PCl3 and PBr3')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (359, 2, 11, 55, 4, N'W8jdoZpBmJE', N'Dehydration of alcohols')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (360, 2, 11, 55, 4, N'75miSQ4L8bw', N'Oxidation of Alcohols')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (361, 2, 11, 56, 4, N'kV3YgqVyxFU', N'PREPARATION OF ALDEHYDES AND KETONES-OXIDATION OF ALCOHOLS')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (362, 2, 11, 56, 4, N'QyuDIPuf2EI', N'Aldehydes and Ketome from Gemdihalides')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (363, 2, 11, 56, 4, N'k34hECnNjFg', N'Aldehydes and Ketones from Nitriles')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (364, 2, 11, 56, 4, N'jvoaS8BtqIU', N'Preparationof aldehydes and ketones from acid Chlorides')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (365, 2, 11, 56, 4, N'gkl-XOkUFHo', N'Preparation of aldehydes and Ketones- OZONOLYSIS')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (366, 2, 11, 56, 4, N'9kQOZpnmsIc', N'Hydration Of Aldehydes And Ketones')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (367, 2, 11, 56, 4, N'aUVX5Tk4Vbg', N'Nucleophilic addition reactions of aldehydes and ketones')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (368, 2, 11, 56, 4, N'gtzmYJ3odXQ', N'Acetal formation from aldehydes and ketones')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (369, 2, 11, 56, 4, N'fEXSAbJVclM', N'Addition Of Grignard reagent to aldehydes and ketones')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (370, 2, 11, 56, 4, N'ngDs4I8zDFs', N'Addition of Ammonia derivatives to Aldehydes and Ketones')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (371, 2, 11, 56, 4, N'dkWuU9ld3rU', N'Reduction of Aldehydes and ketones- clemmensen reduction')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (372, 2, 11, 56, 4, N'hDIULjSppw8', N'Oxidation of Aldehydes and Ketones')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (373, 2, 11, 56, 4, N'l3LTycNRlRY', N'Aldol Condensation and Crossed Aldol condensation')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (374, 2, 11, 56, 4, N'9I4fq302Fls', N'Cannizzaro Reaction')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (375, 2, 11, 56, 4, N'WyFZmGbYBt0', N'preparation of carboxylic acids')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (376, 2, 11, 56, 4, N'jffiVcStGf8', N'Reaction of carboxylic acids with PCl5 andPCl3 and SOCl2')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (377, 2, 11, 56, 4, N'ioBgEpdbSqU', N'Physical Properties of Carboxylic Acids')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (378, 2, 11, 56, 4, N'e_O-ZMIJLUY', N'Acidic Nature of Carboxylic acids')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (379, 2, 11, 48, 4, N'tonlNepZm_c', N'Chemical Kinetics- Introduction')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (380, 2, 11, 48, 4, N'brygF9YU_zw', N'Rate of a Chemical reaction')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (381, 2, 11, 48, 4, N'uOp08XKuXCg', N'Rate of a Chemical Reaction part 2')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (382, 2, 11, 48, 4, N'3QEqMhdrxzw', N'Rate Law and Order Of Reaction')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (383, 2, 11, 48, 4, N'Fl_GuSPYJnk', N'Units Of Rate Constant')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (384, 2, 11, 48, 4, N'cFIcFCt3Ufk', N'Factors Affecting The Rate Of Reaction')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (385, 2, 11, 48, 4, N'I23qt24YQ0', N'Molecularity of a Reaction	')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (386, 2, 11, 48, 4, N'CTIpr6sEXu0', N'First Order Reaction and Zero Order Reaction')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (387, 2, 11, 48, 4, N'R3zaGucoQsg', N'Collision Theory part 1')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (388, 2, 11, 48, 4, N'FR56xd5nbbw', N'Collision Theory Part 2')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (389, 2, 11, 42, 4, N'1uuk3qSM__I', N'Introduction To Solids')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (390, 2, 11, 42, 4, N'FEDACMuQOj8', N'Crystalline and Amorphous Solids')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (391, 2, 11, 42, 4, N'R4lt1Ak7X6U', N'No of Atoms in a Simple Unit Cell')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (392, 2, 11, 42, 4, N'X7XITAF0cdE', N'Crystal Lattice and Unit Cell')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (393, 2, 11, 42, 4, N'sN39eK4a4Xg', N'No. of Atoms In a Body Centered Unit Cell')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (394, 2, 11, 42, 4, N'32k0i1mxil4', N'No. of Atoms In a Face Centered Unit cell')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (395, 2, 11, 42, 4, N'JzZffFB4vLg', N'Close Packing In Crystalline Solids')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (396, 2, 11, 45, 4, N'ekAhUhPVp2U', N'Solution - Introduction')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (397, 2, 11, 45, 4, N'thJP5goK8io', N'Molarity of a solution')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (398, 2, 11, 45, 4, N'CDhIe_tuh54', N'Percentage and Strength of a Solution')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (399, 2, 11, 45, 4, N'gXLxz0B8Yws', N'Molality of a Solution')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (400, 2, 11, 45, 4, N'tgIT6kG5GeI', N'Normality of a Solution')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (401, 2, 11, 45, 4, N'Qr0QQcg0s1M', N'Mole Fraction Mass Fraction and Ppm')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (402, 2, 11, 45, 4, N'5vEda-7kkOk', N'What is Vapour Pressure of a Liquid')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (403, 2, 11, 45, 4, N'P1D60giH1f8', N'Solubility of Gases In liquids - Henrys Law')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (404, 2, 11, 45, 4, N'xt7RcEu1jz4', N'Types of non-ideal solution : class 12 cbse')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (405, 2, 11, 45, 4, N'BVgDiIyJrxY', N'what are colligative properties')
GO
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (406, 2, 7, 64, 3, N'q0wo4vNhB8I', N'what is a chemical bond')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (407, 2, 7, 64, 3, N'dURry-g8xoY', N'How Ionic Bond Is Formed')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (408, 2, 7, 64, 3, N'jMTZFXOgq0Q', N'Lattice energy')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (409, 2, 7, 64, 3, N'qIyvcGvznbw', N'Properties Of Ionic Compounds')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (410, 2, 7, 64, 3, N'nnfOsKwbx4w', N'How a Covalent Bond Is Formed')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (411, 2, 7, 64, 3, N'E9-aItz1b48', N'Fajans Rule')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (412, 2, 7, 64, 3, N'yBv-TblRfYQ', N'VSEPR Theory part 1')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (413, 2, 7, 64, 3, N'ZtCAhckWAc4', N'VSEPR theory part 2')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (414, 2, 7, 64, 3, N'HDha3UHkiVk', N'VSEPR Theory part 3')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (415, 2, 7, 64, 3, N'4qvgF3BzG3o', N'Polar and Non-Polar bonds')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (416, 2, 7, 64, 3, N'knym-3irLZ4', N'Dipole moment')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (417, 2, 7, 66, 3, N'R_wElQZrZP0', N'thermodynamics introduction')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (418, 2, 7, 66, 3, N'XJw8C3OvVgo', N'System and Surroundings')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (419, 2, 7, 66, 3, N'THIDdxAeQsM', N'State of a System, State Variables')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (420, 2, 7, 66, 3, N'sDPekyVM-bk', N'Extensive and Intensive Properties')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (421, 2, 7, 66, 3, N'9KFYGFSkFZU', N'Thermodynamic Process and its Types')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (422, 2, 7, 66, 3, N'a1PbitVARAw', N'What is Internal Energy')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (423, 2, 7, 66, 3, N'M7rSKlom7RA', N'First Law of Thermodynamics')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (424, 2, 7, 66, 3, N'GmXAdC8_5Fs', N'First law of thermodynamic - NUMERICALS')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (425, 2, 7, 66, 3, N'r4mo4D-6kM8', N'Thermochemistry and Thermochemical equation')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (426, 2, 7, 66, 3, N'RBjIpGuDWpA', N'Hess(s) Law of Constant Heat Summation')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (427, 2, 7, 66, 3, N'CifkfkKvvH0', N'Enthalpy of solution')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (428, 2, 7, 66, 3, N'l17Xd7C06Oc', N'Enthalpy of Neutralisation')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (429, 2, 7, 66, 3, N'gmOa2QXR6Hg', N'Heat Of Atomisation')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (430, 2, 7, 66, 3, N'VAE8x4uYNDo', N'Bond Enthalpy and Enthalpy of a Reaction')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (431, 2, 7, 62, 3, N'6UJPNnMrFSM', N'Discovery of Electron- J.J. Thomson')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (432, 2, 7, 62, 3, N'2VqNiFtiD44', N'Discovery of Proton')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (433, 2, 7, 62, 3, N'yHJXe8p56lc', N'Planks Quantum Theory')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (434, 2, 7, 62, 3, N'h_NxluciiBg', N'Photoelectric Effect')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (435, 2, 7, 62, 3, N'WRBFy-hYGRM', N'Bohrs(s)Model Of Atom - Postulates')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (436, 2, 7, 62, 3, N'0_Pq-EHgSvI', N'Energy of electron in the bohr atom')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (437, 2, 7, 62, 3, N'mK98CsV6bF8', N'Calculation of radius of Orbit in H-atom')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (438, 2, 7, 61, 3, N'CnYsfekpOaE', N'Atomic Mass and Average Atomic Mass')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (439, 2, 7, 61, 3, N'wHIwUPO8tAI', N'Mole Concept part 1')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (440, 2, 7, 61, 3, N'qeR0zoAdk5Q', N'Mole Concept Part 2')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (441, 2, 7, 61, 3, N'wqIYh9dGeqI', N'Stoichiometry Part 1')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (442, 2, 7, 61, 3, N'AfJ7KeKDhoo', N'Stoichiometry part 2')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (443, 2, 7, 61, 3, N'1KFSOW1_es4', N'Limiting Reagent part 1')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (444, 2, 7, 61, 3, N'RgCbScvuUiQ', N'Limiting Reagent part 2')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (445, 2, 7, 72, 3, N'JhU0enuUtYY', N'IUPAC nomenclature part 1')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (446, 2, 7, 72, 3, N'Dga7QTlaBSU', N'IUPAC nomenclature part 2')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (447, 2, 7, 72, 3, N'tn6xhq50--Q', N'IUPAC nomenclature of bicyclo and spiro compounds')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (448, 2, 7, 72, 3, N'NYLdAag9Um4', N'IUPAC nomenclature of cycloalkanes')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (449, 2, 7, 72, 3, N'wKuLKMnC4qc', N'Reaction Mechanism and Bond fission')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (450, 2, 7, 72, 3, N'teEcnLpmcVc', N'Types of Attacking Reagents')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (451, 2, 7, 72, 3, N'DkHOFyOI3tI', N'Reaction Intermediates')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (452, 2, 7, 67, 3, N'dWH7d1WvFNI', N'Effect of pressure on chemical equilibrium')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (453, 2, 7, 67, 3, N'ZjNn8bPDbn4', N'Effect of temperature on equilibrium ')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (454, 2, 7, 67, 3, N'NnPk81ByBRM', N'Effect of iner gas on chemical equilibrium')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (455, 2, 7, 67, 3, N'd7FJTcla5JA', N'Arrehenius Concept Of Acids and Bases')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (456, 2, 7, 67, 3, N'FZOgcsAVnkE', N'Bronsted-Lowery concept of acids and bases')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (457, 2, 7, 67, 3, N'rY5ZbjAEj_A', N'Lewis acid base concept')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (458, 2, 7, 67, 3, N'y7PJ0UplnW0', N'Conjugate Acid-base')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (463, 2, 7, 67, 3, N'3_W0cTvD7ZY', N'common ion effect')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (464, 2, 7, 67, 3, N'xYoJbIT81W0', N'Ostwalds Dilution Law')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (465, 2, 7, 67, 3, N'3zVvohL8-bQ', N'Ionic product of water ')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (466, 2, 7, 67, 3, N'JUXInzLTFhc', N'pH definitions')
INSERT [dbo].[tblvideomaterial] ([id], [typeid], [subjectid], [lessonid], [classid], [filename], [title]) VALUES (467, 2, 7, 67, 3, N'MouP94XwV98', N'PH-scale')
SET IDENTITY_INSERT [dbo].[tblvideomaterial] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (1, N'Bilal Ahmad Khwaja', N'chemicalbilal@rediffmail.com', 9419406898, N'cjmbmlixbkbA2', 3, 0, 0, 844841283, 24, CAST(N'2018-09-08 02:02:28.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (2, N'bilal ahmad', N'bilalkhaja15@gmail.com', 9086909262, N'bcde2345', 2, 0, 0, 1341494404, 24, CAST(N'2018-06-24 20:20:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (3, N'mshafimir', N'mohamad.shafi230@gmail.c7om', 7006978264, N'wpln2A$%', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (9, N'adil bashir', N'adilbashir36@gmail.com', NULL, N'jwboA3322', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (10, N'Umer', N'umer@gmail.com', 0, N'VnfsA2', 2, 0, 0, NULL, NULL, NULL, 4, NULL, N'', N'', N'', NULL, NULL, N'')
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (11, N'USAMA BUBERE', N'bubereusama28@gmail.com', NULL, N':748247156', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (12, N'fawazpw', N'fawazpw@hotmail.com', NULL, N'gbxb{3114', 2, 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (13, N'kkkmeme', N'awesomepayam@gmail.com', NULL, N'qbzbn442', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (17, N'Ananya R', N'ananyar6.5@gmail.com', NULL, N'rxfsuz', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (20, N'Muzamil', N'Muzamilonpeace0000@gmail.com', NULL, N'95:2137::8', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (22, N'Chinnu', N'akhilaficel2@gmail.com', NULL, N'gvmmnbslt211', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (23, N'Ruchi', N'Ruchi.srivastava27@gmail.com', 8088843071, N'bskvoA2:95', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (24, N'Farooq dar', N'Farooqchm101@gmail.com', 8491841544, N'gbsppr22', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (25, N'BILAL', N'bilalchem84@gmail.com', 9906631922, N'c::177bo', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (26, N'Rafia Bashir', N'drrafiabashir@gmail.com', 9622738204, N'difnjtusz234', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (27, N'Moomin Ahmad ', N'Muin19@hotmail.com', 919906966771, N'citAhq234', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (28, N'Dar Muzafar', N'darmuzaffar12079@gmail.com', 7006711586, N':6:71556:8', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (29, N'Mansha', N'', NULL, N'nbotib', 2, 5, 1, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (30, N'ratikanta', N'rsaha.chem@gmail.com', 8763834892, N'23456789:', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (32, N'Wasif Zahoor', N'wasifzahoor87@gmail.com', 3129605306, N'Xbtjg3::8376', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (33, N'Muzmil', N'Muzamilqayoom360@rediffmail.com', 9622737749, N'95:2137::8', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (34, N'Mohmad shafi ', N'shafi06amu@gmail.com', 9419026288, N'mfduvsft', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (35, N'Nida', N'nidaarshid11@gmail.com', 9906651032, N'65432', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (36, N'Aijazshah', N'Shahaijazrasool111@gmail.com', 9906611270, N'tibiABjkb{96', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (37, N'Rouf Beigh', N'mohdrouf786@gmail.com', 9419014578, N'13214114439', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (38, N'ASHIQ HUSSAIN TANTRAY', N'Ashiqtantray@123gmail.com', 7006063071, N'btijrA234', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (39, N'fayaz', N'fayazwani5@gmail.con', 7298877508, N'gbzb{234', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (40, N'Javid', N'javidmakhami@gmail.com', 7298950406, N'kbwje897', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (41, N'MudasirM', N'mudasirmehraj13@gmail.com', 9796930437, N'{ppmphz', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (42, N'thaimike', N'mikelmersi@hotmail.com', NULL, N'tfoh2:71hfz', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (43, N'DPABITRA', N'dpabitra92@gmail.com', NULL, N'23456rxf', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (44, N'Anzar Bashir', N'sanxarb191113@gmail.com', NULL, N'3589569', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (45, N'Aabid', N'bashirrrabiddd100@gmail.com', NULL, N'bgsfffeij', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (55, N'Bilal Ahmad Mir', N'bilaliitm@gmail.com', NULL, N'444445621', 2, 2, 0, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (56, N'Aamir', N'Maamir098@gmail.com', NULL, N'mpof234', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (57, N'Hanzal', N'hanzal645@gmail.com', NULL, N'ibo{bmcibu', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (58, N'Anzar Bashir', N'sanxarb9055@gmail.com', NULL, N'3589569', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (59, N'shabir ahmad', N'njrshabir787@gmail.com', NULL, N'okstibcjs', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (60, N'Kaiser lone', N'Kaiserlone122@gmail.com', NULL, N'lbtjsAml', 2, 4, 0, 1049143859, 24, CAST(N'2018-06-22 10:35:03.000' AS DateTime), 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (61, N'Shahid nazir khan', N'khansalman9153@gmail.com', NULL, N'cvsibo', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (62, N'Kaiser lone', N'Usmaanhaider122@gmail.com', NULL, N'vtnbboAibjefs', 2, 0, 0, 368086487, 24, CAST(N'2018-07-26 21:10:42.000' AS DateTime), 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (63, N'manalodi', N'manalodi@gmail.com', NULL, N'Bmmbijt2', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (64, N'Muneer', N'muneerfarooqbhat@gmail.con', NULL, N'nvoffs22', 2, 0, 0, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (65, N'RANJAN KUMAR', N'girijeshkr335@gmail.com', NULL, N'83931976Ah', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (66, N'Reyaz', N'reyaz.tr@gmail.com', NULL, N'bcde2345A$', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (67, N'Thakor vishnu', N'thakorvishnu2014@gmail.com', 9737823684, N'kbznbubkj', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (68, N'Sathish', N'Sathishskc07@gmail.com', NULL, N':976542:26', 2, 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (69, N'suhail Hamid', N'shk4321@gmail.com', NULL, N':7337288:8', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (70, N'Iqra manzoor', N'Ishfaqzohra22@gmail.com', NULL, N'{pisb23456789', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (71, N'Mr Nawab sir', N'nowab1112003@yahoo.com', 7006984998, N'bcde2345', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (72, N'bhatjavid21', N'bhatjavid21@gmail.com', NULL, N'Cibukbwje32Aepmqijo', 2, 0, 0, 1353920062, 24, CAST(N'2018-05-15 01:55:31.000' AS DateTime), 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (73, N'vipvk007', N'vipvk007@gmail.com', NULL, N'wjlbtlvnbs', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (74, N'zeeshañ', N'mohiuddinzeeshan8@gmail.com', NULL, N'{ffzb', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (75, N'Adibdar', N'Aalamyawar@gmail.com', NULL, N'899:512923', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (76, N'Muhammad Banday', N'muhammadbanday@gmail.com', NULL, N'Nvibnnbe2266', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (77, N'Alpel1', N'alloisagamao@gmail.com', NULL, N'Spobmzo27', 2, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (78, N'Kuntal Ghosh', N'kuntalghosh1@gmail.com', NULL, N'Efcpmjob2A', 2, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (79, N'drpriya', N'drpriyankachaudhary701@gmail.com', 9717459510, N'ibwjtib2557$', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (80, N'abhiramprakash ', N'prakashvkarun@gmail.com', NULL, N'bcijsbn22A', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (81, N'Saranya Parameswaran', N'shivshakti1993@gmail.com', NULL, N'tbsbozb3112', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (82, N'Faaiza', N'zeefaaiza@gmail.com', NULL, N'gbbj{b23', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (83, N'Anzar Bashir', N'sanzarb9797@gmail.com', NULL, N'3589569', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (84, N'Jaya Krishna Vamsi', N'jayakrishnavamsi24@gmail.com', NULL, N'nf)$Ao")/2', 2, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (85, N'Sarika', N'Sarikaragvi@gmail.com', NULL, N'oboe', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (86, N'Snobar', N'snobarfarooq00@gmail.com', NULL, N'topcbs', 2, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (87, N'parisa', N'parisayaqoob263@gmail.com', NULL, N'bcde2345', 2, 0, 0, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (88, N'Arun Joseph', N'arunjoseph.14.aj@gmail.com', NULL, N'bsvo65432', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (89, N'hadi7amood', N'hadi7amood15@gmail.com', NULL, N'Fujtbmbu2', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (90, N'mudasir377', N'mudasirmahar7949@gmail.com', NULL, N'vnujbot488', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (91, N'mohiuddinzeeshan8@gmail.com', N'mohimohiuddinzeeshan8@gmail.com', NULL, N'jcbbe{', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (92, N'savitoj', N'hashsachar@yahoo.co.in', NULL, N'difnjtusz', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (93, N'asif', N'asifdu02@gmail.com', NULL, N'Jutnzxbs271:', 2, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (94, N'LAWRENCE JOSE', N'lawrencejose_vandanathu@rediffmail.com', NULL, N'Lbodijzbs234+', 2, 0, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (95, N'SHUJA RASOOL WANI', N'wanishuja@gmail.com', 7006565527, N'gbujnbcbov', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (96, N'Poorvi', N'agarwalpoo2000@gmail.com', NULL, N'qpp3111bh', 2, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (97, N'tharunravula22@gmail.com', N'tharunravula22@gmail.com', NULL, N'uibsvosbwvmb23456789:', 2, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (98, N'Sachin dubey', N'scdubey0708@gmail.com', NULL, N'9559471388', 2, 0, 0, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (99, N'kaiser', N'wanikaiser2@gmail.com', 8825065440, N'lbjtfsA2:92', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (100, N'Hanzal', N'bhathanzal111@gmail.com', NULL, N'cibuibo{bm', 2, 0, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (101, N'Reemu rashid', N'Reemusyed123@gmail.com', NULL, N'vnbtf5432', 2, 0, 0, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [name], [email], [contact], [password], [roleid], [limit], [lock], [random], [duration], [currenttime], [classid], [board], [profileimage], [teacherSubject], [qualification1], [qualification2], [qualification3], [address]) VALUES (102, N'saqib', N'saqib@gmail.com', NULL, N'TbrjcA2', 1, 0, 0, NULL, NULL, NULL, 4, N'JKBOSE', N'', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[user] OFF
ALTER TABLE [dbo].[answer]  WITH CHECK ADD  CONSTRAINT [FK_answer_paperinformation] FOREIGN KEY([paperid])
REFERENCES [dbo].[paperinformation] ([paperid])
GO
ALTER TABLE [dbo].[answer] CHECK CONSTRAINT [FK_answer_paperinformation]
GO
ALTER TABLE [dbo].[answer]  WITH CHECK ADD  CONSTRAINT [FK_answer_questoninformation] FOREIGN KEY([questionid])
REFERENCES [dbo].[questoninformation] ([questionid])
GO
ALTER TABLE [dbo].[answer] CHECK CONSTRAINT [FK_answer_questoninformation]
GO
ALTER TABLE [dbo].[answer]  WITH CHECK ADD  CONSTRAINT [FK_answer_user] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[answer] CHECK CONSTRAINT [FK_answer_user]
GO
ALTER TABLE [dbo].[pagenumber]  WITH CHECK ADD  CONSTRAINT [FK_pagenumber_pagenames] FOREIGN KEY([pageid])
REFERENCES [dbo].[pagenames] ([pageid])
GO
ALTER TABLE [dbo].[pagenumber] CHECK CONSTRAINT [FK_pagenumber_pagenames]
GO
ALTER TABLE [dbo].[pagenumber]  WITH CHECK ADD  CONSTRAINT [FK_pagenumber_role] FOREIGN KEY([roleid])
REFERENCES [dbo].[role] ([roleid])
GO
ALTER TABLE [dbo].[pagenumber] CHECK CONSTRAINT [FK_pagenumber_role]
GO
ALTER TABLE [dbo].[questoninformation]  WITH CHECK ADD  CONSTRAINT [FK_questoninformation_paperinformation] FOREIGN KEY([paperid])
REFERENCES [dbo].[paperinformation] ([paperid])
GO
ALTER TABLE [dbo].[questoninformation] CHECK CONSTRAINT [FK_questoninformation_paperinformation]
GO
ALTER TABLE [dbo].[SubmitAssignment]  WITH CHECK ADD  CONSTRAINT [FK_SubmitAssignment_tblsubject] FOREIGN KEY([subjectid])
REFERENCES [dbo].[tblsubject2] ([subjectid])
GO
ALTER TABLE [dbo].[SubmitAssignment] CHECK CONSTRAINT [FK_SubmitAssignment_tblsubject]
GO
ALTER TABLE [dbo].[SubmitAssignment]  WITH CHECK ADD  CONSTRAINT [FK_SubmitAssignment_user] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[SubmitAssignment] CHECK CONSTRAINT [FK_SubmitAssignment_user]
GO
ALTER TABLE [dbo].[tblmaterial2]  WITH CHECK ADD  CONSTRAINT [FK_tblmaterial_tblsubject] FOREIGN KEY([subjectid])
REFERENCES [dbo].[tblsubject2] ([subjectid])
GO
ALTER TABLE [dbo].[tblmaterial2] CHECK CONSTRAINT [FK_tblmaterial_tblsubject]
GO
ALTER TABLE [dbo].[tblmaterial2]  WITH CHECK ADD  CONSTRAINT [FK_tblmaterial_tbltype] FOREIGN KEY([typeid])
REFERENCES [dbo].[tbltype2] ([typeid])
GO
ALTER TABLE [dbo].[tblmaterial2] CHECK CONSTRAINT [FK_tblmaterial_tbltype]
GO
ALTER TABLE [dbo].[user3]  WITH CHECK ADD  CONSTRAINT [FK_user_role] FOREIGN KEY([roleid])
REFERENCES [dbo].[role] ([roleid])
GO
ALTER TABLE [dbo].[user3] CHECK CONSTRAINT [FK_user_role]
GO
ALTER TABLE [dbo].[user3]  WITH CHECK ADD  CONSTRAINT [FK_user_role2] FOREIGN KEY([roleid])
REFERENCES [dbo].[role] ([roleid])
GO
ALTER TABLE [dbo].[user3] CHECK CONSTRAINT [FK_user_role2]
GO
/****** Object:  StoredProcedure [dbo].[FetchClass]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[FetchClass]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.[tblclass] 
END
GO
/****** Object:  StoredProcedure [dbo].[FetchEmail]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchEmail]
	-- Add the parameters for the stored procedure here
	@email NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT email FROM dbo.[user] WHERE email=@email
END
GO
/****** Object:  StoredProcedure [dbo].[FetchRoles]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchRoles]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select roleid,rolename from dbo.[role] where roleid<3
END
GO
/****** Object:  StoredProcedure [dbo].[FetchSubject]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[FetchSubject]
	-- Add the parameters for the stored procedure here
	@classid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.tblsubject WHERE classid=@classid
END
GO
/****** Object:  StoredProcedure [dbo].[FillPrivilegeTable]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FillPrivilegeTable]
	-- Add the parameters for the stored procedure here
  @RoleId int,
  @Pagename nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @PageId int
	SELECT @PageId=pageid from pagenames where pagename=@pagename 
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
insert into pagenumber (roleid,pageid)values(@RoleId,@PageId)
END
GO
/****** Object:  StoredProcedure [dbo].[getDetails]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDetails]
	-- Add the parameters for the stored procedure here
	@email NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.[user] WHERE email=@email
END
GO
/****** Object:  StoredProcedure [dbo].[getmaterialdetails]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[getmaterialdetails]
	-- Add the parameters for the stored procedure here
	@classid int,
	@subjectid int,
	@typeid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     tblmaterial.id, tblclass.classname, tblsubject.subjectname, tbltype.type, tblmaterial.filename, tblmaterial.filesize
FROM         tblclass INNER JOIN
                      tblsubject ON tblclass.classid = tblsubject.classid INNER JOIN
                      tblmaterial ON tblsubject.subjectid = tblmaterial.subjectid INNER JOIN
                      tbltype ON tblmaterial.typeid = tbltype.typeid
                      where tblmaterial.subjectid=@subjectid and tblmaterial.typeid=@typeid
END
GO
/****** Object:  StoredProcedure [dbo].[getunverifiedfaculty]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getunverifiedfaculty]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

SELECT    [user].id, [user].name,  [user].email, [user].dob, [user].address, [user].contact, [user].qualification, verification.documents
FROM         [user] INNER JOIN
                      verification ON [user].id = verification.UserId
WHERE    verification.isvalid=0                

    -- Insert statements for procedure here
	--SELECT * FROM dbo.[user] WHERE email=@email
END
GO
/****** Object:  StoredProcedure [dbo].[insertnewline]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertnewline]
	-- Add the parameters for the stored procedure here
	@name nvarchar(50),
	@email nvarchar(50),
	@dob nvarchar(50),
	@address nvarchar(50),
	@contact bigint,
	@qualification nvarchar(50),
	@password	nvarchar(50),
	@roleid	int,
	@documents nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into [user](name,email,dob,[address],contact,qualification,[password],roleid)
	values(@name,@email,@dob,@address,@contact,@qualification,@password,@roleid)
	
    declare @roleName nvarchar(50)
    select @roleName=rolename from dbo.[role] where roleid=@roleid
    
    if(@roleName='Teacher')
    begin
	declare  @userId int;
	--select @userId=id from [user] where email=@email;
	select @userId=MAX(id) from [user] ;
	insert into verification(documents,isvalid,UserId)
	values(@documents,0,@userId)
	
	End
	
END
GO
/****** Object:  StoredProcedure [dbo].[LockUser]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =====================`========================
CREATE PROCEDURE [dbo].[LockUser]
	-- Add the parameters for the stored procedure here
	
	@email nvarchar(50)
	
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update [user] set lock=1 where email=@email
	
	
   -- declare @roleName nvarchar(50)
    --select @roleName=rolename from dbo.[role] where roleid=@roleid
    
    --if(@roleName='Teacher')
    --begin
	--declare  @userId int;
	--select @userId=id from [user] where email=@email;
	--select @userId=MAX(id) from [user] ;
	--insert into verification(documents,isvalid,UserId)
	--values(@documents,0,@userId)
	
	--End
	
END
GO
/****** Object:  StoredProcedure [dbo].[updateuser]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =====================`========================
CREATE PROCEDURE [dbo].[updateuser]
	-- Add the parameters for the stored procedure here
	@name nvarchar(50),
	@email nvarchar(50),
	@dob nvarchar(50),
	@address nvarchar(50),
	@contact bigint,
	@qualification nvarchar(50),
	@password	nvarchar(50)
	
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update [user] set name=@name,email=@email,dob=@dob,[address]=@address,contact=@contact,qualification=@qualification,[password]=@password
	
	
   -- declare @roleName nvarchar(50)
    --select @roleName=rolename from dbo.[role] where roleid=@roleid
    
    --if(@roleName='Teacher')
    --begin
	--declare  @userId int;
	--select @userId=id from [user] where email=@email;
	--select @userId=MAX(id) from [user] ;
	--insert into verification(documents,isvalid,UserId)
	--values(@documents,0,@userId)
	
	--End
	
END
GO
/****** Object:  StoredProcedure [dbo].[verifyteacher]    Script Date: 4/5/2020 7:44:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =====================`========================
CREATE PROCEDURE [dbo].[verifyteacher]
	-- Add the parameters for the stored procedure here
	
	@id int
	
	
	
	
AS
BEGIN
	
	SET NOCOUNT ON;
	update [verification]  set isvalid =1 where UserId=@id ;
	
	
   
	
END
GO
USE [master]
GO
ALTER DATABASE [elearning] SET  READ_WRITE 
GO
