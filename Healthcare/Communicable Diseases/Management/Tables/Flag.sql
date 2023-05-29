CREATE TABLE [Management].[Flag] (
   [Flag_ID]                VARCHAR(40)  NOT NULL,
   [Case_ID]                VARCHAR(40)  NULL,
   [Code_ID]                VARCHAR(30)  NULL,
   [Value]                  VARCHAR(10)  NULL,
   [Description]            VARCHAR(256) NULL,

   [Status_Code_ID]         VARCHAR(30)  NULL,
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

   CONSTRAINT [pk_Management_Flag] PRIMARY KEY CLUSTERED ([Flag_ID] ASC),
   CONSTRAINT [fk_Flag_Case] FOREIGN KEY ([Case_ID])
     REFERENCES [Management].[Case] ([Case_ID]),
   CONSTRAINT [fk_Flag_Code] FOREIGN KEY ([Code_ID]) 
      REFERENCES [Management].[Flag_Code] ([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'An instance of a code or variable used to indicate a property or state of something important',
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Flag'
GO

