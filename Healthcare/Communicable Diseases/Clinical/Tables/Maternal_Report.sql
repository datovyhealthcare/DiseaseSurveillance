CREATE TABLE [Clinical].[Maternal_Report]
(
   [Maternal_Report_ID]     VARCHAR(40) NOT NULL,
   [Report_Date]            DATE NULL,
   [Jurisdiction_Code_ID]   VARCHAR(30) NULL,

   [Pregnancies_Total]          INT NULL,
   [Births_Live_Total]          INT NULL,
   [Menstrual_Period_Last_Date] DATE NULL,

   [Prenatal_Visit_First_Date]  DATE NULL,
   [Prenatal_Visit_Flag]        VARCHAR(30) NULL,
   [Prenatal_Trimester_Code_ID] VARCHAR(30) NULL,

   -- external references...
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

   CONSTRAINT [pk_Maternal_Report] PRIMARY KEY CLUSTERED ([Maternal_Report_ID] ASC),
   CONSTRAINT [fk_Maternal_Report_Prenatal_Visit_Flag] FOREIGN KEY ([Prenatal_Visit_Flag])
      REFERENCES [Clinical].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Maternal_Report_Prenatal_Trimester] FOREIGN KEY ([Prenatal_Trimester_Code_ID])
      REFERENCES [Clinical].[Pregnancy_Trimester_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Maternal_Report',
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Maternal_Report',
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Details about a conception, pregnancy and its state',
   @level0type = N'SCHEMA',   @level0name = N'Clinical',
   @level1type = N'TABLE',    @level1name = N'Maternal_Report';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Indicate trimester of first prenatal visit.', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Maternal_Report',
   @level2type = N'COLUMN',   @level2name = 'Prenatal_Trimester_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Indicate if there was a prenatal visit.', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Maternal_Report',
   @level2type = N'COLUMN',   @level2name = 'Prenatal_Visit_Flag';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Date of mother''s first prenatal visit.', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Maternal_Report',
   @level2type = N'COLUMN',   @level2name = 'Prenatal_Visit_First_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Date of mother''s last menstrual period before delivery.', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Maternal_Report',
   @level2type = N'COLUMN',   @level2name = 'Menstrual_Period_Last_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Number of mother''s live births.', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Maternal_Report',
   @level2type = N'COLUMN',   @level2name = 'Births_Live_Total';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Number of pregnancies. This includes current pregnancy and previous pregnancies (Gravida).', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Maternal_Report',
   @level2type = N'COLUMN',   @level2name = 'Pregnancies_Total';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Provide the national reporting jurisdiction used for reporting mother''s case.', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Maternal_Report',
   @level2type = N'COLUMN',   @level2name = 'Jurisdiction_Code_ID';
GO
