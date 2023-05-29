CREATE TABLE [Entity].[Name]
(
   [Person_ID]             VARCHAR(30)  NULL,
   [Name_ID]               VARCHAR(30)  NOT NULL,
   [Name_Type_ID]          VARCHAR(30)  NULL,
   [Name_Given]            VARCHAR(80)  NULL,
   [Name_Middle]           VARCHAR(80)  NULL,
   [Name_Family]           VARCHAR(80)  NULL,
   [Name_Prefix_Code_ID]   VARCHAR(30)  NULL,
   [Name_Suffix_Code_ID]   VARCHAR(30)  NULL,
   [Name_Full]             VARCHAR(128) NULL,

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

   CONSTRAINT [pk_Name] PRIMARY KEY CLUSTERED ([Name_ID] ASC),
   CONSTRAINT [fk_Name_Type] FOREIGN KEY ([Name_Type_ID])
      REFERENCES [Entity].[Name_Type] ([Type_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'An entity, subject or person Name details',
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Name'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A name type', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Name',
   @level2type = N'COLUMN',   @level2name = 'Name_Type_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A given name', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Name',
   @level2type = N'COLUMN',   @level2name = 'Name_Given';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A middle name', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Name',
   @level2type = N'COLUMN',   @level2name = 'Name_Middle';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A family name', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Name',
   @level2type = N'COLUMN',   @level2name = 'Name_Family';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A name prefix', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Name',
   @level2type = N'COLUMN',   @level2name = 'Name_Prefix_Code_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A name suffix', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Name',
   @level2type = N'COLUMN',   @level2name = 'Name_Suffix_Code_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A person or entity full name', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Name',
   @level2type = N'COLUMN',   @level2name = 'Name_Full';
GO
