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
