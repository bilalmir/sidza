USE [Elearning]
GO
/****** Object:  StoredProcedure [dbo].[FetchClass]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchEmail]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchRoles]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[FetchSubject]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[FillPrivilegeTable]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getDetails]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getmaterialdetails]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[getunverifiedfaculty]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[insertnewline]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LockUser]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[updateuser]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  StoredProcedure [dbo].[verifyteacher]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[answer]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[articlenews]    Script Date: 7/28/2017 11:45:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[articlenews](
	[typeid] [int] IDENTITY(2,1) NOT NULL,
	[type] [varchar](50) NULL,
 CONSTRAINT [PK_article] PRIMARY KEY CLUSTERED 
(
	[typeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AssignAssignment]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[attendance]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[notification]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[objectiveanswers]    Script Date: 7/28/2017 11:45:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[objectiveanswers](
	[answerid] [int] IDENTITY(1,1) NOT NULL,
	[answer] [varchar](50) NULL,
	[questionid] [int] NULL,
	[paperid] [int] NULL,
	[userid] [int] NULL,
	[marks] [int] NULL,
	[marksobtained] [int] NULL,
	[answerkey] [varchar](50) NULL,
 CONSTRAINT [PK_objectiveanswers] PRIMARY KEY CLUSTERED 
(
	[answerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objectiveattendance]    Script Date: 7/28/2017 11:45:54 AM ******/
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
	[userid] [int] NULL,
 CONSTRAINT [PK_objectiveattendance] PRIMARY KEY CLUSTERED 
(
	[attendanceid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objectivepaperinformation]    Script Date: 7/28/2017 11:45:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[objectivepaperinformation](
	[paperid] [int] IDENTITY(1,1) NOT NULL,
	[classname] [varchar](50) NULL,
	[subjectname] [varchar](50) NULL,
	[papertime] [int] NULL,
	[papermarks] [int] NULL,
	[passmarks] [int] NULL,
 CONSTRAINT [PK_objectivepaperinformation] PRIMARY KEY CLUSTERED 
(
	[paperid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objectivequestioninformation]    Script Date: 7/28/2017 11:45:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[objectivequestioninformation](
	[questionid] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](max) NULL,
	[answer1] [nvarchar](50) NULL,
	[answer2] [nvarchar](50) NULL,
	[answer3] [nvarchar](50) NULL,
	[answer4] [nvarchar](50) NULL,
	[paperid] [int] NULL,
	[quesno] [nvarchar](50) NULL,
	[answerkey] [nvarchar](50) NULL,
	[marksstatus] [int] NULL,
	[marks] [int] NULL,
	[image] [varchar](max) NULL,
 CONSTRAINT [PK_objectivequestioninformation] PRIMARY KEY CLUSTERED 
(
	[questionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objectiveresult]    Script Date: 7/28/2017 11:45:54 AM ******/
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
 CONSTRAINT [PK_objectiveresult] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pagenames]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[pagenumber]    Script Date: 7/28/2017 11:45:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagenumber](
	[roleid] [int] NULL,
	[pageid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[paperinformation]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[questoninformation]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[result]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[role]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[SubmitAssignment]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[tblarticle]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[tblclass]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[tbllesson]    Script Date: 7/28/2017 11:45:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbllesson](
	[lessonid] [int] IDENTITY(1,1) NOT NULL,
	[lessonname] [varchar](50) NULL,
	[subjectid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[lessonid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblmaterial]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[tblmaterial2]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[tblquestionSyllabus]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[tblsubject]    Script Date: 7/28/2017 11:45:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblsubject](
	[subjectid] [int] IDENTITY(1,1) NOT NULL,
	[subjectname] [varchar](50) NULL,
	[classid] [int] NULL,
 CONSTRAINT [PK_tblsubject1] PRIMARY KEY CLUSTERED 
(
	[subjectid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblsubject2]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[tbltitle]    Script Date: 7/28/2017 11:45:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbltitle](
	[titleid] [int] IDENTITY(1,1) NOT NULL,
	[titlename] [varchar](50) NULL,
	[lessonid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[titleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbltype]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[tbltype2]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[tblvideomaterial]    Script Date: 7/28/2017 11:45:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblvideomaterial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeid] [int] NOT NULL,
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
/****** Object:  Table [dbo].[user]    Script Date: 7/28/2017 11:45:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
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
	[currenttime] [datetime] NULL,
	[classid] [int] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user3]    Script Date: 7/28/2017 11:45:54 AM ******/
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
/****** Object:  Table [dbo].[verification]    Script Date: 7/28/2017 11:45:54 AM ******/
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
ALTER TABLE [dbo].[objectiveanswers]  WITH CHECK ADD  CONSTRAINT [FK_objectiveanswers_objectivepaperinformation] FOREIGN KEY([paperid])
REFERENCES [dbo].[objectivepaperinformation] ([paperid])
GO
ALTER TABLE [dbo].[objectiveanswers] CHECK CONSTRAINT [FK_objectiveanswers_objectivepaperinformation]
GO
ALTER TABLE [dbo].[objectiveanswers]  WITH CHECK ADD  CONSTRAINT [FK_objectiveanswers_objectivequestioninformation] FOREIGN KEY([questionid])
REFERENCES [dbo].[objectivequestioninformation] ([questionid])
GO
ALTER TABLE [dbo].[objectiveanswers] CHECK CONSTRAINT [FK_objectiveanswers_objectivequestioninformation]
GO
ALTER TABLE [dbo].[objectivequestioninformation]  WITH CHECK ADD  CONSTRAINT [FK_objectivequestioninformation_objectivepaperinformation] FOREIGN KEY([paperid])
REFERENCES [dbo].[objectivepaperinformation] ([paperid])
GO
ALTER TABLE [dbo].[objectivequestioninformation] CHECK CONSTRAINT [FK_objectivequestioninformation_objectivepaperinformation]
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
ALTER TABLE [dbo].[tblmaterial]  WITH CHECK ADD  CONSTRAINT [FK_tblmaterial_tbltype1] FOREIGN KEY([typeid])
REFERENCES [dbo].[tbltype2] ([typeid])
GO
ALTER TABLE [dbo].[tblmaterial] CHECK CONSTRAINT [FK_tblmaterial_tbltype1]
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
ALTER TABLE [dbo].[tblvideomaterial]  WITH CHECK ADD  CONSTRAINT [FK_tblvideomaterial_tbltype] FOREIGN KEY([typeid])
REFERENCES [dbo].[tbltype] ([typeid])
GO
ALTER TABLE [dbo].[tblvideomaterial] CHECK CONSTRAINT [FK_tblvideomaterial_tbltype]
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
