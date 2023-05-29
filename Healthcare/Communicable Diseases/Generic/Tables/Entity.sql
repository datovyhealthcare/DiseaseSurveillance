CREATE TABLE [Generic].[Entity]
(
   [Entity_ID]              VARCHAR(40) NOT NULL,
   [Type_ID]                VARCHAR(30) NULL,
   [Description]            VARCHAR(80) NULL,

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

   CONSTRAINT [pk_Entity] PRIMARY KEY CLUSTERED ([Entity_ID] ASC),
   CONSTRAINT [fk_Entity_Type] FOREIGN KEY ([Type_ID])
      REFERENCES [Generic].[Entity_Type]([Type_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A group definition to manage an artifact, list, check-list, item-values group or other',
   @level0type = N'SCHEMA',   @level0name = N'Generic', 
   @level1type = N'TABLE',    @level1name = N'Entity'
GO

