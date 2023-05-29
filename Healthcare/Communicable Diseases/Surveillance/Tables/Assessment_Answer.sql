CREATE TABLE [Surveillance].[Assessment_Answer] (
   [Answer_ID]             VARCHAR(40)  NOT NULL,
   [Assessment_ID]         VARCHAR(40)  NULL,
   [Question_ID]           VARCHAR(40)  NULL,
   [AnswerValue]           VARCHAR(256) NULL,

   -- record management
   [Tenant_ID]             VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(40) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Assessment_Answer] PRIMARY KEY CLUSTERED ([Answer_ID] ASC),
   CONSTRAINT [fk_Assessment_Answer_Assessment] FOREIGN KEY ([Assessment_ID]) 
      REFERENCES [Surveillance].[Assessment] ([Assessment_ID]),
   CONSTRAINT [fk_Assessment_Answer_Assessment_Question] FOREIGN KEY ([Question_ID]) 
      REFERENCES [Surveillance].[Assessment_Question] ([Question_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'An answer to an assessment question or concern',
   @level0type = N'SCHEMA',   @level0name = N'Surveillance',
   @level1type = N'TABLE',    @level1name = N'Assessment_Answer'
GO



