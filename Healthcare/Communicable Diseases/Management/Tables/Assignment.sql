CREATE TABLE [Management].[Assignment]
(
   [Assignment_ID]          VARCHAR(40) NOT NULL,
   [Assigned_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),

   [Manager_ID]             VARCHAR(40) NULL,
   [Officer_ID]             VARCHAR(40) NULL,

   [Status_Code_ID]         VARCHAR(30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

   -- assigned item
   [Case_ID]                VARCHAR(40) NULL,
   [Referral_ID]            VARCHAR(40) NULL,

   -- external assigned concept (see Generic.Element.Element_ID)
   [Concept_ID]             VARCHAR(40) NULL,

   -- external references
   [Contact_ID]             VARCHAR(40) NULL,
   [Subject_ID]             VARCHAR(40) NULL,

   -- assignment context
   [Priority_Code_ID]       VARCHAR(30) NULL,

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

   CONSTRAINT [pk_Assignment] PRIMARY KEY CLUSTERED ([Assignment_ID] ASC),
   CONSTRAINT [fk_Assignment_Case] FOREIGN KEY ([Case_ID])
      REFERENCES [Management].[Case]([Case_ID]),
   CONSTRAINT [fk_Assignment_Referral] FOREIGN KEY ([Referral_ID])
      REFERENCES [Management].[Referral]([Referral_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Contact', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Assignment', 
   @level2type = N'COLUMN',   @level2name = N'Contact_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Assignment', 
   @level2type = N'COLUMN',   @level2name = N'Subject_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Generic) Element', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Assignment', 
   @level2type = N'COLUMN',   @level2name = N'Concept_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A transfer of a responsability to an agent, officer or other',
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Assignment'
GO
