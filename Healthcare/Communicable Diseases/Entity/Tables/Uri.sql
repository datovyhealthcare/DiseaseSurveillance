CREATE TABLE [Entity].[Uri]
(
   [URI_ID]                 VARCHAR(30) NOT NULL,
   [Type_ID]                VARCHAR(30) NULL,
   [Absolute_URI]           VARCHAR(1028) NULL,
   [Category_Code_ID]       VARCHAR(30) NULL,
   [Category_Text]          VARCHAR(80) NULL,

   [Status_Code_ID]         VARCHAR (30)  NULL,
   [Status_DateTime]        DATETIMEOFFSET   NULL,

   -- entity relationship (only one should be instantiated)
   [Person_ID]             VARCHAR(40) NULL,
   [Organization_ID]       VARCHAR(40) NULL,
   [Officer_ID]            VARCHAR(40) NULL,
   [Contact_ID]            VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Uri] PRIMARY KEY ([URI_ID]),
   CONSTRAINT [fk_Uri_Type] FOREIGN KEY ([Type_ID])
      REFERENCES [Entity].[Uri_Type]([Type_ID]),
   CONSTRAINT [fk_Uri_Person] FOREIGN KEY ([Person_ID])
      REFERENCES [Entity].[Person]([Person_ID]),
   CONSTRAINT [fk_Uri_Organization] FOREIGN KEY ([Organization_ID])
      REFERENCES [Entity].[Organization]([Organization_ID]),
   CONSTRAINT [fk_Uri_Officer] FOREIGN KEY ([Officer_ID])
      REFERENCES [Entity].[Officer]([Officer_ID]),
   CONSTRAINT [fk_Uri_Contact] FOREIGN KEY ([Contact_ID])
      REFERENCES [Entity].[Contact]([Contact_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Register an entity unique resource id such as an email, web-site or other',
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Uri'
GO

