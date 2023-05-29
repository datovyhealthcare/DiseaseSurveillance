-- Employment Type - describe full-time, temporary, contractor, other or so
-- Occupation Code - define what kind of job or service is provided
CREATE TABLE [Entity].[Employment]
(
   [Employment_ID]         VARCHAR(40) NOT NULL,

   [Employer_ID]           VARCHAR(40) NULL,
   [Employee_ID]           VARCHAR(40) NULL,

   [Type_ID]               VARCHAR(30) NULL,
   [Name]                  VARCHAR(80) NULL,
   [Description]           VARCHAR(256) NULL,

   [Industry_Text]         VARCHAR(1024) NULL,
   [Industry_Code_ID]      VARCHAR(30) NULL,
   [Occupation_Text]       VARCHAR(1024) NULL,
   [Occupation_Code_ID]    VARCHAR(30) NULL,

   [Start_Date]            DATE NULL,
   [Ended_Date]            DATE NULL,

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

   CONSTRAINT [pk_Employment] PRIMARY KEY CLUSTERED ([Employment_ID] ASC),
   CONSTRAINT [fk_Employment_Employer] FOREIGN KEY ([Employer_ID])
      REFERENCES [Entity].[Organization] ([Organization_ID]),
   CONSTRAINT [fk_Employment_Employee] FOREIGN KEY ([Employee_ID])
      REFERENCES [Entity].[Person] ([Person_ID]),
   CONSTRAINT [fk_Employment_Type] FOREIGN KEY ([Type_ID])
      REFERENCES [Entity].[Employment_Type] ([Type_ID]),
   CONSTRAINT [fk_Employment_Industry_Code] FOREIGN KEY ([Industry_Code_ID])
      REFERENCES [Entity].[Industry_Code]([Code_ID]),
   CONSTRAINT [fk_Employment_Occupation_Code] FOREIGN KEY ([Occupation_Code_ID])
      REFERENCES [Entity].[Occupation_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A person job/employment details',
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Employment'
GO
