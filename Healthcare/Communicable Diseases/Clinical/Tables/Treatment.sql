CREATE TABLE [Clinical].[Treatment] (
   [Treatment_Id]           VARCHAR(40) NOT NULL,
   [Given_Indicator]        BIT NULL,
   [Name]                   VARCHAR(80) NULL,
   [Start_Date]             DATETIME2(7) NULL,
   [End_Date]               DATETIME2(7) NULL,
   [Quantity]               DECIMAL(18, 5) NULL,
   [Form]                   VARCHAR(30) NULL,
   [Comment]                VARCHAR(4000) NULL,
   
   [Status_Code_ID]         VARCHAR(30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

   -- external reference
   [Activity_ID]            VARCHAR(40) NULL,
   [Case_ID]                VARCHAR(40) NULL,
   [Subject_ID]             VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Treatment] PRIMARY KEY CLUSTERED ([Treatment_Id] ASC),
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Action) Activity', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Treatment',
   @level2type = N'COLUMN',   @level2name = 'Activity_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Treatment',
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Treatment',
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Identify and describe codes for a session of medical care or the administration of medication',
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Treatment'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'If treatment was administered', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Treatment',
   @level2type = N'COLUMN',   @level2name = 'Given_Indicator';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Name of treatment', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Treatment', 
   @level2type = N'COLUMN',   @level2name = 'Name';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Date treatment began/was given', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical',
   @level1type = N'TABLE',    @level1name = N'Treatment', 
   @level2type = N'COLUMN',   @level2name = 'Start_Date';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Date treatment ended', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical',
   @level1type = N'TABLE',    @level1name = N'Treatment',
   @level2type = N'COLUMN',   @level2name = 'End_Date';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Amount of the treatment given', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical',
   @level1type = N'TABLE',    @level1name = N'Treatment',
   @level2type = N'COLUMN',   @level2name = 'Quantity';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Method treatment was administered',
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Treatment', 
   @level2type = N'COLUMN',   @level2name = 'Form';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Comments about treatment this will be changed to a note',
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Treatment', 
   @level2type = N'COLUMN',   @level2name = 'Comment';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Status of treatment', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Treatment', 
   @level2type = N'COLUMN',   @level2name = 'Status_Code_ID';

