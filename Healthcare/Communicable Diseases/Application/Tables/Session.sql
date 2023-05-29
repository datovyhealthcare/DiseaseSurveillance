CREATE TABLE [Application].[Session] (
   [Session_ID]             VARCHAR(40) NOT NULL,
   [Session_Type_ID]        VARCHAR(30) NULL,
   [Session_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),

   -- external references...
   [Referral_ID]            VARCHAR(40) NULL,
   [Case_ID]                VARCHAR(40) NULL,
   [Officer_ID]             VARCHAR(40) NULL,
   [Contact_ID]             VARCHAR(40) NULL,

    -- Session relationship 
   [Token_ID]               VARCHAR(40) NULL,

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
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67'

   CONSTRAINT [pk_Session] PRIMARY KEY CLUSTERED ([Session_ID] ASC),
   CONSTRAINT [fk_Application_Case] FOREIGN KEY ([Case_ID]) 
      REFERENCES [Management].[Case] ([Case_ID]),
   CONSTRAINT [fk_Application_Referral] FOREIGN KEY ([Referral_ID]) 
      REFERENCES [Management].[Referral] ([Referral_ID]),
   CONSTRAINT [fk_Application_Contact] FOREIGN KEY (Contact_ID)
      REFERENCES [Entity].[Contact] ([Contact_ID]),  
   CONSTRAINT [fk_AccessToken_Session] FOREIGN KEY ([Token_ID])
      REFERENCES [Application].[Access_Token]([Token_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to a (Surveillance) Referral',
   @level0type = N'SCHEMA',   @level0name = N'Application', 
   @level1type = N'TABLE',    @level1name = N'Session', 
   @level2type = N'COLUMN',   @level2name = 'Referral_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to a (Management) Case',
   @level0type = N'SCHEMA',   @level0name = N'Application', 
   @level1type = N'TABLE',    @level1name = N'Session', 
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to a (Entity) Officer',
   @level0type = N'SCHEMA',   @level0name = N'Application', 
   @level1type = N'TABLE',    @level1name = N'Session', 
   @level2type = N'COLUMN',   @level2name = 'Officer_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to a (Entity) Contact',
   @level0type = N'SCHEMA',   @level0name = N'Application', 
   @level1type = N'TABLE',    @level1name = N'Session', 
   @level2type = N'COLUMN',   @level2name = 'Contact_ID'
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Identify end-user or service access during a period of time', 
   @level0type = N'SCHEMA',   @level0name = N'Application',
   @level1type = N'TABLE',    @level1name = N'Session';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Identify and describe the session type',
   @level0type = N'SCHEMA',   @level0name = N'Application', 
   @level1type = N'TABLE',    @level1name = N'Session', 
   @level2type = N'COLUMN',   @level2name = 'Session_Type_ID';

