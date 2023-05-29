CREATE TABLE [Entity].[Item_Link] (
   [Item_Link_ID]           VARCHAR(40) NOT NULL,

   -- external reference
   [Item_ID]                VARCHAR(40) NOT NULL,

   -- entity relationship (only one should be instantiated)
   [Person_ID]              VARCHAR(40) NULL,
   [Organization_ID]        VARCHAR(40) NULL,
   [Officer_ID]             VARCHAR(40) NULL,
   [Contact_ID]             VARCHAR(40) NULL,

   -- record management
   [Tenant_ID]              VARCHAR(30) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(30) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]    VARCHAR(30) NULL,
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Reference_Link] PRIMARY KEY CLUSTERED ([Item_Link_ID] ASC),
   CONSTRAINT [fk_Item_Reference_Link_Person] FOREIGN KEY ([Person_ID])
      REFERENCES [Entity].[Person]([Person_ID]),
   CONSTRAINT [fk_Item_Reference_Link_Organization] FOREIGN KEY ([Organization_ID])
      REFERENCES [Entity].[Organization]([Organization_ID]),
   CONSTRAINT [fk_Item_Reference_Link_Officer] FOREIGN KEY ([Officer_ID])
      REFERENCES [Entity].[Officer]([Officer_ID]),
   CONSTRAINT [fk_Item_Reference_Link_Contact] FOREIGN KEY ([Contact_ID])
      REFERENCES [Entity].[Contact]([Contact_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Item_Link',
   @level2type = N'COLUMN',   @level2name = 'Item_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'An associaton of an entity with an Item such as a vehicle or artifact',
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Item_Link';
GO



