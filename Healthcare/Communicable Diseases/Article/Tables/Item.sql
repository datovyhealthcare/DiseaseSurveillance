CREATE TABLE [Article].[Item] (
   [Item_ID]                VARCHAR(40) NOT NULL,
   [Name]                   VARCHAR(50) NULL,
   [Type_ID]                VARCHAR(30) NULL,

   [Value_Amount]           DECIMAL(12, 2) NULL,
   [Quantity]               DECIMAL(12) NULL,
   
   [Status_Code_ID]         VARCHAR(30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

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

   CONSTRAINT [pk_Item] PRIMARY KEY CLUSTERED ([Item_ID] ASC),
   CONSTRAINT [fk_Item_Type] FOREIGN KEY ([Type_ID])
      REFERENCES [Article].[Item_Type]([Type_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Describe, provide details about an article or thing',
   @level0type = N'SCHEMA',   @level0name = N'Article', 
   @level1type = N'TABLE',    @level1name = N'Item'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Identify and describe the kind of Item', 
   @level0type = N'SCHEMA',   @level0name = N'Article', 
   @level1type = N'TABLE',    @level1name = N'Item', 
   @level2type = N'COLUMN',   @level2name = 'Type_ID';

