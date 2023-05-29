CREATE TABLE [Surveillance].[Contact_Report]
(
   [Contact_Report_ID]      VARCHAR(40) NOT NULL,
   [Report_Date]            DATE NULL,

   [Contacted_Date]                DATE NULL,
   [Contact_Type_ID]               VARCHAR(30) NULL,
   [Contact_Type_Other_Flag_ID]    VARCHAR(30) NULL,
   [Contact_Type_Other_Text]       VARCHAR(128) NULL,
   [Contact_Flag_ID]               VARCHAR(30) NULL,

   [Epidemiology_Linked_Flag_ID]   VARCHAR(30) NULL,
   [Case_Linked_Flag_ID]           VARCHAR(30) NULL,
   [Child_Care_Linked_Flag_ID]     VARCHAR(30) NULL,
   [Child_Care_Case_Flag_ID]       VARCHAR(30) NULL,

   [Sexual_Preference_Code_ID]     VARCHAR(30) NULL,
   [Sexual_Partner_Male_Total]     INT NULL,
   [Sexual_Partner_Female_Total]   INT NULL,

   [Drug_Used_Flag_ID]             VARCHAR(30) NULL,
   [Drug_Street_Used_Flag_ID]      VARCHAR(30) NULL,

   [Traveled_Flag_ID]              VARCHAR(30) NULL,
   [Travel_Detail_ID]              VARCHAR(40) NULL,

   [Outbreak_Source_Flag_ID]       VARCHAR(30) NULL,
   [Outbreak_Foodborne_Flag_ID]    VARCHAR(30) NULL,
   [Outbreak_Food_Item_Text]       VARCHAR(128) NULL,
   [Outbreak_Waterborne_Flag_ID]   VARCHAR(30) NULL,
   [Outbreak_Unidentified_Flag_ID] VARCHAR(30) NULL,

   [Food_Handler_Flag_ID]          VARCHAR(30) NULL,

   -- external references...
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

   CONSTRAINT [pk_Contact_Report] PRIMARY KEY CLUSTERED ([Contact_Report_ID] ASC),
   CONSTRAINT [fk_Contact_Report_Type] FOREIGN KEY ([Contact_Type_ID])
      REFERENCES [Surveillance].[Contact_Type]([Type_ID]),
   CONSTRAINT [fk_Contact_Report_Flag] FOREIGN KEY ([Contact_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Type_Other_Flag] FOREIGN KEY ([Contact_Type_Other_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Epidemiology_Linked_Flag] FOREIGN KEY ([Epidemiology_Linked_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Case_Linked_Flag] FOREIGN KEY ([Case_Linked_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Child_Care_Linked_Flag] FOREIGN KEY ([Child_Care_Linked_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Child_Care_Case_Flag] FOREIGN KEY ([Child_Care_Case_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Sexual_Preference_Code] FOREIGN KEY ([Sexual_Preference_Code_ID])
      REFERENCES [Surveillance].[Sexual_Preference_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Drug_User_Flag] FOREIGN KEY ([Drug_Used_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Drug_Street_User_Flag] FOREIGN KEY ([Drug_Street_Used_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Traveled_Flag] FOREIGN KEY ([Traveled_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Outbreak_Source_Flag] FOREIGN KEY ([Outbreak_Source_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Outbreak_Foodborne_Flag] FOREIGN KEY ([Outbreak_Foodborne_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Outbreak_Waterborne_Flag] FOREIGN KEY ([Outbreak_Waterborne_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Outbreak_Unidentified_Flag] FOREIGN KEY ([Outbreak_Unidentified_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID]),
   CONSTRAINT [fk_Contact_Report_Contact_Food_Handler_Flag] FOREIGN KEY ([Food_Handler_Flag_ID])
      REFERENCES [Surveillance].[Indicator_Flag_Code]([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report', 
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report', 
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Details about an encounter of a person with another or a situation',
   @level0type = N'SCHEMA',   @level0name = N'Surveillance',
   @level1type = N'TABLE',    @level1name = N'Contact_Report'
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'During the 2 weeks prior to the onset of symptoms or while ill, was the subject employed as a food handler?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Food_Handler_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Subject is associated with an outbreak that does not have an identified source?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Outbreak_Unidentified_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Subject is associated with a foodborne outbreak that is associated with an infected food handler?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Outbreak_Waterborne_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Subject is associated with a foodborne outbreak that is associated with an infected food handler?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Outbreak_Foodborne_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'During the 2-6 weeks prior to the onset of symptoms, did the subject use street drugs but not inject?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Drug_Street_Used_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'During the 2-6 weeks prior to the onset of symptoms, did the subject inject drugs not prescribed by a doctor?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Drug_Used_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'What is/was the subject''s sexual preference?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Sexual_Preference_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Was there an identified virus case in the childcare facility?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Child_Care_Case_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'During the 2-6 weeks prior to the onset of symptoms, was the subject in contact with a person with confirmed or suspected virus infection?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Case_Linked_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Specify if this case Epidemiologically-linked to another confirmed or probable case of virus', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Epidemiology_Linked_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'During the 2-6 weeks prior to the onset of symptoms, type of contact the subject had with a person with confirmed or suspected virus infection?', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Contact_Type_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'During the 2-6 weeks prior to the onset of symptoms, answer (Yes, No, Unknown) for each type of contact the subject had with a person with confirmed or suspected virus infection', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Contact_Flag_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Subject Person ID that was contacted', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Subject_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Case ID of subject that was contacted', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Contact_Report',
   @level2type = N'COLUMN',   @level2name = 'Case_ID';
GO

