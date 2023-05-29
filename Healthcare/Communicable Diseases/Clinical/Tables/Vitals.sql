CREATE TABLE [Clinical].[Vitals] (
   [Vitals_ID]              VARCHAR(40) NOT NULL,
   [Profile_Code_ID]        VARCHAR(30) NULL,

   [Body_Site_Code_ID]      VARCHAR(30) NULL,
   [Body_Position_Code_ID]  VARCHAR(30) NULL,

   [Device_Code_ID]         VARCHAR(30) NULL,
   [Method]                 VARCHAR(50) NULL,
   [Unit_Code_ID]           VARCHAR(30) NULL,
   [Component_Code_ID]      VARCHAR(30) NULL,
   [Measured_Value]         VARCHAR(50) NULL,
   
   [Status_Code_ID]         VARCHAR(30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

   -- external reference
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

   CONSTRAINT [pk_Vita] PRIMARY KEY CLUSTERED ([Vitals_ID] ASC),
   CONSTRAINT [fk_Vitals_BodyPositionCode] FOREIGN KEY ([Body_Position_Code_ID]) 
      REFERENCES [Clinical].[Body_Position_Code] ([Code_ID]),
   CONSTRAINT [fk_Vitals_BodySiteCode] FOREIGN KEY ([Body_Site_Code_ID]) 
      REFERENCES [Clinical].[Body_Site_Code] ([Code_ID]),
   CONSTRAINT [fk_Vitals_DeviceCode] FOREIGN KEY ([Device_Code_ID])
      REFERENCES [Clinical].[Device_Code] ([Code_ID]),
   CONSTRAINT [fk_Vitals_UnitCode] FOREIGN KEY ([Unit_Code_ID])
      REFERENCES [Clinical].[Unit_Code] ([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Vitals',
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Vitals',
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Identifies and describe medical visit or investigation of vital signs such as temperature, pulse, blood preassure, or other',
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Vitals'
GO


