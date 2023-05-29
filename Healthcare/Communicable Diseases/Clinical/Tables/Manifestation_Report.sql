CREATE TABLE [Clinical].[Manifestation_Report]
(
   [Manifestation_Report_ID] VARCHAR(40) NOT NULL,
   [Report_Date]             DATE NULL,

   [Manifestation_Date]     DATE NULL,
   [Manifestation_Code_ID]  VARCHAR(30) NULL,
   [Manifestation_Flag_ID]  VARCHAR(30) NULL,

   -- external references...
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

   CONSTRAINT [pk_Manifestation_Report] PRIMARY KEY CLUSTERED ([Manifestation_Report_ID] ASC),
   CONSTRAINT [fk_Manifestation_Report_Code] FOREIGN KEY ([Manifestation_Flag_ID])
      REFERENCES [Clinical].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Manifestation_Report_Flag] FOREIGN KEY ([Manifestation_Code_ID])
      REFERENCES [Clinical].[Manifestation_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Manifestation_Report',
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Manifestation_Report',
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Details of observed signs and their existance',
   @level0type = N'SCHEMA',   @level0name = N'Clinical',
   @level1type = N'TABLE',    @level1name = N'Manifestation_Report';
GO

