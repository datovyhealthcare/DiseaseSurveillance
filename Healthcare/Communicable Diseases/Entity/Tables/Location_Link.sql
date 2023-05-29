CREATE TABLE [Entity].[Location_Link] (
   [Location_Link_ID]       VARCHAR (30) NOT NULL,

   -- external reference
   [Location_ID]            VARCHAR (30) NULL,

   -- entity relationship (only one should be instantiated)
   [Person_ID]              VARCHAR(40) NULL,
   [Organization_ID]        VARCHAR(40) NULL,
   [Officer_ID]             VARCHAR(40) NULL,
   [Contact_ID]             VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Location_Link] PRIMARY KEY CLUSTERED ([Location_Link_ID] ASC),
   CONSTRAINT [fk_Location_Link_Person] FOREIGN KEY ([Person_ID])
      REFERENCES [Entity].[Person]([Person_ID]),
   CONSTRAINT [fk_Location_Link_Organization] FOREIGN KEY ([Organization_ID])
      REFERENCES [Entity].[Organization]([Organization_ID]),
   CONSTRAINT [fk_Location_Link_Officer] FOREIGN KEY ([Officer_ID])
      REFERENCES [Entity].[Officer]([Officer_ID]),
   CONSTRAINT [fk_Location_Link_Contact] FOREIGN KEY ([Contact_ID])
      REFERENCES [Entity].[Contact]([Contact_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Geography) Location', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Location_Link',
   @level2type = N'COLUMN',   @level2name = 'Location_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'An association between an entity (person or organization) and a location',
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Location_Link'
GO

