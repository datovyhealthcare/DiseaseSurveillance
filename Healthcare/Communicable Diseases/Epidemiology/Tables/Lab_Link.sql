CREATE TABLE [Epidemiology].[Lab_Link]
(
   [Lab_Link_ID]            VARCHAR(40) NOT NULL,

   [Laboratory_ID]          VARCHAR(40) NOT NULL,

   -- external references
   [Case_ID]                VARCHAR(40) NULL,
   [Subject_ID]             VARCHAR(40) NULL,

   [Specimen_ID]            VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Lab_Link] PRIMARY KEY CLUSTERED ([Lab_Link_ID] ASC),
   CONSTRAINT [fk_Lab_Link_Lab] FOREIGN KEY ([Laboratory_ID])
      REFERENCES [Epidemiology].[Laboratory]([Laboratory_ID]),
   CONSTRAINT [fk_Lab_Link_Specimen] FOREIGN KEY ([Specimen_ID])
      REFERENCES [Epidemiology].[Specimen]([Specimen_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Management) Case',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Link',
   @level2type = N'COLUMN',   @level2name = 'Case_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Person',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Link',
   @level2type = N'COLUMN',   @level2name = 'Subject_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Association of a Lab with an external reference such as a Patient, Specimen, or other',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Link'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Lab message patient Identifier that will be used along with the reference laboratory and specimen identifier to uniquely identify a VPD lab message',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Link',
   @level2type = N'COLUMN',   @level2name = 'Specimen_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Lab message patient Identifier that will be used along with the reference laboratory and specimen identifier to uniquely identify a VPD lab message',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Link',
   @level2type = N'COLUMN',   @level2name = 'Subject_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Reference laboratory that will be used along with the patient identifier and specimen identifier to uniquely identify a lab message',
   @level0type = N'SCHEMA',   @level0name = N'Epidemiology', 
   @level1type = N'TABLE',    @level1name = N'Lab_Link',
   @level2type = N'COLUMN',   @level2name = 'Laboratory_ID';
GO
