CREATE TABLE [Geography].[State_Code]
(
   [Code_ID]                VARCHAR(30)  NOT NULL,
   [Description]            VARCHAR(128) NULL,
   [Category_ID]            VARCHAR(30)  NULL,

   [CodeSet_Name]           VARCHAR(80) NULL DEFAULT 'Census-Tiger State',

   [Region_Code_ID]         VARCHAR(30) NULL,
   [Division_Code_ID]       VARCHAR(30) NULL,

   [State_FIPS]             VARCHAR(2) NOT NULL,
   [State_ANSI]             VARCHAR(8) NULL,

   [Geography_ID]           VARCHAR(2) NULL,

   [USPS_Abbreviation]      VARCHAR(2) NOT NULL,

   [Area_Description_LSAD]  VARCHAR(2) NULL,      -- legal/stats area description code
   [Feature_Class_MTF]      VARCHAR(5) NULL,      -- MAF/TIGER feature class code

   [Area_Land]              DECIMAL(18, 7) NULL,
   [Area_Water]             DECIMAL(18, 7) NULL,

   [Latitude]               DECIMAL(18, 7) NULL,  -- lat of internal point
   [Longitude]              DECIMAL(18, 7) NULL,  -- lon of internal point

   -- record management
   [Tenant_ID]              VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(40) NULL DEFAULT 'Census',
   [Agency_Reporting_ID]    VARCHAR(40) NULL DEFAULT 'Census',
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_State_Code] PRIMARY KEY CLUSTERED ([Code_ID] ASC)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Identify and describe a state or province (based on Census states)',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'State_Code'
GO

