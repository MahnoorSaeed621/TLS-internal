CREATE PROCEDURE [dbo].[AddNewLawyer]
(
	   @UserId int
	  ,@LicenseNo int
	  ,@ShortIntro varchar(300)
	  ,@ChamberCount int
	  ,@CourtCount int
	  ,@Ratings int
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
BEGIN TRANSACTION AddLawyerTrans
	EXECUTE @ReturnLawyerId = [dbo].[AddUpdateLawyer] 0, @UserId, @LicenseNo, @ShortIntro, @ChamberCount, 

	IF @@ERROR <> 0
	BEGIN
    -- Rollback the transaction
		ROLLBACK TRANSACTION AddLawyerTrans

    -- Raise an error and return
		RAISERROR ('Error in adding data to user table', 16, 1)
		RETURN
	END

    EXECUTE [dbo].[AddUpdateAddress] 0, @ReturnUserId ,@Line1 ,@Line2 ,@CityName ,@PostalCode ,@ProvinceName, @AType

	IF @@ERROR <> 0
	BEGIN
    -- Rollback the transaction
		ROLLBACK TRANSACTION AddLawyerTrans

    -- Raise an error and return
		RAISERROR ('Error in adding data to address table.', 16, 1)
		RETURN
	END

	COMMIT TRANSACTION AddLawyerTrans
    
GO

