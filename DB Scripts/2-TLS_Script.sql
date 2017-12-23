CREATE PROCEDURE [dbo].[AddUSER]
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
	EXECUTE @ReturnUserId = [sec].[AddUpdateUsers] @Login , @Password ,@Email, @FirstName, @LastName, @Gender,
		@DateOfBirth, @Cnic, @CellNo, @LandLine, @ProfilePicture ,@ActivityTime

	IF @@ERROR <> 0
	BEGIN
    -- Rollback the transaction
		ROLLBACK

    -- Raise an error and return
		RAISERROR ('Error in adding data to user table', 16, 1)
		RETURN
	END

    EXECUTE [dbo].[AddUpdateAddress] @ReturnUserId ,@Line1 ,@Line2 ,@CityName ,@PostalCode ,@ProvinceName, @AType

	IF @@ERROR <> 0
	BEGIN
    -- Rollback the transaction
		ROLLBACK

    -- Raise an error and return
		RAISERROR ('Error in adding data to address table.', 16, 1)
		RETURN
	END

	COMMIT TRANSACTION AddClientTrans
    
GO
