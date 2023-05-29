CREATE TABLE [Surveillance].[Profile_Condition] (
   [Profile_Condition_ID]  VARCHAR(40) NOT NULL,
   [Profile_ID]            VARCHAR(40) NULL,
   [Condition_Code_ID]     VARCHAR(30) NULL,

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

   CONSTRAINT [pk_Profile_Condition] PRIMARY KEY CLUSTERED ([Profile_Condition_ID] ASC),
   CONSTRAINT [fk_Profile_Condition_Profile_Group] FOREIGN KEY ([Profile_ID]) 
      REFERENCES [Surveillance].[Profile] ([Profile_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Define the list of Medical Condition that are related to a particular disease being trackt', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Profile_Condition'

