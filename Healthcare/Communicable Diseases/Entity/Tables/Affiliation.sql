CREATE TABLE [Entity].[Affiliation]
(
   [Affiliation_ID]         VARCHAR(40) NOT NULL,

   [Organization_ID]        VARCHAR(40) NULL,
   [Person_ID]              VARCHAR(40) NULL,

   [Entity_Name]            VARCHAR(128) NULL,

   [Affiliated_Flag_ID]     VARCHAR(30) NULL,
   [Enrolled_Flag_ID]       VARCHAR(30) NULL,
   [Enrolled_Date]          DATE NULL,

   [Status_Code_ID]         VARCHAR (30) NULL,
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

   CONSTRAINT [pk_Affiliation] PRIMARY KEY CLUSTERED ([Affiliation_ID] ASC),
   CONSTRAINT [fk_Affiliation_Person] FOREIGN KEY ([Person_ID])
      REFERENCES [Entity].[Person]([Person_ID]),
   CONSTRAINT [fk_Affiliation_Affiliated_Flag] FOREIGN KEY ([Affiliated_Flag_ID])
      REFERENCES [Entity].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Affiliation_Enrolled_Flag] FOREIGN KEY ([Enrolled_Flag_ID])
      REFERENCES [Entity].[Indicator_Flag_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'An association of an entity with another organization or person with a common goal or purpose',
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Affiliation'
GO
