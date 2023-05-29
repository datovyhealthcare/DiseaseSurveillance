CREATE TABLE [Entity].[Person] (
   [Person_ID]                       VARCHAR(40) NOT NULL,
   [Alternate_ID]                    VARCHAR(40) NULL,
   [Type_ID]                         VARCHAR(30) NULL,

   [Birth_DateTime]                  DATETIMEOFFSET NULL,
   [Birth_Date]                      DATE NULL,
   [Birth_Date_Text]                 VARCHAR(50) NULL,
   [Birth_Location_ID]               VARCHAR(30) NULL,
   [Birth_Weight]                    INT NULL,

   [Name_Type_ID]                    VARCHAR(30) NULL,
   [Name_Given]                      VARCHAR(80) NULL,
   [Name_Middle]                     VARCHAR(80) NULL,
   [Name_Family]                     VARCHAR(80) NULL,
   [Name_Prefix_Code_ID]             VARCHAR(30) NULL,
   [Name_Suffix_Code_ID]             VARCHAR(30) NULL,
   [Name_Full]                       VARCHAR(128) NULL,

   [Sex_Birth_Code_ID]               VARCHAR(30) NULL,
   [Sex_Code_ID]                     VARCHAR(30) NULL,
   [Gender_Identity_Code_ID]         VARCHAR(30) NULL,
   [Sexual_Orientation_Code_ID]      VARCHAR(30) NULL,
   [Height]                          INT         NULL,
   [Height_Unit_Code_ID]             VARCHAR(30) NULL,
   [Weight]                          INT         NULL,
   [Weight_Unit_Code_ID]             VARCHAR(30) NULL,
   [Ethnicity_Code_ID]               VARCHAR(30) NULL,
   [Race_Code_ID]                    VARCHAR(30) NULL,
   [Language_Primary_ID]             VARCHAR(30) NULL,
   [Language_Secondary_ID]           VARCHAR(30) NULL,
   [Education_Level_Highest_Code_ID] VARCHAR(30) NULL,
   [Religion_Code_ID]                VARCHAR(30) NULL,

   [Marital_Status_Date]             DATE NULL,
   [Marital_Status_Code_ID]          VARCHAR(30)  NULL,
   [Smoking_Status_Date]             DATE NULL,
   [Smoking_Status_Code_ID]          VARCHAR(30)  NULL,

   [Status_Code_ID]                  VARCHAR(30)  NULL,
   [Status_DateTime]                 DATETIMEOFFSET NULL,

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

   CONSTRAINT [pk_Person] PRIMARY KEY CLUSTERED ([Person_ID] ASC),
   CONSTRAINT [fk_Person_Type] FOREIGN KEY ([Type_ID]) 
      REFERENCES [Entity].[Person_Type] ([Type_ID]),
   CONSTRAINT [fk_Person_Name_Type] FOREIGN KEY ([Name_Type_ID])
      REFERENCES [Entity].[Name_Type] ([Type_ID]),

   CONSTRAINT [fk_Person_Ethnicity_Code] FOREIGN KEY ([Ethnicity_Code_ID])
      REFERENCES [Entity].[Ethnicity_Code] ([Code_ID]),
   CONSTRAINT [fk_Person_Race_Code] FOREIGN KEY ([Race_Code_ID])
      REFERENCES [Entity].[Race_Code] ([Code_ID]),

   CONSTRAINT [fk_Person_Sex_Code] FOREIGN KEY ([Sex_Code_ID])
      REFERENCES [Entity].[Sex_Code] ([Code_ID]),
   CONSTRAINT [fk_Person_Gender_Identity_Code] FOREIGN KEY ([Gender_Identity_Code_ID])
      REFERENCES [Entity].[Gender_Identity_Code] ([Code_ID]),
   CONSTRAINT [fk_Person_Sexual_Orientation_Code] FOREIGN KEY ([Sexual_Orientation_Code_ID])
      REFERENCES [Entity].[Sexual_Orientation_Code] ([Code_ID]),
   CONSTRAINT [fk_Person_Marital_Status_Code] FOREIGN KEY ([Marital_Status_Code_ID])
      REFERENCES [Entity].[Marital_Status_Code] ([Code_ID]),
   CONSTRAINT [fk_Person_Religion_Code] FOREIGN KEY ([Religion_Code_ID])
      REFERENCES [Entity].[Religion_Code] ([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A description and definition of a person, its main identification, demographics and other details',
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Person'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A name type', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Name_Type_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A given name', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Name_Given';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A middle name', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Name_Middle';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A family name', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Name_Family';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A name prefix', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Name_Prefix_Code_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A name suffix', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Name_Suffix_Code_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A person or entity full name', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Name_Full';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Birth weight (in grams)', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Birth_Weight';
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'Birth Location ID is a reference to a location detailed elsewhere', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Birth_Location_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Sex at Birth: Male, Female, Other, Unknown', 
   @level0type = N'SCHEMA',   @level0name = N'Entity',
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Sex_Birth_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'Current Sex Code: Male, Female, Other, Unknown', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Person', 
   @level2type = N'COLUMN',   @level2name = 'Sex_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'MS_Description', @value = 'The person identifies the Identity as', 
   @level0type = N'SCHEMA',   @level0name = N'Entity', 
   @level1type = N'TABLE',    @level1name = N'Person',
   @level2type = N'COLUMN',   @level2name = 'Gender_Identity_Code_ID';
GO
