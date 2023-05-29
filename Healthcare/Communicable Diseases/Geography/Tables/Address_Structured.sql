CREATE TABLE [Geography].[Address_Structured]
(
   [Address_Structured_ID]  VARCHAR(40) NOT NULL,

   [Building_Name]          VARCHAR(80) NULL,
   [Unit_Number]            VARCHAR(10) NULL,
   [Mailbox]                VARCHAR(40) NULL,
   
   [Street_Number]          VARCHAR(40) NULL,
   [Street_Name]            VARCHAR(80) NULL,
   [Street_Direction]       VARCHAR(20) NULL,
   [Street_Prefix]          VARCHAR(20) NULL,
   [Street_Suffix]          VARCHAR(20) NULL,
   
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

   CONSTRAINT [pk_Address_Structured] PRIMARY KEY CLUSTERED ([Address_Structured_ID] ASC)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A (street based) structured address details',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'Address_Structured'
GO
