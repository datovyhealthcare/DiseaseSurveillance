CREATE TABLE [Clinical].[Condition] (
   [Condition_ID]           VARCHAR (40) NOT NULL,
   [Type_ID]                VARCHAR (30) NULL,

   -- external references...
   [Case_ID]                VARCHAR(40) NULL,
   [Subject_ID]             VARCHAR(40) NOT NULL,

   [Qualifier_Text]         VARCHAR (30) NULL,
   [Qualifier_Code_ID]      VARCHAR (30) NULL,
   [Severity_Code_ID]       VARCHAR (30) NULL,

   [Disease_Code_ID]        VARCHAR(30) NULL,
   [Acquired_Jurisdiction_Code_ID] VARCHAR(30) NULL,
   [Acquired_Date]          DATE NULL,
   [Recorded_Date]          DATE NULL,
   [Reported_Date]          DATE NULL,
   [Diagnosis_Date]         DATE NULL,

   [Duration_Total]         INT NULL,
   [Duration_Unit_Code_ID]  VARCHAR(30) NULL,

   [Body_Site_Code_ID]      VARCHAR(30) NULL,
   [Body_Position_Code_ID]  VARCHAR(30) NULL,

   [Stage_Clinical_Code_ID] VARCHAR(30) NULL,
   [Stage_Surveillance_Code_ID] VARCHAR(30) NULL,
   
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

   CONSTRAINT [pk_Condition] PRIMARY KEY CLUSTERED ([Condition_ID] ASC),
   CONSTRAINT [fk_Condition_BodyPositionCode] FOREIGN KEY ([Body_Position_Code_ID]) 
      REFERENCES [Clinical].[Body_Position_Code] ([Code_ID]),
   CONSTRAINT [fk_Condition_BodySiteCode] FOREIGN KEY ([Body_Site_Code_ID]) 
      REFERENCES [Clinical].[Body_Site_Code] ([Code_ID]),
   CONSTRAINT [fk_Condition_Disease_Code] FOREIGN KEY ([Disease_Code_ID])
      REFERENCES [Clinical].[Disease_Condition_Code] ([Code_ID]),
   CONSTRAINT [fk_Condition_Jurisdiction] FOREIGN KEY ([Acquired_Jurisdiction_Code_ID])
      REFERENCES [Clinical].[Jurisdiction_Code]([Code_ID]),
   CONSTRAINT [fk_Condition_Stage_Clinical] FOREIGN KEY ([Stage_Clinical_Code_ID])
      REFERENCES [Clinical].[Stage_Code]([Code_ID]),
   CONSTRAINT [fk_Condition_Stage_Surveillance] FOREIGN KEY ([Stage_Surveillance_Code_ID])
      REFERENCES [Clinical].[Stage_Code]([Code_ID]),
   CONSTRAINT [fk_Condition_SeverityCode] FOREIGN KEY ([Severity_Code_ID]) 
      REFERENCES [Clinical].[Severity_Code] ([Code_ID]),
   CONSTRAINT [fk_Condition_Duration_Unit] FOREIGN KEY ([Duration_Unit_Code_ID])
      REFERENCES [Clinical].[Unit_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Condition',
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Condition',
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Symptoms, conditions, susceptibility, and other qualifiers',
   @level0type = N'SCHEMA',   @level0name = N'Clinical',
   @level1type = N'TABLE',    @level1name = N'Condition';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Identify the code for a given condition', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Condition', 
   @level2type = N'COLUMN',   @level2name = 'Type_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Drugs', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Condition',
   @level2type = N'COLUMN',   @level2name = 'Qualifier_Text';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Name of Drugs',
   @level0type = N'SCHEMA',   @level0name = N'Clinical',
   @level1type = N'TABLE',    @level1name = N'Condition', 
   @level2type = N'COLUMN',   @level2name = 'Qualifier_Code_ID';


GO
EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Severe Moderate Mild', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Condition',
   @level2type = N'COLUMN',   @level2name = 'Severity_Code_ID';

GO
EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Identify the code related to the state of the condition', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Condition', 
   @level2type = N'COLUMN',   @level2name = 'Status_Code_ID';

