CREATE TABLE [Surveillance].[Exposure_Location_Report]
(
   [Exposure_Report_ID]     VARCHAR(40) NOT NULL,

   [Country_Code_ID]        VARCHAR(30) NULL,
   [State_Code_ID]          VARCHAR(30) NULL,
   [City_Code_ID]           VARCHAR(30) NULL,
   [County_Code_ID]         VARCHAR(30) NULL,

   -- related case report
   [Case_Report_ID]         VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Exposure_Location_Report] PRIMARY KEY CLUSTERED ([Exposure_Report_ID] ASC),
   CONSTRAINT [fk_Exposure_Location_Report] FOREIGN KEY ([Case_Report_ID])
      REFERENCES [Surveillance].[Case_Report]([Case_Report_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Details about the location of an exposure to be reported to an Authority',
   @level0type = N'SCHEMA',   @level0name = N'Surveillance',
   @level1type = N'TABLE',    @level1name = N'Exposure_Location_Report'
GO

