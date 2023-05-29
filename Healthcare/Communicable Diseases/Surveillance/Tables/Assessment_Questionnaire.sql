CREATE TABLE [Surveillance].[Assessment_Questionnaire] (
   [Questionnaire_ID]      VARCHAR(40)  NOT NULL,
   [Questionnaire_No]      INT NULL,

   [Title]                 VARCHAR(256) NULL,
   [Description]           VARCHAR(256) NULL,

   [Questionnaire_URL]        VARCHAR(256)  NULL,
   [Questionnaire_Answer_URL] VARCHAR(256)  NULL,

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

   CONSTRAINT [pk_Assessment_Questionnaire] PRIMARY KEY CLUSTERED ([Questionnaire_ID] ASC)
);
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Questionnaire Template for an assessment', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Assessment_Questionnaire';

