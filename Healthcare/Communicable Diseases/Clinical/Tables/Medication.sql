CREATE TABLE [Clinical].[Medication] (
   [Medication_ID]                VARCHAR(40)   NOT NULL,
   [Alternate_ID]                 VARCHAR(40)   NULL,
   [Medication_Code_ID]           VARCHAR(30)   NULL,
   [Dose_Form_Code_ID]            VARCHAR(30)   NULL,
   [Purpose_Code_ID]              VARCHAR(30)   NULL,
   [Prescribed_DateTime]          DATETIMEOFFSET NULL,
   [Monitor_Medication_Flag]      CHAR(1) NULL,
   [Monitor_DateTime]             DATETIMEOFFSET NULL,
   [Dosage_Ordered]               DECIMAL(5, 3) NULL,
   [Dosage_Ordered_Unit_Code_ID]  VARCHAR(30)   NULL,
   [Dosage_Strength]              DECIMAL(5, 3) NULL,
   [Dosage_Strength_Unit_Code_ID] VARCHAR(30)   NULL,
   [Measure_Unit]                 DECIMAL(5, 3) NULL,
   [Measure_Unit_Code_ID]         VARCHAR(30)   NULL,
   [Dosage_Calculated]            VARCHAR(30)   NULL,
   [Frequency_Code_ID]            VARCHAR(30)   NULL,
   [AdditionalInstruction]        VARCHAR(256)  NULL,
   
   [Status_Code_ID]         VARCHAR(30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

   -- external references
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

   CONSTRAINT [pk_Medication] PRIMARY KEY CLUSTERED ([Medication_ID] ASC),
   CONSTRAINT [fk_Medication_DosageForm] FOREIGN KEY ([Dose_Form_Code_ID]) 
      REFERENCES [Clinical].[Dosage_Form_Code] ([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Medication',
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Medication',
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Details about a substance for medical treatment, medicine or drug',
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Medication'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'The form of a dosage such as 25mg of powder, tablets, capsule, or other',
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Medication', 
   @level2type = N'COLUMN',   @level2name = 'Dose_Form_Code_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Specification and details of an order dosage as stated by a practictioner', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Medication', 
   @level2type = N'COLUMN',   @level2name = 'Dosage_Ordered';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Amount of a dosage such as 2.5 milligram Dosage', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical',
   @level1type = N'TABLE',    @level1name = N'Medication',
   @level2type = N'COLUMN',   @level2name = 'Dosage_Strength';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Unit of Measure such as 2 mL per capsule per tablet', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical',
   @level1type = N'TABLE',    @level1name = N'Medication',
   @level2type = N'COLUMN',   @level2name = N'Measure_Unit';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Frequency of ingestion of a medication', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Medication', 
   @level2type = N'COLUMN',   @level2name = 'Frequency_Code_ID';
GO

