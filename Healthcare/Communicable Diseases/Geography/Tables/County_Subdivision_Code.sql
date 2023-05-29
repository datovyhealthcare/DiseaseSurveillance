CREATE TABLE [Geography].[County_Subdivision_Code]
(
   [Code_ID]                VARCHAR(40) NOT NULL,

   [State_FIPS]             VARCHAR(2) NOT NULL,
   [County_FIPS]            VARCHAR(3) NOT NULL,

   [Subdivision_FIPS]       VARCHAR(5) NOT NULL,
   [Subdivision_ANSI]       VARCHAR(8) NOT NULL,

   [Geography_ID]           VARCHAR(10) NOT NULL,

   [Name]                   VARCHAR(100) NOT NULL,
   [Name_LSAD]              VARCHAR(100) NULL,

   [Area_Description_LSAD]  VARCHAR(2) NULL,      -- legal/stats area description code
   [Class_FIPS]             VARCHAR(2) NULL, 
   [Feature_Class_MTF]      VARCHAR(5) NULL,      -- MAF/TIGER feature class code

   [Area_CSAFP]             VARCHAR(3) NULL,      -- combined stat area code
   [Area_CBSAFP]            VARCHAR(5) NULL,      -- metro stat area/micropolitan stat area code
   [Metro_Division_Code]    VARCHAR(5) NULL,
   [Functional_Status]      VARCHAR(1) NULL,

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

   CONSTRAINT [pk_County_Subdivision_Code] PRIMARY KEY CLUSTERED ([Code_ID] ASC)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Census Tiger County Subdivision Codes',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'County_Subdivision_Code'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'County identifier; a concatenation of Current state FPIPS code and county FIPS code',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'County_Subdivision_Code', 
   @level2type = N'COLUMN',   @level2name = N'Geography_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Current name and the tralsnated legal/statistical area description for county',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'County_Subdivision_Code', 
   @level2type = N'COLUMN',   @level2name = N'Name_LSAD';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Current legal/statistical area description code for county',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'County_Subdivision_Code', 
   @level2type = N'COLUMN',   @level2name = N'Area_Description_LSAD';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Current FIPS class code',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'County_Subdivision_Code', 
   @level2type = N'COLUMN',   @level2name = N'Class_FIPS';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'MAF/TIGER Feature Class Code (G4020)',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'County_Subdivision_Code', 
   @level2type = N'COLUMN',   @level2name = N'Feature_Class_MTF';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Current FIPS class code',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'County_Subdivision_Code', 
   @level2type = N'COLUMN',   @level2name = N'Area_CSAFP';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Current metropolitan statistical area/micropolitan statistical area code',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'County_Subdivision_Code', 
   @level2type = N'COLUMN',   @level2name = N'Area_CBSAFP';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Current metropolitan division code',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'County_Subdivision_Code', 
   @level2type = N'COLUMN',   @level2name = N'Metro_Division_Code';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Current functional status',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'County_Subdivision_Code', 
   @level2type = N'COLUMN',   @level2name = N'Functional_Status';
GO
