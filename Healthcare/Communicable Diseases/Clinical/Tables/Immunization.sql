CREATE TABLE [Clinical].[Immunization] (
   [Immunization_ID]        VARCHAR (40)  NOT NULL,
   [Type_ID]                VARCHAR (30)  NULL,

   [Vaccination_Record_ID]        VARCHAR(40) NULL,
   [Vaccine_Type_ID]              VARCHAR(30) NULL,
   [Vaccine_Manufacturer_Code_ID] VARCHAR(30) NULL,
   [Vaccine_Event_Source_Code_ID] VARCHAR(30) NULL,
   [Vaccinated_Flag_ID]           VARCHAR(30) NULL,

   [Administered_DateTime]   DATETIMEOFFSET NULL,
   [Dosage_Series_Number]    VARCHAR (20) NULL,
   [Dosage_Amount]           VARCHAR (50) NULL,
   [Lot_Number]              VARCHAR (20) NULL,
   [Expiration_Date]         DATETIME2 (7) NULL,
   [Drug_Code_ID]            VARCHAR (30) NULL,
   [Reason_Not_Give_Code_ID] VARCHAR(30) NULL,

   [Status_Code_ID]         VARCHAR(30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

   -- external references
   [Activity_ID]            VARCHAR(40) NULL,
   [Organization_ID]        VARCHAR(40) NULL,
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

   CONSTRAINT [pk_Immunization] PRIMARY KEY CLUSTERED ([Immunization_ID] ASC),
   CONSTRAINT [fk_Immunization_Vaccine_Type] FOREIGN KEY ([Vaccine_Type_ID])
      REFERENCES [Clinical].[Vaccine_Type] ([Type_ID]),
   CONSTRAINT [fk_Immunization_Vaccine_Manufacturer_Code] FOREIGN KEY ([Vaccine_Manufacturer_Code_ID])
      REFERENCES [Clinical].[Vaccine_Manufacturer_Code] ([Code_ID]),
   CONSTRAINT [fk_Immunization_Vaccine_Event_Source_Code] FOREIGN KEY ([Vaccine_Event_Source_Code_ID])
      REFERENCES [Clinical].[Vaccine_Event_Source_Code] ([Code_ID]),
   CONSTRAINT [fk_Immunization_Vaccine_Reason_Not_Given_Code] FOREIGN KEY ([Reason_Not_Give_Code_ID])
      REFERENCES [Clinical].[Vaccine_Reason_Not_Given_Code] ([Code_ID]),
   CONSTRAINT [fk_Immunization_Vaccinated_Flag] FOREIGN KEY ([Vaccinated_Flag_ID])
      REFERENCES [Clinical].[Indicator_Flag_Code] ([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Action) Activity', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Immunization',
   @level2type = N'COLUMN',   @level2name = 'Activity_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Entity) Organization', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Immunization',
   @level2type = N'COLUMN',   @level2name = 'Organization_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Immunization',
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Immunization',
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Details of an immunization process or event tipically associated with a vaccine',
   @level0type = N'SCHEMA',   @level0name = N'Clinical',
   @level1type = N'TABLE',    @level1name = N'Immunization';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Manufacturer ID and Name from Organization Table as a lookup', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Immunization', 
   @level2type = N'COLUMN',   @level2name = 'Organization_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'There are several types of vaccines, including: Inactivated vaccines. Live-attenuated vaccines. Messenger RNA (mRNA) vaccines.', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical',
   @level1type = N'TABLE',    @level1name = N'Immunization',
   @level2type = N'COLUMN',   @level2name = 'Type_ID';

