CREATE PROCEDURE [dbo].[AddNewUser]
(
       @Login varchar(50)
	  ,@Password varchar(50)
	  ,@Email varchar(100)
      ,@FirstName varchar(50)
	  ,@LastName varchar(50)
	  ,@Gender int
	  ,@DateOfBirth date
	  ,@Cnic varchar(16)
	  ,@CellNo varchar(15)
	  ,@LandLine varchar(15)
	  ,@ProfilePicture varchar(100)
	  ,@ActivityTime datetime
	  
	  --address
	  ,@Line1 varchar(150)
	  ,@Line2 varchar(150)
      ,@CityName varchar(50)
      ,@PostalCode int
	  ,@ProvinceName varchar(20)
	  ,@AType bit 

	  ,@ReturnUserId int OUTPUT

)
AS

-- STEP 1: Start the transaction
BEGIN TRANSACTION AddClientTrans
	EXECUTE @ReturnUserId = [sec].[AddUpdateUsers] 0, @Login , @Password ,@Email, @FirstName, @LastName, @Gender,
		@DateOfBirth, @Cnic, @CellNo, @LandLine, @ProfilePicture ,@ActivityTime ,1

	IF @@ERROR <> 0
	BEGIN
    -- Rollback the transaction
		ROLLBACK TRANSACTION AddClientTrans

    -- Raise an error and return
		RAISERROR ('Error in adding data to user table', 16, 1)
		RETURN
	END

    EXECUTE [dbo].[AddUpdateAddress] 0, @ReturnUserId ,@Line1 ,@Line2 ,@CityName ,@PostalCode ,@ProvinceName, @AType

	IF @@ERROR <> 0
	BEGIN
    -- Rollback the transaction
		ROLLBACK TRANSACTION AddClientTrans

    -- Raise an error and return
		RAISERROR ('Error in adding data to address table.', 16, 1)
		RETURN
	END

	COMMIT TRANSACTION AddClientTrans
    
GO


-- testing addnewuser procedure

--Declare @ReturnUserId int
--Declare @dateobj datetime
--set @dateobj = GETDATE();
--Exec AddNewUser 'test', 'test pas', 'snfjknkjbjkf', 'fname', 'lname', 2, @dateobj, '352001212121', '03331111111',
--				'121212212', 'bkjsbdjkbsajk', @dateobj, 'bzkcbs', 'line 2', 'lahore', 54600, 'punjab',1, @ReturnUserId

--print @ReturnUserId
--GO

--select * from sec.Users
--GO

CREATE PROCEDURE [dbo].[AddLawyerExpertise]
(
	@ExpId int
   ,@LawyerId int
)
AS
BEGIN
	INSERT INTO [dbo].[ExpertiseLawyerBridge] (ExpertiseId, LawyerId) VALUES (@ExpId, @LawyerId)
END
GO


CREATE TYPE [dbo].[udf_Expertise] AS TABLE(
	[ID] int,
	[ITERATOR] int IDENTITY(0,1) 
)

GO

CREATE PROCEDURE [dbo].[AddUpdateMeetingHours]
	 @MeetingId int
	,@LawyerId int
	,@MonFrom time
	,@MonTill time
	,@TueFrom time
	,@TueTill time
	,@WedFrom time
	,@WedTill time
	,@ThuFrom time
	,@ThuTill time
	,@FriFrom time
	,@FriTill time
	,@SatFrom time
	,@SatTill time
	,@SunFrom time
	,@SunTill time

AS
BEGIN
	
	if (@MeetingId > 0)
	BEGIN

		Update [dbo].[MeetingTime]
			SET 
				MonFrom = @MonFrom,
				MonTill = @MonTill,
				TueFrom = @TueFrom,
				TueTill = @TueTill,
				WedFrom = @WedFrom,
				WedTill = @WedTill,
				ThuFrom = @ThuFrom,
				ThuTill = @ThuTill,
				FriFrom = @FriFrom,
				FriTill = @FriTill,
				SatFrom = @SatFrom,
				SatTill = @SatTill,
				SunFrom = @SunFrom,
				SunTill = @SunTill

		WHERE LawyerId = @LawyerId
	END
	ELSE
	BEGIN
		
		INSERT INTO [dbo].[MeetingTime](LawyerId, MonFrom, MonTill, TueFrom, TueTill, WedFrom, WedTill, ThuFrom, ThuTill,
										FriFrom, FriTill, SatFrom, SatTill, SunFrom, SunTill )
		VALUES(@LawyerId, @MonFrom ,@MonTill ,@TueFrom ,@TueTill ,@WedFrom ,@WedTill ,@ThuFrom ,@ThuTill ,@FriFrom 
				,@FriTill ,@SatFrom ,@SatTill ,@SunFrom ,@SunTill )
		
		Select @MeetingId = SCOPE_IDENTITY()
	END

	Select @MeetingId
END
GO



CREATE PROCEDURE [dbo].[AddNewLawyer]
(
	   @UserId int
	  ,@LicenseNo int
	  ,@ShortIntro varchar(300)
	  ,@ChamberCount int
	  ,@CourtCount int
	  ,@Ratings int
	  ,@ActivityTime datetime

	  -- Lawyer Expertise in user defined table 
	  ,@ExpertiseCount int
	  ,@ExpData udf_Expertise READONLY
	 
	  -- Chamber address
	  ,@Line1 varchar(150)
	  ,@Line2 varchar(150)
      ,@CityName varchar(50)
      ,@PostalCode int
	  ,@ProvinceName varchar(20)

	  -- Lawyer meeting hours
	  ,@MonFrom time
	  ,@MonTill time
	  ,@TueFrom time
	  ,@TueTill time
	  ,@WedFrom time
	  ,@WedTill time
	  ,@ThuFrom time
	  ,@ThuTill time
	  ,@FriFrom time
	  ,@FriTill time
	  ,@SatFrom time
	  ,@SatTill time
	  ,@SunFrom time
   	  ,@SunTill time

	  ,@ReturnLawyerId int OUTPUT

)
AS

-- STEP 1: Start the transaction
BEGIN TRANSACTION AddLawyerTrans

	-- adding lawyer to lawyers table
	EXECUTE @ReturnLawyerId = [dbo].[AddUpdateLawyer] 0, @UserId, @LicenseNo, @ShortIntro, @ChamberCount, @CourtCount,
								@Ratings, @ActivityTime, @UserId

	IF @@ERROR <> 0
	BEGIN
    -- Rollback the transaction
		ROLLBACK TRANSACTION AddLawyerTrans

    -- Raise an error and return
		RAISERROR ('Error in adding data to Lawyer table', 16, 1)
		RETURN
	END

	-- adding lawyers expertise to lawyer expertise bridge table

    DECLARE @Iterator int
	SET @Iterator = 0
 	DECLARE @ExpId int

	WHILE (@Iterator < @ExpertiseCount)
	BEGIN
		SET @ExpId = (SELECT ID FROM @ExpData WHERE ITERATOR = @Iterator)
		EXECUTE [dbo].[AddLawyerExpertise] @ExpId , @ReturnLawyerId
		SET @Iterator = @Iterator + 1
	END

	IF @@ERROR <> 0
	BEGIN
    -- Rollback the transaction
		ROLLBACK TRANSACTION AddLawyerTrans

    -- Raise an error and return
		RAISERROR ('Error in adding data to ExpertiseLawyerBridge table.', 16, 1)
		RETURN
	END

	-- adding chamber address of lawyer to address table

	EXECUTE [dbo].[AddUpdateAddress] 0, @UserId ,@Line1 ,@Line2 ,@CityName ,@PostalCode ,@ProvinceName, 2

	IF @@ERROR <> 0
	BEGIN
    -- Rollback the transaction
		ROLLBACK TRANSACTION AddLawyerTrans

    -- Raise an error and return
		RAISERROR ('Error in adding data to address table.', 16, 1)
		RETURN
	END

	-- adding meeting hourse of lwyer to meetingTime table
	EXECUTE [dbo].[AddUpdateMeetingHours] 0, @ReturnLawyerId ,@MonFrom, @MonTill ,@TueFrom ,@TueTill ,@WedFrom ,@WedTill 
										  ,@ThuFrom ,@ThuTill ,@FriFrom ,@FriTill ,@SatFrom ,@SatTill ,@SunFrom ,@SunTill

	IF @@ERROR <> 0
	BEGIN
    -- Rollback the transaction
		ROLLBACK TRANSACTION AddLawyerTrans

    -- Raise an error and return
		RAISERROR ('Error in adding data to meetingtime table.', 16, 1)
		RETURN
	END



	COMMIT TRANSACTION AddLawyerTrans
    
GO

--Declare @ReturnUserId int
--Declare @dateobj datetime
--set @dateobj = GETDATE();

--Declare @ExData udf_Expertise 
--insert into @ExData (ID) values (1)
--insert into @ExData (ID) values (2)

--Declare @timeobj1 time = '10:15:00'
--Declare @timeobj2 time = '21:15:00'

--EXECUTE [dbo].[AddNewLawyer] 2, 54685, 'hello this is a test lawyer', 1, 1, 4, @dateobj, 2, @ExData, 'this is line 1', 'this is line 2',
--								'lahore', 54600, 'punjab', @timeobj1, @timeobj2, @timeobj1, @timeobj2, @timeobj1, @timeobj2, @timeobj1, @timeobj2
--								, @timeobj1, @timeobj2, @timeobj1, @timeobj2, @timeobj1, @timeobj2 ,@ReturnUserId OUTPUT


--print @ReturnUserId
--GO

--select * from dbo.Lawyers
--GO
