CREATE TABLE [Surveillance].[Assessment] (
   [Assessment_ID]          VARCHAR(40) NOT NULL,
   [Type_ID]                VARCHAR(30) NULL,
   [Alternate_ID]           VARCHAR(40) NULL,
   [Description]            VARCHAR(1024) NULL,
    
   [Questionnaire_ID]       VARCHAR(40) NULL,
   
   -- external reference
   [Case_ID]                VARCHAR(40) NULL,
   [Subject_ID]             VARCHAR(40) NULL,

   [Status_Code_ID]         VARCHAR(30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

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

   CONSTRAINT [pk_Assessment] PRIMARY KEY CLUSTERED ([Assessment_ID] ASC),
   CONSTRAINT [fk_Assessment_AssessmentType] FOREIGN KEY ([Type_ID]) 
      REFERENCES [Surveillance].[Assessment_Type] ([Type_ID]),
   CONSTRAINT [fk_Assessment_Questionnaire] FOREIGN KEY ([Questionnaire_ID]) 
      REFERENCES [Surveillance].[Assessment_Questionnaire] ([Questionnaire_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Assessment', 
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Assessment', 
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'An evaluation, appraisal, or assessment of something or someone',
   @level0type = N'SCHEMA',   @level0name = N'Surveillance',
   @level1type = N'TABLE',    @level1name = N'Assessment'
GO