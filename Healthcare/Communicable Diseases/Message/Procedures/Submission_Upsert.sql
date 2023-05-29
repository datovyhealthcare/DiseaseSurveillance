
-- The following is based on KnowTech Submission Registry

CREATE PROCEDURE Message.Submission_Upsert
   @Session_ID          VARCHAR(40) = '',
   @Submission_ID       VARCHAR(20) = '',   -- unique submission ID (if new will be null or empty)
   @Submission_DateTime VARCHAR(20) = NULL,    -- date and time submission was prepared
   @Received_DateTime   VARCHAR(20) = NULL,    -- received date and time
   @Content_Type_ID     VARCHAR(30),        -- content type
   @Reference_ID        VARCHAR(30) = NULL, -- Incident ID
   @Source_ID           VARCHAR(40),        -- submitter Agency ID
   @Source_Local_ID     VARCHAR(40) = '',   -- e.g. CFS Local ID
   @Data_Owner_ID       VARCHAR(20) = '',   -- data owner Agency ID as specified in payload.DataOwner
   @Data_Item_ID        VARCHAR(20) = '',   -- submission DataOwner.Data_Item_ID as specified in payload
   @Message_Data        VARCHAR(MAX),       -- CLOB xml message 
   @Content_ID          VARCHAR(20) = '',   -- e.g. GlobalID for CFS
   @Submission_ID_Out   VARCHAR(20) OUTPUT
AS
BEGIN
   SET NOCOUNT ON

   IF NOT EXISTS(SELECT * FROM Message.Content_Type
                  WHERE [Type_ID] = @Content_Type_ID)
      RETURN -4003  -- invalid content-type

   IF @Submission_DateTime is null
      SET @Submission_DateTime = getutcdate()
   IF @Received_DateTime is null
      SET @Received_DateTime = getutcdate()

   DECLARE @MessageLengthInBytes  INTEGER,
           @rval                  INTEGER,
           @orgNumber             VARCHAR(20)
   SET @MessageLengthInBytes = len(@Message_Data)

   -- prepare a unique submission id and/or reference id as necessary...
   IF @Submission_ID = '' OR @Submission_ID IS NULL
   BEGIN
      SET @Submission_ID = [Application].[ID_Number_Generate] 
         (@orgNumber, 'SUB', next value for [Message].[Submission_Number])
   END
   SET @Submission_ID_Out = @Submission_ID

   IF @Data_Item_ID IS NULL OR @Data_Item_ID = ''
      SET @Data_Item_ID = @Submission_ID_Out
   
   -- try to insert submisison now
   BEGIN TRANSACTION SubmissionUpsert

   IF NOT EXISTS (SELECT * FROM [Message].[Submission] with(nolock)
                   WHERE [Submission_ID] = @Submission_ID)
   BEGIN

      -- StateNo = 1 = Registered
      INSERT INTO [Message].[Submission]
         ([Submission_ID],    [Submission_DateTime], [Received_DateTime],
          [Content_Type_ID],  [Source_ID],           [Source_Local_ID],
          [Data_Owner_ID],    [Data_Item_ID],        [Content_ID],
          [Message_Data],     [Message_Count],       [Message_Length_InBytes],
          [Message_DateTime], [Reference_ID],        [Session_Updated_ID])
      VALUES
         (@Submission_ID,     @Submission_DateTime,  @Received_DateTime,
          @Content_Type_ID,   @Source_ID,            @Source_Local_ID,
          @Data_Owner_ID,     @Data_Item_ID,         @Content_ID,
          @Message_Data,      1,                     @MessageLengthInBytes,
          @Received_DateTime, @Reference_ID,         @Session_ID)

      IF @@ERROR <> 0
      BEGIN
         ROLLBACK TRAN SubmissionUpsert
         RETURN -3001    -- failed inserting submission...
      END
   END
   ELSE
   BEGIN
      UPDATE [Message].[Submission]
         SET Message_Count = Message_Count + 1
       WHERE Submission_ID = @Submission_ID

      IF @@ERROR <> 0
      BEGIN
         ROLLBACK TRAN SubmissionUpsert
         RETURN -3002    -- failed updating submission count...
      END
   END

   COMMIT TRANSACTION SubmissionUpsert
END
GO

