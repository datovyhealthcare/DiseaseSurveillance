CREATE TABLE [Entity].[Person_Flag] (
   [Person_Flag_ID]         VARCHAR (40)  NOT NULL,
   [Person_ID]              VARCHAR (40)  NULL,
   [Code_ID]                VARCHAR (30)  NULL,
   [Flag_Value]             VARCHAR (10)  NULL,
   [Description]            VARCHAR (256) NULL,

   [Status_Code_ID]         VARCHAR (30)  NULL,
   [Status_DateTime]        DATETIMEOFFSET   NULL,

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

   CONSTRAINT [pk_Person_Flag] PRIMARY KEY CLUSTERED ([Person_Flag_ID] ASC),
   CONSTRAINT [fk_Person_Flag_FlagCode] FOREIGN KEY ([Code_ID]) 
      REFERENCES [Entity].[Flag_Code] ([Code_ID]),
   CONSTRAINT [fk_Person_Flag_Person] FOREIGN KEY ([Person_ID])
      REFERENCES [Entity].[Person] ([Person_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A person code stating some important or noticeable thing about him or her',
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Person_Flag'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = '''Y''', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Person_Flag',
   @level2type = N'COLUMN',   @level2name = N'Flag_Value';
GO

