-- Zone Improvement Plan - Census - ZCTA5 Codes
CREATE TABLE [Geography].[Zip_Code]
(
   [Code_ID]                VARCHAR(30) NOT NULL,

   [Zip_5_Code]             VARCHAR(5) NOT NULL,
   [Geography_ID]           VARCHAR(5) NOT NULL,

   [Class_FIPS]             VARCHAR(2) NULL,      -- CLASSFP20
   [Metro_Division_Code]    VARCHAR(5) NULL,      -- MTFCC20
   [Functional_Status]      VARCHAR(1) NULL,      -- FUNCSTAT20

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
   [Version_Number]         VARCHAR(20) NULL DEFAULT '2020',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Zip_Code] PRIMARY KEY CLUSTERED ([Code_ID] ASC)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Identify and describe a kind of Zone Improvement Plan',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'Zip_Code'
GO
