CREATE TABLE [Surveillance].[Complication_Report]
(
   [Complication_Report_ID] VARCHAR(40) NOT NULL,
   [Report_Date]            DATE NULL,

   [Permanent_Flag_ID]        VARCHAR(30) NULL,
   [Travel_Time_Last]         INT NULL,
   [Travel_Time_Unit_Code_ID] VARCHAR(30) NULL,
   [Travel_Country_Code_ID]   VARCHAR(30) NULL,
   [Travel_Returned_Date]     DATE NULL,
   [Import_Status_Flag_ID]    VARCHAR(30) NULL,
   [Exposure_Source_Code_ID]  VARCHAR(30) NULL,
   [Detection_Method_Code_ID] VARCHAR(30) NULL,

   [Patient_Address_City_Code_ID] VARCHAR(30) NULL,
   [Investigation_Status_Code_ID] VARCHAR(30) NULL,
   [Transmission_Setting_Code_ID] VARCHAR(30) NULL,
   [Age_Setting_Verified_Flag_ID] VARCHAR(30) NULL,
   [Epidemiology_Linked_Flag_ID]  VARCHAR(30) NULL,

   -- external Case ID reference...
   [Case_ID]                VARCHAR(40) NULL,
   [Subject_ID]             VARCHAR(40) NULL,

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
     
   CONSTRAINT [pk_Complication_Report] PRIMARY KEY CLUSTERED ([Complication_Report_ID] ASC),
   CONSTRAINT [fk_Complication_Report_Flag] FOREIGN KEY ([Permanent_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Complication_Report_Import_Status_Flag] FOREIGN KEY ([Import_Status_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Complication_Report_Exposure_Source_Code] FOREIGN KEY ([Exposure_Source_Code_ID])
      REFERENCES [Surveillance].[Case_Classification_Exposure_Source_Code]([Code_ID]),
   CONSTRAINT [fk_Complication_Report_Case_Investigation_Stattus_Code] FOREIGN KEY ([Investigation_Status_Code_ID])
      REFERENCES [Surveillance].[Case_Investigation_Stattus_Code]([Code_ID]),
   CONSTRAINT [fk_Complication_Report_Detection_Method_Code] FOREIGN KEY ([Detection_Method_Code_ID])
      REFERENCES [Surveillance].[Detection_Method_Code]([Code_ID]),
   CONSTRAINT [fk_Complication_Report_[Transmission_Setting_Code] FOREIGN KEY ([Transmission_Setting_Code_ID])
      REFERENCES [Surveillance].[Transmission_Setting_Code]([Code_ID]),
   CONSTRAINT [fk_Complication_Report_Age_Setting_Verified_Flag] FOREIGN KEY ([Age_Setting_Verified_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Complication_Report_Epidemiology_Linked_Flag] FOREIGN KEY ([Epidemiology_Linked_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report', 
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report', 
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Details about a found complication to be reported to an Authority',
   @level0type = N'SCHEMA',   @level0name = N'Surveillance',
   @level1type = N'TABLE',    @level1name = N'Complication_Report'
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Is this case Epi-Linked to another confirmed or probable case?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report',
   @level2type = N'COLUMN',   @level2name = 'Epidemiology_Linked_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Does the age of the case match or make sense for the transmission setting listed (e.g., a subject aged 80 probably would not have a transmission setting of child day care center)?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report',
   @level2type = N'COLUMN',   @level2name = 'Age_Setting_Verified_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'What was the transmission setting where the condition was acquired?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report',
   @level2type = N'COLUMN',   @level2name = 'Transmission_Setting_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Detection Method', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report',
   @level2type = N'COLUMN',   @level2name = 'Detection_Method_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Case investigation status code', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report',
   @level2type = N'COLUMN',   @level2name = 'Investigation_Status_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Patient address city', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report',
   @level2type = N'COLUMN',   @level2name = 'Patient_Address_City_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'List any international destinations of recent travel', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report',
   @level2type = N'COLUMN',   @level2name = 'Travel_Country_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Sub-classification of disease or condition acquired in the US', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report',
   @level2type = N'COLUMN',   @level2name = 'Exposure_Source_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Did symptom onset occur within 12-25 days of entering the US, following any travel or living outside the US?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report',
   @level2type = N'COLUMN',   @level2name = 'Import_Status_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Length of Time in the US units ', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report',
   @level2type = N'COLUMN',   @level2name = 'Travel_Time_Unit_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Length of time in the US since the last travel', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Complication_Report',
   @level2type = N'COLUMN',   @level2name = 'Travel_Time_Last';
GO
