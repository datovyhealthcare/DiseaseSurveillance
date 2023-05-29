CREATE TABLE [Surveillance].[Assessment_Question] (
   [Question_ID]           VARCHAR(40)  NOT NULL,
   [Question_Sequence]     INT          NULL,
   [Question_Text]         VARCHAR(512) NULL,
   [Questionnaire_ID]      VARCHAR(40)  NULL,

   [Answer_Type_ID]        VARCHAR(30)  NULL,

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

   CONSTRAINT [pk_Assessment_Question] PRIMARY KEY CLUSTERED ([Question_ID] ASC),
   CONSTRAINT [fk_Assessment_Question_AnswerType] FOREIGN KEY ([Answer_Type_ID]) 
      REFERENCES [Surveillance].[Answer_Type] ([Type_ID]),
   CONSTRAINT [fk_Assessment_Question_Questionnaire] FOREIGN KEY ([Questionnaire_ID])
      REFERENCES [Surveillance].[Assessment_Questionnaire]([Questionnaire_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A question or statement about an area of concern to be discussed, assessed or detailed',
   @level0type = N'SCHEMA',   @level0name = N'Surveillance',
   @level1type = N'TABLE',    @level1name = N'Assessment_Question'
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Base Type Complex Type single-select, multi-select radio button, date-time if calendar, free text, option', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Assessment_Question', 
   @level2type = N'COLUMN',   @level2name = 'Answer_Type_ID';

