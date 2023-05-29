CREATE TABLE [Application].[Access_Token]
(
   [User_ID]               VARCHAR(40) NOT NULL,
   [Token_ID]              VARCHAR(40) NOT NULL,

   -- record management
   [Tenant_ID]             VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(40) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]        DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_AccessToken] PRIMARY KEY ([Token_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to a (Entity) Officer',
   @level0type = N'SCHEMA',   @level0name = N'Application', 
   @level1type = N'TABLE',    @level1name = N'Access_Token', 
   @level2type = N'COLUMN',   @level2name = 'User_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Registry of the access token for given officer or system user',
   @level0type = N'SCHEMA',   @level0name = N'Application', 
   @level1type = N'TABLE',    @level1name = N'Access_Token'
GO

