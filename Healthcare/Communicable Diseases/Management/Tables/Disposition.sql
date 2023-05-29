CREATE TABLE [Management].[Disposition] (
   [Disposition_ID]         VARCHAR (40)  NOT NULL,
   [Code_ID]                VARCHAR (30)  NULL,

   [Disposition_DateTime]   DATETIMEOFFSET NULL,
   
   [Status_Code_ID]         VARCHAR (30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

   [Case_ID]                VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Disposition] PRIMARY KEY CLUSTERED ([Disposition_ID] ASC),
   CONSTRAINT [fk_Disposition_Case] FOREIGN KEY ([Case_ID])
      REFERENCES [Management].[Case]([Case_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'An instance of a disposition of a Case or other',
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Disposition'
GO

