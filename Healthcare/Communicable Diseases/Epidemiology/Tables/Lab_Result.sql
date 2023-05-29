CREATE TABLE [Epidemiology].[Lab_Result] (
   [Lab_Result_ID]         VARCHAR(40) NOT NULL,
   [Laboratory_ID]         VARCHAR(40) NULL,
   [Lab_Result_DateTime]   DATETIME2(7) NULL,

   [Result_Type_ID]        VARCHAR(30) NULL,
   [Result_Value]          DECIMAL(18, 5) NULL,
   [Result_Unit]           VARCHAR(50) NULL,
   
   [Status_Code_ID]        VARCHAR(30) NULL,
   [Status_DateTime]       DATETIMEOFFSET NULL,

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

   CONSTRAINT [pk_Lab_Result] PRIMARY KEY CLUSTERED ([Lab_Result_ID] ASC),
   CONSTRAINT [fk_Lab_Result_Laboratory] FOREIGN KEY ([Laboratory_ID]) 
      REFERENCES [Epidemiology].[Laboratory] ([Laboratory_ID]),
   CONSTRAINT [fk_Lab_Result_Type] FOREIGN KEY ([Result_Type_ID])
      REFERENCES [Epidemiology].[Lab_Result_Type]([Type_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Provide details about a Lab test results',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Result'
GO


