-- used in Babesiosis Message v1 - such as infected Tick bite
CREATE TABLE [Clinical].[Blood_Transfusion_Report]
(
   [Blood_Transfusion_ID]   VARCHAR(40) NOT NULL,

   [Donated_Product_Code_ID]  VARCHAR(30) NULL,
   [Donated_Date]             DATE NULL,
   [Donor_Flag_ID]            VARCHAR(30) NULL,
   [Donor_Implicated_Flag_ID] VARCHAR(30) NULL,

   [Transfusion_Associated_Flag_ID] VARCHAR(30) NULL,
   [Transfused_Product_Code_ID]     VARCHAR(30) NULL,
   [Transfused_Date]                DATE NULL,

   [Organ_Transplant_Flag_ID] VARCHAR(30) NULL,

   -- external references
   [Case_ID]                VARCHAR(40) NULL,
   [Subject_ID]             VARCHAR(40) NULL,

   [Status_Code_ID]         VARCHAR(30) NULL,
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

   CONSTRAINT [pk_Blood_Transfusion] PRIMARY KEY CLUSTERED ([Blood_Transfusion_ID] ASC),
   CONSTRAINT [fk_Blood_Transfusion_Donor_Implicated_Flag] FOREIGN KEY ([Donor_Implicated_Flag_ID])
      REFERENCES [Clinical].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Blood_Transfusion_Donor_Flag] FOREIGN KEY ([Donor_Flag_ID])
      REFERENCES [Clinical].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Blood_Transfusion_Organ_Transplant_Flag] FOREIGN KEY ([Organ_Transplant_Flag_ID])
      REFERENCES [Clinical].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Blood_Transfusion_Transfusion_Associated_Flag] FOREIGN KEY ([Transfusion_Associated_Flag_ID])
      REFERENCES [Clinical].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Blood_Transfusion_Donated_Product] FOREIGN KEY ([Donated_Product_Code_ID])
      REFERENCES [Clinical].[Blood_Product_Code]([Code_ID]),
   CONSTRAINT [fk_Blood_Transfusion_Transfused_Product] FOREIGN KEY ([Transfused_Product_Code_ID])
      REFERENCES [Clinical].[Blood_Product_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Blood_Transfusion_Report',
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference for (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Blood_Transfusion_Report',
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Report detaisl about a blood transfussions and donations', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Blood_Transfusion_Report'
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Was the subject a blood donor identified during a transfusion investigation i.e., had positive Babesia test results and was linked to an infected recipient)? YNU', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Blood_Transfusion_Report',
   @level2type = N'COLUMN',   @level2name = 'Donor_Implicated_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'In the year before symptom onset or diagnosis (use earlier date), did the subject donate blood? YNU', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Blood_Transfusion_Report',
   @level2type = N'COLUMN',   @level2name = 'Donor_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'In the month before symptom onset or diagnosis (use earlier date), did the subject receive an organ transplant? YNU', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Blood_Transfusion_Report',
   @level2type = N'COLUMN',   @level2name = 'Organ_Transplant_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Was the subject’s infection transfusion associated? YNU', 
   @level0type = N'SCHEMA',   @level0name = N'Clinical', 
   @level1type = N'TABLE',    @level1name = N'Blood_Transfusion_Report',
   @level2type = N'COLUMN',   @level2name = 'Transfusion_Associated_Flag_ID';
GO


