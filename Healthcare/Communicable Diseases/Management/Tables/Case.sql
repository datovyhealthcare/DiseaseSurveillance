CREATE TABLE [Management].[Case] (
   [Case_ID]                VARCHAR (40) NOT NULL,
   [Type_ID]                VARCHAR (30) NULL,
   [Alternate_ID]           VARCHAR (40) NULL,
   
   -- external references
   [Officer_ID]             VARCHAR (40) NULL,
   [Subject_ID]             VARCHAR (40) NULL,
   [Provider_ID]            VARCHAR (40) NULL,
   [Organization_ID]        VARCHAR (40) NULL,

   [Disposition_ID]         VARCHAR (40) NULL,

   [Probable_Reason_Code_ID]  VARCHAR(30) NULL,
   [Detection_Method_Code_ID] VARCHAR(30) NULL,

   -- external references
   [Profile_ID]             VARCHAR (40) NULL,

   [Priority_Code_ID]       VARCHAR (30) NULL,

   [Person_Age]              INT NULL,
   [Person_Age_Unit_Code_ID] VARCHAR (30) NULL,
   
   [Class_Status_Code_ID]   VARCHAR (30) NULL,

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

   CONSTRAINT [pk_Case] PRIMARY KEY CLUSTERED ([Case_ID] ASC),
   CONSTRAINT [fk_Case_Case_Disposition] FOREIGN KEY ([Disposition_ID]) 
      REFERENCES [Management].[Disposition] ([Disposition_ID]),
   CONSTRAINT [fk_Case_CasePriorityCode] FOREIGN KEY ([Priority_Code_ID]) 
      REFERENCES [Management].[Priority_Code] ([Code_ID]),
   CONSTRAINT [fk_Case_CaseType] FOREIGN KEY ([Type_ID]) 
      REFERENCES [Management].[Case_Type] ([Type_ID]),
   CONSTRAINT [fk_Case_Class_Status] FOREIGN KEY ([Class_Status_Code_ID]) 
      REFERENCES [Management].[Status_Code] ([Code_ID]),
   CONSTRAINT [fk_Case_Class_Probable_Reason] FOREIGN KEY ([Probable_Reason_Code_ID]) 
      REFERENCES [Management].[Probable_Reason_Code] ([Code_ID]),
   CONSTRAINT [fk_Case_Class_Detection_Method] FOREIGN KEY ([Detection_Method_Code_ID]) 
      REFERENCES [Management].[Detection_Method_Code] ([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Officer', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Case', 
   @level2type = N'COLUMN',   @level2name = N'Officer_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Case', 
   @level2type = N'COLUMN',   @level2name = N'Subject_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Provider) Provider', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Case', 
   @level2type = N'COLUMN',   @level2name = N'Provider_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Organization', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Case', 
   @level2type = N'COLUMN',   @level2name = N'Organization_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Surveillance) Profile', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Case', 
   @level2type = N'COLUMN',   @level2name = N'Profile_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'An aggregation of information about a set of related activities and events',
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Case'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Person/Patient age unit at time of case investigation', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Case', 
   @level2type = N'COLUMN',   @level2name = N'Person_Age_Unit_Code_ID';
GO
