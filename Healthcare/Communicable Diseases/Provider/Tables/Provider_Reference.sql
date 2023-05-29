CREATE TABLE [Provider].[Provider_Reference] (
   [Provider_Reference_ID] VARCHAR (40) NOT NULL,
   [Alternate_ID]          VARCHAR (40) NULL,

   [Provider_Code_ID]      VARCHAR (30) NULL,

   -- external references
   [Person_ID]             VARCHAR (40) NULL,
   [Organization_ID]       VARCHAR (40) NULL,
   [Name_ID]               VARCHAR (30) NULL,

   [Status_Code_ID]        VARCHAR(30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]             VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(40) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Provider_Reference] PRIMARY KEY CLUSTERED ([Provider_Reference_ID] ASC),
   CONSTRAINT [fk_Provider_Reference_Code] FOREIGN KEY ([Provider_Code_ID])
      REFERENCES [Provider].[Provider_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Name',
   @level0type = N'SCHEMA',   @level0name = N'Provider',
   @level1type = N'TABLE',    @level1name = N'Provider_Reference',
   @level2type = N'COLUMN',   @level2name = 'Name_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Organization',
   @level0type = N'SCHEMA',   @level0name = N'Provider',
   @level1type = N'TABLE',    @level1name = N'Provider_Reference',
   @level2type = N'COLUMN',   @level2name = 'Organization_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Person',
   @level0type = N'SCHEMA',   @level0name = N'Provider',
   @level1type = N'TABLE',    @level1name = N'Provider_Reference',
   @level2type = N'COLUMN',   @level2name = 'Person_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A reference to a provider or entity',
   @level0type = N'SCHEMA',   @level0name = N'Provider',
   @level1type = N'TABLE',    @level1name = N'Provider_Reference'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Provider Code',
   @level0type = N'SCHEMA',   @level0name = N'Provider',
   @level1type = N'TABLE',    @level1name = N'Provider_Reference',
   @level2type = N'COLUMN',   @level2name = 'Provider_Code_ID'
GO

