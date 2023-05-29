CREATE TABLE [Entity].[Officer_Type] (
   [Type_ID]               VARCHAR(30)  NOT NULL,
   [Description]           VARCHAR(128) NULL,
   [Category_ID]           VARCHAR(30)  NULL,

   [CodeSet_Name]          VARCHAR(80) NULL,

   [Tenant_ID]             VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(40) NULL,
   [Version_Number]        VARCHAR(20),
   [Effective_DateTime]     DATETIMEOFFSET NULL,
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Sequence_Number]       INTEGER NULL,
   [Created_DateTime]      DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Updated_DateTime]      DATETIMEOFFSET NOT NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NOT NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40),

   CONSTRAINT [pk_Officer_Type] PRIMARY KEY CLUSTERED ([Type_ID] ASC)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Identity and describe a kind of officer or agent that represents an organization in some capacity',
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Officer_Type'
GO

