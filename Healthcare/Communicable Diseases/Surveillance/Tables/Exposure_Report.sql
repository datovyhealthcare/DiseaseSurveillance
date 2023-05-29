CREATE TABLE [Surveillance].[Exposure_Report]
(
   [Exposure_Report_ID]     VARCHAR(40) NOT NULL,

   [Transmission_Mode_Code_ID]   VARCHAR(30) NULL,

   [Reporting_State_Code_ID]     VARCHAR(30) NULL,
   [Reporting_County_Code_ID]    VARCHAR(30) NULL,

   [Case_Class_Status_Code_ID]   VARCHAR(30) NULL,
   [Case_Outbreak_Flag_ID]       VARCHAR(30) NULL,
   [Case_Outbreak_Name_Text]     VARCHAR(128) NULL,
   [Case_Investigation_Start_Date] DATE NULL,
   [Case_Submitted_First_Date]   DATE NULL,
   [Case_Notified_CDC_Date]      DATE NULL,

   [Notify_Immediate_Flag_ID]    VARCHAR(30) NULL,
   [Notification_Result_Code_ID] VARCHAR(30) NULL,

   [Jurisdiction_Code_ID]        VARCHAR(30) NULL,
   [Reported_Date]               DATE NULL,
   [Reported_State_Date]         DATE NULL,
   [Reported_County_Date]        DATE NULL,
   [Reporting_Source_Type_ID]    VARCHAR(30) NULL,
   [Reporting_Source_Zip_Code]   VARCHAR(30) NULL,
   [Reporting_Criteria_Code_ID]  VARCHAR(30) NULL,
   [Reporting_Jurisdiction_Code_ID] VARCHAR(30) NULL,

   [Person_Reporting_Name_Text]  VARCHAR(128) NULL,
   [Person_Reporting_Phone_Number] VARCHAR(20) NULL,
   [Person_Reporting_Email]      VARCHAR(128) NULL,

   [Comment_Text]                VARCHAR(3000) NULL,

   -- related Case Report
   [Case_Report_ID]         VARCHAR(40) NULL,

   -- external references ...
   [Location_ID]            VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Exposure_Report] PRIMARY KEY CLUSTERED ([Exposure_Report_ID] ASC),
   CONSTRAINT [fk_Exposure_Report] FOREIGN KEY ([Case_Report_ID])
      REFERENCES [Surveillance].[Case_Report]([Case_Report_ID]),
   CONSTRAINT [fk_Exposure_Report_Transmission_Mode_Code] FOREIGN KEY ([Transmission_Mode_Code_ID])
      REFERENCES [Surveillance].[Case_Transmission_Mode_Code]([Code_ID]),
   CONSTRAINT [fk_Exposure_Report_Class_Status_Code] FOREIGN KEY ([Case_Class_Status_Code_ID])
      REFERENCES [Surveillance].[Case_Class_Status_Code]([Code_ID]),
   CONSTRAINT [fk_Exposure_Report_Notify_Immediate_Flag_Code] FOREIGN KEY ([Notify_Immediate_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Exposure_Report_Case_Outbreak_Flag_Code] FOREIGN KEY ([Case_Outbreak_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Exposure_Report_Notification_Result_Status_Code] FOREIGN KEY ([Notification_Result_Code_ID])
      REFERENCES [Surveillance].[Result_Status_Code]([Code_ID]),
   CONSTRAINT [fk_Exposure_Report_Reporting_Source_Type] FOREIGN KEY ([Reporting_Source_Type_ID])
      REFERENCES [Surveillance].[Reporting_Source_Type]([Type_ID]),
   CONSTRAINT [fk_Exposure_Report_Reporting_Criteria_Code] FOREIGN KEY ([Reporting_Criteria_Code_ID])
      REFERENCES [Surveillance].[Reporting_Criteria_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Geography) Location', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Exposure_Report', 
   @level2type = N'COLUMN',   @level2name = 'Location_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Details about an exposure to a disease to be reported to an Authority',
   @level0type = N'SCHEMA',   @level0name = N'Surveillance',
   @level1type = N'TABLE',    @level1name = N'Exposure_Report'
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'For cases meeting the binational criteria, select all the criteria which are met.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Exposure_Report',
   @level2type = N'COLUMN',   @level2name = 'Reporting_Criteria_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'ZIP Code of the reporting source for this case.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Exposure_Report',
   @level2type = N'COLUMN',   @level2name = 'Reporting_Source_Zip_Code';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Type of facility or provider associated with the source of information sent to Public Health.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Exposure_Report',
   @level2type = N'COLUMN',   @level2name = 'Reporting_Source_Type_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Identifier for the physical site from which the notification is being submitted. Locally defined field.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Exposure_Report',
   @level2type = N'COLUMN',   @level2name = 'Jurisdiction_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Status of the notification', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Exposure_Report',
   @level2type = N'COLUMN',   @level2name = 'Notification_Result_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Denotes whether the reported case was associated with an identified outbreak.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Exposure_Report',
   @level2type = N'COLUMN',   @level2name = 'Case_Outbreak_Name_Text';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Denotes whether the reported case was associated with an identified outbreak.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Exposure_Report',
   @level2type = N'COLUMN',   @level2name = 'Case_Outbreak_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Does this case meet the criteria for immediate (extremely urgent or urgent) notification to CDC?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Exposure_Report',
   @level2type = N'COLUMN',   @level2name = 'Notify_Immediate_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Status of the case/event as suspect, probable, confirmed, or not a case per CSTE/CDC/ surveillance case definitions.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Exposure_Report',
   @level2type = N'COLUMN',   @level2name = 'Case_Class_Status_Code_ID';
GO


EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Code for the mechanism by which disease or condition was acquired by the subject of the investigation.', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Exposure_Report',
   @level2type = N'COLUMN',   @level2name = 'Transmission_Mode_Code_ID';
GO
