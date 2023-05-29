/*
-- The following is based on KnowTech Submission Registry:

	[Submission_ID]          - Prefixed ID Unique Submission Identifier. 
	[Reference_ID]           - Prefixed ID Unique Incident Identifier. 

	[Submission_DateTime]    - Submission Date when the message package was submitted by the original organization.
	[Receive_DateTime]       - Submission when the message package was received.
	[Message_DateTime]       - Date and Time of the message was prepared.

	[Source_ID]              - Source ID is the SubmitterID that identifies the agency that sends the information. 
                            - This ID may be different from the organization data owner who owns the data.
	[Source_Local_ID]        - This is the Local ID.

	[Data_Item_ID]           - This is the unique identifier to the Payload content. 
                            - This is the ID which is coming from the agency and is unique to the payload content.
	[Content_Type_ID]        - Submission message content (payload) type.
   [Content_ID]             - Source provided content unique identifier.

	[Message_Data]           - Message BLOB.
	[Message_Length_InBytes] - Length of message (BLOB) in Bytes.
	[Message_Count]          - Number of times this submission has been submitted.  
                            - This count helps to identify issues with multiple identical submissions being received by anyone source.
 */

CREATE TABLE [Message].[Submission]
(
	[Submission_ID]          VARCHAR(40) NOT NULL,
	[Submission_DateTime]    DATETIMEOFFSET NULL DEFAULT getutcdate(),

	[Reference_ID]           VARCHAR(40) NULL,
	[Received_DateTime]      DATETIMEOFFSET NULL,
	[Message_DateTime]       DATETIMEOFFSET NULL,

	[Data_Item_ID]           VARCHAR(50) NOT NULL,
	[Content_Type_ID]        VARCHAR(30) NOT NULL,
   [Content_ID]             VARCHAR(40) NULL,

	[Source_ID]              VARCHAR(40) NOT NULL,
	[Source_Local_ID]        VARCHAR(40) NULL,

	[Message_Data]           VARCHAR(max) NOT NULL,
	[Message_Count]          INT NULL,
	[Message_Length_InBytes] INT NOT NULL,

   -- record management
   [Tenant_ID]              VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]    VARCHAR(40) NULL,
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Submission] PRIMARY KEY CLUSTERED ([Submission_ID] ASC),
   CONSTRAINT [fk_Submission_Content_Type] FOREIGN KEY ([Content_Type_ID])
      REFERENCES [Message].[Content_Type]([Type_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to any external Entity', 
   @level0type = N'SCHEMA',   @level0name = N'Message', 
   @level1type = N'TABLE',    @level1name = N'Submission', 
   @level2type = N'COLUMN',   @level2name = N'Reference_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A registry of a message of a given content type',
   @level0type = N'SCHEMA',   @level0name = N'Message', 
   @level1type = N'TABLE',    @level1name = N'Submission'
GO


