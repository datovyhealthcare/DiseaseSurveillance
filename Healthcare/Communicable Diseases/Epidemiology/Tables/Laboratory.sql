CREATE TABLE [Epidemiology].[Laboratory] (
   [Laboratory_ID]          VARCHAR (40) NOT NULL,
   [Alternate_ID]           VARCHAR (40) NULL,
   [Lab_Code_ID]            VARCHAR (30) NULL,
   [Name]                   VARCHAR (80) NULL,
   [Type_ID]                VARCHAR (30) NULL,

   [Vendor_LIMS_Code_ID]    VARCHAR (30) NULL,
   
   [Status_Code_ID]         VARCHAR(30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

   -- external reference
   [Organization_ID]        VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Laboratory] PRIMARY KEY CLUSTERED ([Laboratory_ID] ASC),
   CONSTRAINT [fk_Laboatory_Type] FOREIGN KEY ([Type_ID])
      REFERENCES [Epidemiology].[Lab_Type] ([Type_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Organization',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Laboratory',
   @level2type = N'COLUMN',   @level2name = 'Organization_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Provide details about a laboratory unit and reference to its unit/organization',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Laboratory'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Laboratory Type ',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Laboratory',
   @level2type = N'COLUMN',   @level2name = 'Type_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'LIMS - Laborary Information Management System',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Laboratory',
   @level2type = N'COLUMN',   @level2name = 'Vendor_LIMS_Code_ID';
GO


