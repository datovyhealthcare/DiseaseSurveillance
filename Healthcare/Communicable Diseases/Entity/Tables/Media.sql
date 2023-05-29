CREATE TABLE [Entity].[Media]
(
   [Media_ID]                VARCHAR(40) NOT NULL,
   [Alternate_ID]            VARCHAR(60) NULL,

   [Type_ID]                 VARCHAR(30) NULL,
   [Category_Text]           VARCHAR(80),
   [Status_Code]             INT NOT NULL DEFAULT 0,
   [Url_Text]                VARCHAR(1024),
   [Size_In_Bytes]           INTEGER NOT NULL DEFAULT 0,
   [Media_Data]              VARBINARY(MAX) NULL,
   [Scope_Code_ID]           VARCHAR(30) NULL,
   [Content_Type_Code_ID]    VARCHAR(30) NULL,
   [Content_Type_Text]       VARCHAR(128) NOT NULL DEFAULT '',
   [Media_Default_Indicator] BIT NOT NULL DEFAULT 0,
   [Serial_No]               BIGINT NOT NULL DEFAULT 0,

   [Status_Code_ID]          VARCHAR (30)  NULL,
   [Status_DateTime]         DATETIMEOFFSET   NULL,
 
   [Reference_Date_Type_ID]  VARCHAR(30) NULL,
   [Reference_DateTime]      DATETIMEOFFSET NULL,

   -- entity relationship (only one should be instantiated)
   [Person_ID]               VARCHAR(40) NULL,
   [Organization_ID]         VARCHAR(40) NULL,
   [Officer_ID]              VARCHAR(40) NULL,
   [Contact_ID]              VARCHAR(40) NULL,

   -- record management
   [Tenant_ID]               VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]           VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]     VARCHAR(40) NULL,
   [Sequence_Number]         INTEGER NULL DEFAULT 0,
   [Effective_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime]  DATETIMEOFFSET NULL,
   [Version_Number]          VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]        DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]        DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]   CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]      VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT pk_Media PRIMARY KEY (Media_ID),
   CONSTRAINT fk_Media_Type FOREIGN KEY ([Type_ID])
      REFERENCES Entity.Media_Type(Type_ID),
   CONSTRAINT [fk_Media_Person] FOREIGN KEY ([Person_ID])
      REFERENCES [Entity].[Person]([Person_ID]),
   CONSTRAINT [fk_Media_Organization] FOREIGN KEY ([Organization_ID])
      REFERENCES [Entity].[Organization]([Organization_ID]),
   CONSTRAINT [fk_Media_Officer] FOREIGN KEY ([Officer_ID])
      REFERENCES [Entity].[Officer]([Officer_ID]),
   CONSTRAINT [fk_Media_Contact] FOREIGN KEY ([Contact_ID])
      REFERENCES [Entity].[Contact]([Contact_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A document, image, or other digital artifacts that describe or define something',
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Media'
GO
