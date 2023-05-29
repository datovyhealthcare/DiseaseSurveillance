/*
-- The following is based on KnowTech Kif Registry:
   This table purpose is to hold well known issues.  It is expected that positive
   numbers are warnings and messages and negative numbers are errors and exceptions.

   To support non-unique messages the "Code_ID" is offer to hold those related to
   a registered known message number.

   You could let errors and exceptions just fall through without registering
   them as suggested here but if there are issues that are well known it may make
   sense to registeret them, this could lead to your list of known-errors/issues.

   Pretending that issues will never happend or repeat... well... good luck with that. 
 */

CREATE TABLE [Application].[App_Message_Code]
(
   [Code_Number]           INT NOT NULL,
   [Code_ID]               VARCHAR(60) NULL,
   [Description]           VARCHAR(128) NULL,
   [Category_ID]           VARCHAR(30)  NULL,

   [CodeSet_Name]          VARCHAR(80) NULL,

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

   CONSTRAINT [pk_App_Message_Code] PRIMARY KEY CLUSTERED ([Code_Number] ASC)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Registry or log of application runtime related messages',
   @level0type = N'SCHEMA',   @level0name = N'Application', 
   @level1type = N'TABLE',    @level1name = N'App_Message_Code'
GO

