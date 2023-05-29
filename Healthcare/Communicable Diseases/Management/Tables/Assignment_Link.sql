CREATE TABLE [Management].[Assignment_Link]
(
   [Assignment_Link_ID]     VARCHAR(40) NOT NULL,
   [Assignment_ID]          VARCHAR(40) NOT NULL,

   [Case_ID]                VARCHAR(40) NULL,

   -- external reference...
   [Officer_ID]             VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Assignment_Link] PRIMARY KEY CLUSTERED ([Assignment_Link_ID] ASC),
   CONSTRAINT [fk_Assignment_Link] FOREIGN KEY ([Assignment_ID])
      REFERENCES [Management].[Assignment](Assignment_ID),
   CONSTRAINT [fk_Assignment_Link_Case] FOREIGN KEY ([Case_ID])
      REFERENCES [Management].[Case](Case_ID)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Officer ID', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Assignment_Link', 
   @level2type = N'COLUMN',   @level2name = N'Officer_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'An association related to a transfer of a responsability to an agent, officer or other',
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Assignment_Link'
GO

