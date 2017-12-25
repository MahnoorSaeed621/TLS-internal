

/****** Object:  Schema [sec]    Script Date: 10/3/2017 4:28:00 PM ******/
CREATE SCHEMA [sec]
GO
/****** Object:  UserDefinedTableType [dbo].[ArrayInt]    Script Date: 10/3/2017 4:28:00 PM ******/
CREATE TYPE [dbo].[ArrayInt] AS TABLE(
	[ID] [int] NULL
)
GO
/****** Object:  Table [dbo].[EmailRequests]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailRequests](
	[EmailRequestID] [bigint] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](150) NOT NULL,
	[MessageBody] [varchar](500) NOT NULL,
	[MessageParameters] [varchar](500) NULL,
	[EmailTo] [varchar](200) NOT NULL,
	[EmailCC] [varchar](200) NULL,
	[EmailBCC] [varchar](200) NULL,
	[EmailTemplate] [varchar](50) NULL,
	[ScheduleType] [int] NOT NULL,
	[ScheduleTime] [datetime] NULL,
	[EmailRequestStatus] [int] NOT NULL,
	[EntryTime] [datetime] NULL,
	[UniqueID] [varchar](30) NULL,
 CONSTRAINT [PK_EmailRequests] PRIMARY KEY CLUSTERED 
(
	[EmailRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sec].[LoginHistory]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sec].[LoginHistory](
	[LoginHistoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LoginID] [varchar](50) NOT NULL,
	[MachineIP] [varchar](20) NOT NULL,
	[LoginTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[LoginHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sec].[Permissions]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sec].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL DEFAULT (getutcdate()),
	[Modifiedby] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sec].[PermissionsMapping]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sec].[PermissionsMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[PermissionId] [int] NOT NULL,
 CONSTRAINT [PK_PermissionsMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sec].[Roles]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sec].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL DEFAULT (getutcdate()),
	[Modifiedby] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [sec].[UserRoles]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sec].[UserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [sec].[Users]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [sec].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](100) NULL,
	[CreatedBy] [int] NOT NULL DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL DEFAULT (getutcdate()),
	[Modifiedby] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[EmailRequests] ADD  DEFAULT (getutcdate()) FOR [EntryTime]
GO
/****** Object:  StoredProcedure [dbo].[Find_Text_In_SP]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Find_Text_In_SP]
@StringToSearch varchar(100)
AS
BEGIN
SET @StringToSearch = '%' +@StringToSearch + '%'
SELECT Distinct SO.Name
FROM sysobjects SO (NOLOCK)
INNER JOIN syscomments SC (NOLOCK) on SO.Id = SC.ID
AND SO.Type = 'P'
AND SC.Text LIKE @stringtosearch
ORDER BY SO.Name

END
GO
/****** Object:  StoredProcedure [dbo].[GetEmailRequestsByUniqueID]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetEmailRequestsByUniqueID]
	@UniqueID varchar(30)
AS 
BEGIN
	
	Select * from dbo.EmailRequests
	Where UniqueID = @UniqueID

END
GO
/****** Object:  StoredProcedure [sec].[EnableDisablePermission]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [sec].[EnableDisablePermission]
    @PermissionId int,
	@IsActive bit,
	@ActivityTime datetime,
	@ActivityBy int
AS
BEGIN
	
	UPDATE sec.Permissions SET IsActive = @IsActive, ModifiedOn = @ActivityTime, Modifiedby = @ActivityBy
	Where ID = @PermissionId
	
	Select @PermissionId
END
GO
/****** Object:  StoredProcedure [sec].[EnableDisableRole]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [sec].[EnableDisableRole]
    @RoleId int,
	@IsActive bit,
	@ActivityTime datetime,
	@ActivityBy int
AS
BEGIN
	
	UPDATE sec.Roles SET IsActive = @IsActive, ModifiedOn = @ActivityTime, Modifiedby = @ActivityBy
	Where ID = @RoleId
	
	Select @RoleId
END
GO
/****** Object:  StoredProcedure [sec].[EnableDisableUser]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [sec].[EnableDisableUser]
    @UserId int,
	@IsActive bit,
	@ActivityTime datetime,
	@ActivityBy int
AS
BEGIN
	
	UPDATE sec.Users SET IsActive = @IsActive, ModifiedOn = @ActivityTime, Modifiedby = @ActivityBy
	Where UserID = @UserId
	
	Select @UserId
END
GO
/****** Object:  StoredProcedure [sec].[GetAllPermissions]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [sec].[GetAllPermissions]
AS 
BEGIN
		-- User Permissions
		Select distinct p.* from sec.Permissions p
END

GO
/****** Object:  StoredProcedure [sec].[GetRolePermissionById]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [sec].[GetRolePermissionById]
	@UserId int
AS 
BEGIN
		-- User Roles
		Select distinct r.* from sec.Roles r 
		INNER JOIN sec.UserRoles ur on r.ID = ur.RoleId 
		and ur.UserId = @UserId

		-- User Permissions
		Select distinct p.*,pm.RoleId from sec.Permissions p 
		INNER JOIN [sec].[PermissionsMapping] pm on p.Id = pm.PermissionId
		INNER JOIN sec.UserRoles ur on pm.RoleId = ur.RoleId and ur.UserId = @UserId

END

GO
/****** Object:  StoredProcedure [sec].[SavePermission]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [sec].[SavePermission]
	@Id int,
	@Name varchar(50),
	@Description varchar(50),
	@ActivityTime datetime,
	@ActivityBy int
AS
BEGIN
	if (@Id > 0)
	BEGIN
		Update sec.Permissions
			SET 
			Name = @Name, 
			Description = @Description,
			ModifiedOn = @ActivityTime,
			Modifiedby = @ActivityBy
			where Id=@Id
	END
	ELSE
	BEGIN
		
		INSERT INTO sec.Permissions(Name ,Description,CreatedOn,CreatedBy,IsActive)
		VALUES( @Name ,@Description,@ActivityTime,@ActivityBy,1)
		
		Select @Id = SCOPE_IDENTITY()
	END

	Select @Id
END
GO
/****** Object:  StoredProcedure [sec].[SaveRolePermissionMapping]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [sec].[SaveRolePermissionMapping]
@pRoleID int,
@pList ArrayInt READONLY --Here ArrayInt is user defined type
AS
BEGIN

	--Declare @pRoleID int = 2
	--Declare @pList ArrayInt
	--insert into @pList Select 1
	--insert into @pList Select 3

	Delete from [sec].[PermissionsMapping] Where RoleId = @pRoleID and PermissionId NOT IN (select ID from @pList)

	Insert into [sec].[PermissionsMapping](RoleId,PermissionId)
	select @pRoleID, ID from @pList 
	where ID not IN (select PermissionID from [sec].[PermissionsMapping] Where RoleId = @pRoleID)

	Select @pRoleID

END


GO
/****** Object:  StoredProcedure [sec].[SaveRoles]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [sec].[SaveRoles]
	@RoleId int,
	@Name varchar(50),
	@Description varchar(50),
	@ActivityTime datetime,
	@ActivityBy int
AS
BEGIN
	
	if (@RoleId > 0)
	BEGIN
		Update sec.Roles
			SET 
			Name = @Name, 
			Description = @Description,
			ModifiedBy=@ActivityBy,
			ModifiedOn=@ActivityTime
		WHERE Id = @RoleId

	END
	ELSE
	BEGIN
		
		INSERT INTO sec.Roles(Name ,Description,CreatedBy,CreatedOn,IsActive)
		VALUES( @Name ,@Description,@ActivityBy,@ActivityTime,1)
		
		Select @RoleId = SCOPE_IDENTITY()
	END

	Select @RoleId
END
GO
/****** Object:  StoredProcedure [sec].[SaveUserRoleMapping]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [sec].[SaveUserRoleMapping]
@pUserID int,
@pList ArrayInt READONLY --Here ArrayInt is user defined type
AS
BEGIN

	--Declare @pUserID int = 2
	--Declare @pList ArrayInt
	--insert into @pList Select 1
	--insert into @pList Select 3

	Delete from [sec].[UserRoles] Where RoleId = @pUserID and RoleId NOT IN (select ID from @pList)

	Insert into [sec].[UserRoles](UserId,RoleId)
	select @pUserID, ID from @pList 
	where ID not IN (select RoleId from [sec].[UserRoles] Where RoleId = @pUserID)

	Select @pUserID

END


GO
/****** Object:  StoredProcedure [sec].[SaveUsers]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [sec].[SaveUsers]
		@UserId int,
	   @Login varchar(50)
	  ,@Password varchar(50)
      ,@Name varchar(100)
      ,@Email varchar(100),
	  @ActivityTime datetime,
	  @ActivityBy int
AS
BEGIN
	
	if (@UserId > 0)
	BEGIN

		Update sec.Users
			SET 
			Login = @Login, 
			Password = @Password, 
			Name = @Name, 
			Email=@Email, 
			ModifiedOn = @ActivityTime,
			Modifiedby = @ActivityBy
		
		WHERE UserId = @UserId

	END
	ELSE
	BEGIN
		
		INSERT INTO sec.Users(Login , Password , Name ,Email, CreatedOn,CreatedBy,IsActive)
		VALUES(@Login , @Password , @Name ,@Email,@ActivityTime,@ActivityBy,1)
		
		Select @UserId = SCOPE_IDENTITY()
	END

	Select @UserId
END
GO
/****** Object:  StoredProcedure [sec].[SearchUserForAutoComplete]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [sec].[SearchUserForAutoComplete]
@key varchar(20)
As 
Begin
	
	Select UserId, Login, Name
	from sec.Users
	where Login like '%' +@key+ '%' 
	OR Name like '%' +@key+ '%' 
	And IsActive = 1
End
GO
/****** Object:  StoredProcedure [sec].[SearchUsers]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [sec].[SearchUsers]
	@textToSearch varchar(20),
	@isactive int,
	@pageSize int,
	@pageIndex int
	
AS 
BEGIN
		Select count(*) 
		from [sec].[Users] rmd 
		where (rmd.Name like '%'+ @textToSearch + '%'
			  OR rmd.email like '%'+ @textToSearch + '%'
			  OR rmd.Login like '%'+ @textToSearch + '%')
			  And rmd.IsActive = case when @isactive = -1 then rmd.IsActive else @isactive end
	

		SELECT UserId, Login, Name, Email, IsActive
		 from [sec].[Users] rmd 
		where (rmd.Name like '%'+ @textToSearch + '%'
			  OR rmd.email like '%'+ @textToSearch + '%'
			  OR rmd.Login like '%'+ @textToSearch + '%')
			  And rmd.IsActive = case when @isactive = -1 then rmd.IsActive else @isactive end
		Order by rmd.UserId
		OFFSET @pageIndex*@pageSize ROWS
		FETCH NEXT @pageSize ROWS ONLY
END




GO
/****** Object:  StoredProcedure [sec].[ValidateUser]    Script Date: 10/3/2017 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [sec].[ValidateUser]
	@Login varchar(50),
	@Password varchar(50),
	@CurrTime datetime,
	@MachineIP varchar(20),
	@IgnorePassword bit,
	@LoggerLoginID varchar(50)
AS 
BEGIN

	--DECLARE @Login varchar(50) = ''
	--DECLARE @Password varchar(50) = '123'
	--DECLARE @CurrTime datetime = getdate()
	--DECLARE @MachineIP varchar(20) = ''
	--DECLARE @IgnorePassword bit = 0
	--DECLARE @LoggerLoginID varchar(50) = ''

	Declare @UserId int = 0
	Declare @isActive bit =0

	if(@IgnorePassword = 0)
	BEGIN
		SELECT @UserId=UserId, @isActive = IsActive  
		from sec.Users u where Login = @Login and Password = @Password 
	END
	else
	BEGIN
		SELECT @UserId=UserId, @isActive = IsActive  
		from sec.Users u where Login = @Login  
	END

	Select * from sec.Users where UserID = @UserId

	if @UserId > 0  AND @isActive = 1
	BEGIN
		
		Select distinct r.* from sec.Roles r 
		INNER JOIN sec.UserRoles ur on r.ID = ur.RoleId and ur.UserId = @UserId
		Where r.IsActive = 1

		Select distinct p.*,pm.RoleId from sec.Permissions p 
		INNER JOIN [sec].[PermissionsMapping] pm on p.Id = pm.PermissionId
		INNER JOIN sec.UserRoles ur on pm.RoleId = ur.RoleId and ur.UserId = @UserId
		Where p.IsActive = 1
		
		IF @LoggerLoginID != ''
			SET @Login = @Login + '_By_' + @LoggerLoginID

		INSERT INTO sec.LoginHistory(UserID, LoginID, MachineIP, LoginTime)
		Select @UserId,@Login,@MachineIP,@CurrTime

	END
END
GO







GO

SET IDENTITY_INSERT sec.users ON

insert into sec.Users(UserId, Login, Password, Name, Email, isActive)
Select 1,'Admin','123','Admin','abc@yahoo.com',1

SET IDENTITY_INSERT sec.users OFF


GO

SET IDENTITY_INSERT sec.Permissions ON

Insert into sec.Permissions(Id, Name, Description)

Select '1','perCanLoginAsOtherUser','' UNION ALL
Select '2','perManageSecurityUsers','' UNION ALL
Select '3','perManageSecurityRoles','' UNION ALL
Select '4','perManageSecurityPermissions','' UNION ALL
Select '5','perViewLoginHistoryReport',''

SET IDENTITY_INSERT sec.Permissions OFF

GO

SET IDENTITY_INSERT sec.Roles ON

INSERT INTO sec.Roles(Id, Name, Description,CreatedBy,CreatedOn)
Select '1','Admin','System Admin',1,GetUtCDate()

SET IDENTITY_INSERT sec.Roles OFF

GO


SET IDENTITY_INSERT sec.[PermissionsMapping] ON

INSERT INTO sec.[PermissionsMapping](Id, RoleId, PermissionId)
Select '1','1','1' UNION ALL
Select '2','1','2' UNION ALL
Select '3','1','3' UNION ALL
Select '4','1','4' UNION ALL
Select '5','1','5' 

SET IDENTITY_INSERT sec.[PermissionsMapping] OFF

GO


Insert into sec.[UserRoles](UserId, RoleId)
Select '1','1' 



GO

