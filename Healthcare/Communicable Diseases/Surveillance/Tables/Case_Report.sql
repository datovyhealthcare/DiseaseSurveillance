CREATE TABLE [Surveillance].[Case_Report]
(
   [Case_Report_ID]         VARCHAR(40) NOT NULL,
   [Report_Date]            DATE NULL,
   [Reported_Date]          DATE NULL,

   [Type_ID]                VARCHAR(30) NULL,
   [Description]            VARCHAR(1024) NULL,

   [Illness_Onset_Date]       DATE NULL,
   [Illness_End_Date]         DATE NULL,
   [Illness_Duration]         INT NULL,
   [Illness_Duration_Unit_Code_ID] VARCHAR(30) NULL,

   [Pregnancy_Status_Flag_ID] VARCHAR(30) NULL,
   [Diagnosis_Date]           DATE NULL,

   [Hospitalized_Flag_ID]     VARCHAR(30) NULL,
   [Hospital_Stay_InDays]     INT NULL,
   [Admission_Date]           DATE NULL,
   [Discharged_Date]          DATE NULL,

   [Morbidity_Mortality_Week] INT,
   [Morbidity_Mortality_Year] INT,

   [Exposure_Setting_Code_ID] VARCHAR(30) NULL,
   [Condition_Code_ID]        VARCHAR(30) NULL,
   [Subject_Died_Flag_ID]     VARCHAR(30) NULL,

   [Deceased_Date]            DATE NULL,
   [Deceased_Source_Code_ID]  VARCHAR(30) NULL,

   [Imported_Country_Code_ID] VARCHAR(30) NULL,
   [Imported_State_Code_ID]   VARCHAR(30) NULL,
   [Imported_City_Code_ID]    VARCHAR(30) NULL,
   [Imported_County_Code_ID]  VARCHAR(30) NULL,

   [Age_At_Case]              INT NULL,
   [Age_Unit_Code_ID]         VARCHAR(30),

   -- external Case ID reference...
   [Case_State_ID]          VARCHAR(40) NULL,
   [Case_Local_ID]          VARCHAR(40) NULL,
   [Case_Legacy_ID]         VARCHAR(40) NULL,
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

   CONSTRAINT [pk_Case_Report] PRIMARY KEY CLUSTERED ([Case_Report_ID] ASC),
   CONSTRAINT [fk_Case_Report_Type] FOREIGN KEY ([Type_ID])
      REFERENCES [Surveillance].[Report_Type]([Type_ID]),
   CONSTRAINT [fk_Case_Report_Setting] FOREIGN KEY ([Exposure_Setting_Code_ID])
      REFERENCES [Surveillance].[Exposure_Setting_Code]([Code_ID]),
   CONSTRAINT [fk_Case_Report_Illness_Duration_Unit_Code] FOREIGN KEY ([Illness_Duration_Unit_Code_ID])
      REFERENCES [Surveillance].[Unit_Code]([Code_ID]),
   CONSTRAINT [fk_Case_Report_Pregnancy_Status_Flag] FOREIGN KEY ([Pregnancy_Status_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Case_Report_Hospitalized_Flag] FOREIGN KEY ([Hospitalized_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Case_Report_Subject_Died_Flag] FOREIGN KEY ([Subject_Died_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Case_Report_Deceased_Source_Code] FOREIGN KEY ([Deceased_Source_Code_ID])
      REFERENCES [Surveillance].[Jurisdiction_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Investigation or case details collected as of a particular date to be reported to an Authority',
   @level0type = N'SCHEMA',   @level0name = N'Surveillance',
   @level1type = N'TABLE',    @level1name = N'Case_Report'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report', 
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report', 
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Date of first report to public health department [77995-9].', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Reported_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Morbidity and Mortality Weekly Report (MMWR) week for which case information is to be counted for MMWR publication [77991-8].', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Morbidity_Mortality_Week';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Morbidity and Mortality Weekly Report (MMWR) year for which case information is included in MMWR publication [77992-6].', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Morbidity_Mortality_Year';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'If the disease or condition was imported, indicates the country in which the disease was likely acquired.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Imported_Country_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'If the disease or condition was imported, indicates the state in which the disease was likely acquired.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Imported_State_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'If the disease or condition was imported, indicates the city in which the disease was likely acquired.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Imported_City_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'If the disease or condition was imported, contains the county of origin of the disease or condition..', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Imported_County_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Indication of where the disease/condition was likely acquired.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Deceased_Source_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Subject age unit at time of case investigation', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Age_Unit_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Subject age at time of case investigation', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Age_At_Case';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'If the subject died from this illness or complications associated with this illness, indicate the date of death.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Deceased_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Did the subject die from this illness or complications of this illness?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Subject_Died_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Subject’s most recent admission date to the hospital for the condition covered by the investigation.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Admission_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Subject’s most recent discharge date from the hospital for the condition covered by the investigation.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Discharged_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Was subject hospitalized because of this event?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Hospitalized_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Subject''s duration of stay at the hospital for the condition covered by the investigation.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Hospital_Stay_InDays';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Indicates whether the subject was pregnant at the time of the event.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Pregnancy_Status_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Unit of time used to describe the length of the illness or condition.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Illness_Duration_Unit_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Length of time this subject had this disease or condition.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Illness_Duration';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Date at which the disease or condition ends.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Illness_End_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Date of the beginning of the illness.  Reported date of the onset of symptoms of the condition being reported to the public health system.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Illness_Onset_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Condition or event that constitutes the reason the notification is being sent.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Condition_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Place or location where subject may had been exposed to the virus or disease', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Case_Report',
   @level2type = N'COLUMN',   @level2name = 'Exposure_Setting_Code_ID';
GO
