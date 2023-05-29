CREATE TABLE [Epidemiology].[Lab_Test_Report]
(
   [Lab_Test_Report_ID]          VARCHAR(40) NOT NULL,

   [Laboratory_ID]               VARCHAR(40) NULL,
   [Lab_Type_ID]                 VARCHAR(30) NULL,

   [Test_Type_ID]                VARCHAR(30) NULL,
   [Test_Interpretation_Code_ID] VARCHAR(30) NULL,
   [Test_Result_Quantitative]    VARCHAR(80) NULL,
   [Test_Result_Unit_Code_ID]    VARCHAR(30) NULL,

   [Specimen_Source_Type_ID]     VARCHAR(30) NULL,
   [Specimen_Collection_Date]    DATE NULL,
   [Specimen_Sent_Date]          DATE NULL,

   -- external reference
   [Case_ID]                VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Lab_Test_Report] PRIMARY KEY CLUSTERED ([Lab_Test_Report_ID] ASC),
   CONSTRAINT [fk_Lab_Test_Report_Laboratory] FOREIGN KEY ([Laboratory_ID])
      REFERENCES [Epidemiology].[Laboratory]([Laboratory_ID]),
   CONSTRAINT [fk_Lab_Test_Report_Specimen_Type] FOREIGN KEY ([Specimen_Source_Type_ID])
      REFERENCES [Epidemiology].[Specimen_Source_Type]([Type_ID]),
   CONSTRAINT [fk_Lab_Test_Report_Test_Type] FOREIGN KEY ([Test_Type_ID])
      REFERENCES [Epidemiology].[Lab_Test_Type]([Type_ID]),
   CONSTRAINT [fk_Lab_Test_Report_Test_Interpretation_Code] FOREIGN KEY ([Test_Interpretation_Code_ID])
      REFERENCES [Epidemiology].[Lab_Test_Interpretation_Code]([Code_ID]),
   CONSTRAINT [fk_Lab_Test_Report_Test_Result_Unit_Code] FOREIGN KEY ([Test_Result_Unit_Code_ID])
      REFERENCES [Epidemiology].[Unit_Code]([Code_ID]),
   CONSTRAINT [fk_Lab_Test_Report_Lab_Type] FOREIGN KEY ([Lab_Type_ID])
      REFERENCES [Epidemiology].[Lab_Type]([Type_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Management) Case',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Test_Report',
   @level2type = N'COLUMN',   @level2name = 'Case_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Details about a laboratory test based on CDC NNDSS messages MMGs',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Test_Report'
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Performing laboratory type', 
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Test_Report',
   @level2type = N'COLUMN',   @level2name = 'Lab_Type_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Date specimen sent to CDC', 
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Test_Report',
   @level2type = N'COLUMN',   @level2name = 'Specimen_Sent_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Date of collection of laboratory specimen used for diagnosis of health event reported in this case report. Time of collection is an optional addition to date.', 
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Test_Report',
   @level2type = N'COLUMN',   @level2name = 'Specimen_Collection_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Units of measure for the Quantitative Test Result Value', 
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Test_Report',
   @level2type = N'COLUMN',   @level2name = 'Test_Result_Unit_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Quantitative Test Result Value', 
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Test_Report',
   @level2type = N'COLUMN',   @level2name = 'Test_Result_Quantitative';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Epidemiologic interpretation of the results of the test(s) performed for this case. This is a qualitative test result.  (e.g, positive, detected, negative)', 
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Test_Report',
   @level2type = N'COLUMN',   @level2name = 'Test_Interpretation_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Epidemiologic interpretation of the type of test(s) performed for this case', 
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Test_Report',
   @level2type = N'COLUMN',   @level2name = 'Test_Type_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'This indicates the source of the specimen tested.', 
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Test_Report',
   @level2type = N'COLUMN',   @level2name = 'Specimen_Source_Type_ID';
GO

