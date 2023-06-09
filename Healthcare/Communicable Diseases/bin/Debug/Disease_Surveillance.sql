﻿/*
Deployment script for Disease_Surveillance

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Disease_Surveillance"
:setvar DefaultFilePrefix "Disease_Surveillance"
:setvar DefaultDataPath "C:\Users\tprav\AppData\Local\Microsoft\VisualStudio\SSDT\Datovy"
:setvar DefaultLogPath "C:\Users\tprav\AppData\Local\Microsoft\VisualStudio\SSDT\Datovy"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [Entity].[Person]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [DF__Person__Session___2E90DD8E];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [Entity].[Person]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [DF__Person__Tenant_I__26EFBBC6];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [Entity].[Person]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [DF__Person__Record_S__2D9CB955];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [Entity].[Person]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [DF__Person__Version___2AC04CAA];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [Entity].[Person]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [DF__Person__Created___2BB470E3];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [Entity].[Person]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [DF__Person__Effectiv__29CC2871];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [Entity].[Person]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [DF__Person__Updated___2CA8951C];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [Entity].[Person]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [DF__Person__Data_Own__27E3DFFF];


GO
PRINT N'Dropping Default Constraint unnamed constraint on [Entity].[Person]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [DF__Person__Sequence__28D80438];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Contact_Person]...';


GO
ALTER TABLE [Entity].[Contact] DROP CONSTRAINT [fk_Contact_Person];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Person_Death]...';


GO
ALTER TABLE [Entity].[Person_Death] DROP CONSTRAINT [fk_Person_Death];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Person_Gender_Identity_Code]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [fk_Person_Gender_Identity_Code];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Person_Sexual_Orientation_Code]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [fk_Person_Sexual_Orientation_Code];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Person_Marital_Status_Code]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [fk_Person_Marital_Status_Code];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Person_Religion_Code]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [fk_Person_Religion_Code];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Person_Type]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [fk_Person_Type];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Person_Name_Type]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [fk_Person_Name_Type];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Person_Ethnicity_Code]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [fk_Person_Ethnicity_Code];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Person_Race_Code]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [fk_Person_Race_Code];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Person_Sex_Code]...';


GO
ALTER TABLE [Entity].[Person] DROP CONSTRAINT [fk_Person_Sex_Code];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Person_Flag_Person]...';


GO
ALTER TABLE [Entity].[Person_Flag] DROP CONSTRAINT [fk_Person_Flag_Person];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Location_Link_Person]...';


GO
ALTER TABLE [Entity].[Location_Link] DROP CONSTRAINT [fk_Location_Link_Person];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Identification_Person]...';


GO
ALTER TABLE [Entity].[Identification] DROP CONSTRAINT [fk_Identification_Person];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Communication_Person]...';


GO
ALTER TABLE [Entity].[Communication] DROP CONSTRAINT [fk_Communication_Person];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Officer_Person]...';


GO
ALTER TABLE [Entity].[Officer] DROP CONSTRAINT [fk_Officer_Person];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Contact_Emergency_Person]...';


GO
ALTER TABLE [Entity].[Contact_Emergency] DROP CONSTRAINT [fk_Contact_Emergency_Person];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Employment_Employee]...';


GO
ALTER TABLE [Entity].[Employment] DROP CONSTRAINT [fk_Employment_Employee];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Note_Person]...';


GO
ALTER TABLE [Entity].[Note] DROP CONSTRAINT [fk_Note_Person];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Media_Person]...';


GO
ALTER TABLE [Entity].[Media] DROP CONSTRAINT [fk_Media_Person];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Item_Reference_Link_Person]...';


GO
ALTER TABLE [Entity].[Item_Link] DROP CONSTRAINT [fk_Item_Reference_Link_Person];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Uri_Person]...';


GO
ALTER TABLE [Entity].[Uri] DROP CONSTRAINT [fk_Uri_Person];


GO
PRINT N'Dropping Foreign Key [Entity].[fk_Affiliation_Person]...';


GO
ALTER TABLE [Entity].[Affiliation] DROP CONSTRAINT [fk_Affiliation_Person];


GO
PRINT N'Starting rebuilding table [Entity].[Person]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [Entity].[tmp_ms_xx_Person] (
    [Person_ID]                       VARCHAR (40)       NOT NULL,
    [Alternate_ID]                    VARCHAR (40)       NULL,
    [Type_ID]                         VARCHAR (30)       NULL,
    [Birth_DateTime]                  DATETIMEOFFSET (7) NULL,
    [Birth_Date]                      DATE               NULL,
    [Birth_Date_Text]                 VARCHAR (50)       NULL,
    [Birth_Location_ID]               VARCHAR (30)       NULL,
    [Birth_Weight]                    INT                NULL,
    [Name_Type_ID]                    VARCHAR (30)       NULL,
    [Name_Given]                      VARCHAR (80)       NULL,
    [Name_Middle]                     VARCHAR (80)       NULL,
    [Name_Family]                     VARCHAR (80)       NULL,
    [Name_Prefix_Code_ID]             VARCHAR (30)       NULL,
    [Name_Suffix_Code_ID]             VARCHAR (30)       NULL,
    [Name_Full]                       VARCHAR (128)      NULL,
    [Sex_Birth_Code_ID]               VARCHAR (30)       NULL,
    [Sex_Code_ID]                     VARCHAR (30)       NULL,
    [Gender_Identity_Code_ID]         VARCHAR (30)       NULL,
    [Sexual_Orientation_Code_ID]      VARCHAR (30)       NULL,
    [Height]                          INT                NULL,
    [Height_Unit_Code_ID]             VARCHAR (30)       NULL,
    [Weight]                          INT                NULL,
    [Weight_Unit_Code_ID]             VARCHAR (30)       NULL,
    [Ethnicity_Code_ID]               VARCHAR (30)       NULL,
    [Race_Code_ID]                    VARCHAR (30)       NULL,
    [Language_Primary_ID]             VARCHAR (30)       NULL,
    [Language_Secondary_ID]           VARCHAR (30)       NULL,
    [Education_Level_Highest_Code_ID] VARCHAR (30)       NULL,
    [Religion_Code_ID]                VARCHAR (30)       NULL,
    [Marital_Status_Date]             DATE               NULL,
    [Marital_Status_Code_ID]          VARCHAR (30)       NULL,
    [Smoking_Status_Date]             DATE               NULL,
    [Smoking_Status_Code_ID]          VARCHAR (30)       NULL,
    [Status_Code_ID]                  VARCHAR (30)       NULL,
    [Status_DateTime]                 DATETIMEOFFSET (7) NULL,
    [Tenant_ID]                       VARCHAR (40)       DEFAULT 'COMMON' NULL,
    [Data_Owner_ID]                   VARCHAR (40)       DEFAULT 'COMMON' NULL,
    [Agency_Reporting_ID]             VARCHAR (40)       NULL,
    [Sequence_Number]                 INT                DEFAULT 0 NULL,
    [Effective_DateTime]              DATETIMEOFFSET (7) DEFAULT getutcdate() NULL,
    [Effective_End_DateTime]          DATETIMEOFFSET (7) NULL,
    [Version_Number]                  VARCHAR (20)       DEFAULT '0' NULL,
    [Created_DateTime]                DATETIMEOFFSET (7) DEFAULT getutcdate() NULL,
    [Updated_DateTime]                DATETIMEOFFSET (7) DEFAULT getutcdate() NULL,
    [Record_Status_Code_ID]           CHAR (1)           DEFAULT 'A' NULL,
    [Session_Updated_ID]              VARCHAR (40)       DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67' NULL,
    CONSTRAINT [tmp_ms_xx_constraint_pk_Person1] PRIMARY KEY CLUSTERED ([Person_ID] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [Entity].[Person])
    BEGIN
        INSERT INTO [Entity].[tmp_ms_xx_Person] ([Person_ID], [Alternate_ID], [Type_ID], [Birth_DateTime], [Birth_Date], [Birth_Date_Text], [Birth_Location_ID], [Birth_Weight], [Name_Type_ID], [Name_Given], [Name_Middle], [Name_Family], [Name_Prefix_Code_ID], [Name_Suffix_Code_ID], [Name_Full], [Sex_Birth_Code_ID], [Sex_Code_ID], [Gender_Identity_Code_ID], [Sexual_Orientation_Code_ID], [Height], [Height_Unit_Code_ID], [Weight], [Weight_Unit_Code_ID], [Ethnicity_Code_ID], [Race_Code_ID], [Language_Primary_ID], [Language_Secondary_ID], [Education_Level_Highest_Code_ID], [Religion_Code_ID], [Marital_Status_Date], [Marital_Status_Code_ID], [Status_Code_ID], [Status_DateTime], [Tenant_ID], [Data_Owner_ID], [Agency_Reporting_ID], [Sequence_Number], [Effective_DateTime], [Effective_End_DateTime], [Version_Number], [Created_DateTime], [Updated_DateTime], [Record_Status_Code_ID], [Session_Updated_ID])
        SELECT   [Person_ID],
                 [Alternate_ID],
                 [Type_ID],
                 [Birth_DateTime],
                 [Birth_Date],
                 [Birth_Date_Text],
                 [Birth_Location_ID],
                 [Birth_Weight],
                 [Name_Type_ID],
                 [Name_Given],
                 [Name_Middle],
                 [Name_Family],
                 [Name_Prefix_Code_ID],
                 [Name_Suffix_Code_ID],
                 [Name_Full],
                 [Sex_Birth_Code_ID],
                 [Sex_Code_ID],
                 [Gender_Identity_Code_ID],
                 [Sexual_Orientation_Code_ID],
                 [Height],
                 [Height_Unit_Code_ID],
                 [Weight],
                 [Weight_Unit_Code_ID],
                 [Ethnicity_Code_ID],
                 [Race_Code_ID],
                 [Language_Primary_ID],
                 [Language_Secondary_ID],
                 [Education_Level_Highest_Code_ID],
                 [Religion_Code_ID],
                 [Marital_Status_Date],
                 [Marital_Status_Code_ID],
                 [Status_Code_ID],
                 [Status_DateTime],
                 [Tenant_ID],
                 [Data_Owner_ID],
                 [Agency_Reporting_ID],
                 [Sequence_Number],
                 [Effective_DateTime],
                 [Effective_End_DateTime],
                 [Version_Number],
                 [Created_DateTime],
                 [Updated_DateTime],
                 [Record_Status_Code_ID],
                 [Session_Updated_ID]
        FROM     [Entity].[Person]
        ORDER BY [Person_ID] ASC;
    END

DROP TABLE [Entity].[Person];

EXECUTE sp_rename N'[Entity].[tmp_ms_xx_Person]', N'Person';

EXECUTE sp_rename N'[Entity].[tmp_ms_xx_constraint_pk_Person1]', N'pk_Person', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating Table [Clinical].[Severity_Code]...';


GO
CREATE TABLE [Clinical].[Severity_Code] (
    [Code_ID]                VARCHAR (30)       NOT NULL,
    [Description]            VARCHAR (128)      NULL,
    [Category_ID]            VARCHAR (30)       NULL,
    [CodeSet_Name]           VARCHAR (80)       NULL,
    [Tenant_ID]              VARCHAR (40)       NULL,
    [Data_Owner_ID]          VARCHAR (40)       NULL,
    [Agency_Reporting_ID]    VARCHAR (40)       NULL,
    [Sequence_Number]        INT                NULL,
    [Effective_DateTime]     DATETIMEOFFSET (7) NULL,
    [Effective_End_DateTime] DATETIMEOFFSET (7) NULL,
    [Version_Number]         VARCHAR (20)       NULL,
    [Created_DateTime]       DATETIMEOFFSET (7) NULL,
    [Updated_DateTime]       DATETIMEOFFSET (7) NULL,
    [Record_Status_Code_ID]  CHAR (1)           NULL,
    [Session_Updated_ID]     VARCHAR (40)       NULL,
    CONSTRAINT [pk_SeverityCode] PRIMARY KEY CLUSTERED ([Code_ID] ASC)
);


GO
PRINT N'Creating Default Constraint unnamed constraint on [Clinical].[Severity_Code]...';


GO
ALTER TABLE [Clinical].[Severity_Code]
    ADD DEFAULT 'COMMON' FOR [Tenant_ID];


GO
PRINT N'Creating Default Constraint unnamed constraint on [Clinical].[Severity_Code]...';


GO
ALTER TABLE [Clinical].[Severity_Code]
    ADD DEFAULT 'COMMON' FOR [Data_Owner_ID];


GO
PRINT N'Creating Default Constraint unnamed constraint on [Clinical].[Severity_Code]...';


GO
ALTER TABLE [Clinical].[Severity_Code]
    ADD DEFAULT 0 FOR [Sequence_Number];


GO
PRINT N'Creating Default Constraint unnamed constraint on [Clinical].[Severity_Code]...';


GO
ALTER TABLE [Clinical].[Severity_Code]
    ADD DEFAULT getutcdate() FOR [Effective_DateTime];


GO
PRINT N'Creating Default Constraint unnamed constraint on [Clinical].[Severity_Code]...';


GO
ALTER TABLE [Clinical].[Severity_Code]
    ADD DEFAULT '0' FOR [Version_Number];


GO
PRINT N'Creating Default Constraint unnamed constraint on [Clinical].[Severity_Code]...';


GO
ALTER TABLE [Clinical].[Severity_Code]
    ADD DEFAULT getutcdate() FOR [Created_DateTime];


GO
PRINT N'Creating Default Constraint unnamed constraint on [Clinical].[Severity_Code]...';


GO
ALTER TABLE [Clinical].[Severity_Code]
    ADD DEFAULT getutcdate() FOR [Updated_DateTime];


GO
PRINT N'Creating Default Constraint unnamed constraint on [Clinical].[Severity_Code]...';


GO
ALTER TABLE [Clinical].[Severity_Code]
    ADD DEFAULT 'A' FOR [Record_Status_Code_ID];


GO
PRINT N'Creating Default Constraint unnamed constraint on [Clinical].[Severity_Code]...';


GO
ALTER TABLE [Clinical].[Severity_Code]
    ADD DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67' FOR [Session_Updated_ID];


GO
PRINT N'Creating Foreign Key [Entity].[fk_Contact_Person]...';


GO
ALTER TABLE [Entity].[Contact] WITH NOCHECK
    ADD CONSTRAINT [fk_Contact_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Person_Death]...';


GO
ALTER TABLE [Entity].[Person_Death] WITH NOCHECK
    ADD CONSTRAINT [fk_Person_Death] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Person_Gender_Identity_Code]...';


GO
ALTER TABLE [Entity].[Person] WITH NOCHECK
    ADD CONSTRAINT [fk_Person_Gender_Identity_Code] FOREIGN KEY ([Gender_Identity_Code_ID]) REFERENCES [Entity].[Gender_Identity_Code] ([Code_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Person_Sexual_Orientation_Code]...';


GO
ALTER TABLE [Entity].[Person] WITH NOCHECK
    ADD CONSTRAINT [fk_Person_Sexual_Orientation_Code] FOREIGN KEY ([Sexual_Orientation_Code_ID]) REFERENCES [Entity].[Sexual_Orientation_Code] ([Code_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Person_Marital_Status_Code]...';


GO
ALTER TABLE [Entity].[Person] WITH NOCHECK
    ADD CONSTRAINT [fk_Person_Marital_Status_Code] FOREIGN KEY ([Marital_Status_Code_ID]) REFERENCES [Entity].[Marital_Status_Code] ([Code_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Person_Religion_Code]...';


GO
ALTER TABLE [Entity].[Person] WITH NOCHECK
    ADD CONSTRAINT [fk_Person_Religion_Code] FOREIGN KEY ([Religion_Code_ID]) REFERENCES [Entity].[Religion_Code] ([Code_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Person_Type]...';


GO
ALTER TABLE [Entity].[Person] WITH NOCHECK
    ADD CONSTRAINT [fk_Person_Type] FOREIGN KEY ([Type_ID]) REFERENCES [Entity].[Person_Type] ([Type_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Person_Name_Type]...';


GO
ALTER TABLE [Entity].[Person] WITH NOCHECK
    ADD CONSTRAINT [fk_Person_Name_Type] FOREIGN KEY ([Name_Type_ID]) REFERENCES [Entity].[Name_Type] ([Type_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Person_Ethnicity_Code]...';


GO
ALTER TABLE [Entity].[Person] WITH NOCHECK
    ADD CONSTRAINT [fk_Person_Ethnicity_Code] FOREIGN KEY ([Ethnicity_Code_ID]) REFERENCES [Entity].[Ethnicity_Code] ([Code_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Person_Race_Code]...';


GO
ALTER TABLE [Entity].[Person] WITH NOCHECK
    ADD CONSTRAINT [fk_Person_Race_Code] FOREIGN KEY ([Race_Code_ID]) REFERENCES [Entity].[Race_Code] ([Code_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Person_Sex_Code]...';


GO
ALTER TABLE [Entity].[Person] WITH NOCHECK
    ADD CONSTRAINT [fk_Person_Sex_Code] FOREIGN KEY ([Sex_Code_ID]) REFERENCES [Entity].[Sex_Code] ([Code_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Person_Flag_Person]...';


GO
ALTER TABLE [Entity].[Person_Flag] WITH NOCHECK
    ADD CONSTRAINT [fk_Person_Flag_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Location_Link_Person]...';


GO
ALTER TABLE [Entity].[Location_Link] WITH NOCHECK
    ADD CONSTRAINT [fk_Location_Link_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Identification_Person]...';


GO
ALTER TABLE [Entity].[Identification] WITH NOCHECK
    ADD CONSTRAINT [fk_Identification_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Communication_Person]...';


GO
ALTER TABLE [Entity].[Communication] WITH NOCHECK
    ADD CONSTRAINT [fk_Communication_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Officer_Person]...';


GO
ALTER TABLE [Entity].[Officer] WITH NOCHECK
    ADD CONSTRAINT [fk_Officer_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Contact_Emergency_Person]...';


GO
ALTER TABLE [Entity].[Contact_Emergency] WITH NOCHECK
    ADD CONSTRAINT [fk_Contact_Emergency_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Employment_Employee]...';


GO
ALTER TABLE [Entity].[Employment] WITH NOCHECK
    ADD CONSTRAINT [fk_Employment_Employee] FOREIGN KEY ([Employee_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Note_Person]...';


GO
ALTER TABLE [Entity].[Note] WITH NOCHECK
    ADD CONSTRAINT [fk_Note_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Media_Person]...';


GO
ALTER TABLE [Entity].[Media] WITH NOCHECK
    ADD CONSTRAINT [fk_Media_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Item_Reference_Link_Person]...';


GO
ALTER TABLE [Entity].[Item_Link] WITH NOCHECK
    ADD CONSTRAINT [fk_Item_Reference_Link_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Uri_Person]...';


GO
ALTER TABLE [Entity].[Uri] WITH NOCHECK
    ADD CONSTRAINT [fk_Uri_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Entity].[fk_Affiliation_Person]...';


GO
ALTER TABLE [Entity].[Affiliation] WITH NOCHECK
    ADD CONSTRAINT [fk_Affiliation_Person] FOREIGN KEY ([Person_ID]) REFERENCES [Entity].[Person] ([Person_ID]);


GO
PRINT N'Creating Foreign Key [Clinical].[fk_Condition_SeverityCode]...';


GO
ALTER TABLE [Clinical].[Condition] WITH NOCHECK
    ADD CONSTRAINT [fk_Condition_SeverityCode] FOREIGN KEY ([Severity_Code_ID]) REFERENCES [Clinical].[Severity_Code] ([Code_ID]);


GO
PRINT N'Creating Extended Property [Entity].[Person].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A description and definition of a person, its main identification, demographics and other details', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Birth_DateTime].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Birth_DateTime';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Birth_Date].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Birth_Date';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Birth_Date_Text].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Birth_Date_Text';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Birth_Location_ID].[X_Reference]...';


GO
EXECUTE sp_addextendedproperty @name = N'X_Reference', @value = 'Birth Location ID is a reference to a location detailed elsewhere', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Birth_Location_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Birth_Weight].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Birth weight (in grams)', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Birth_Weight';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Name_Type_ID].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A name type', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Name_Type_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Name_Given].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Name_Given';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Name_Given].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A given name', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Name_Given';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Name_Middle].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Name_Middle';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Name_Middle].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A middle name', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Name_Middle';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Name_Family].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'HIPAA, PHI, GDPR, PII, NIST_PII', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Name_Family';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Name_Family].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A family name', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Name_Family';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Name_Prefix_Code_ID].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A name prefix', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Name_Prefix_Code_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Name_Suffix_Code_ID].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A name suffix', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Name_Suffix_Code_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Name_Full].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Name_Full';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Name_Full].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A person or entity full name', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Name_Full';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Sex_Birth_Code_ID].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'PHI, GDPR', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Sex_Birth_Code_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Sex_Birth_Code_ID].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Sex at Birth: Male, Female, Other, Unknown', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Sex_Birth_Code_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Sex_Code_ID].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'PHI, GDPR', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Sex_Code_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Sex_Code_ID].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Current Sex Code: Male, Female, Other, Unknown', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Sex_Code_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Gender_Identity_Code_ID].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'PHI, GDPR', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Gender_Identity_Code_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Gender_Identity_Code_ID].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The person identifies the Identity as', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Gender_Identity_Code_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Sexual_Orientation_Code_ID].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'PHI, GDPR', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Sexual_Orientation_Code_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Ethnicity_Code_ID].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'NIST-PII', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Ethnicity_Code_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Race_Code_ID].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'HIPAA, PII, GDPR', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Race_Code_ID';


GO
PRINT N'Creating Extended Property [Entity].[Person].[Education_Level_Highest_Code_ID].[PRIVACY]...';


GO
EXECUTE sp_addextendedproperty @name = N'PRIVACY', @value = 'NIST-PII', @level0type = N'SCHEMA', @level0name = N'Entity', @level1type = N'TABLE', @level1name = N'Person', @level2type = N'COLUMN', @level2name = N'Education_Level_Highest_Code_ID';


GO
PRINT N'Creating Extended Property [Clinical].[Severity_Code].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'If treatment was stopped due to adverse event from TB treatment indicates the severity.', @level0type = N'SCHEMA', @level0name = N'Clinical', @level1type = N'TABLE', @level1name = N'Severity_Code';


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [Entity].[Contact] WITH CHECK CHECK CONSTRAINT [fk_Contact_Person];

ALTER TABLE [Entity].[Person_Death] WITH CHECK CHECK CONSTRAINT [fk_Person_Death];

ALTER TABLE [Entity].[Person] WITH CHECK CHECK CONSTRAINT [fk_Person_Gender_Identity_Code];

ALTER TABLE [Entity].[Person] WITH CHECK CHECK CONSTRAINT [fk_Person_Sexual_Orientation_Code];

ALTER TABLE [Entity].[Person] WITH CHECK CHECK CONSTRAINT [fk_Person_Marital_Status_Code];

ALTER TABLE [Entity].[Person] WITH CHECK CHECK CONSTRAINT [fk_Person_Religion_Code];

ALTER TABLE [Entity].[Person] WITH CHECK CHECK CONSTRAINT [fk_Person_Type];

ALTER TABLE [Entity].[Person] WITH CHECK CHECK CONSTRAINT [fk_Person_Name_Type];

ALTER TABLE [Entity].[Person] WITH CHECK CHECK CONSTRAINT [fk_Person_Ethnicity_Code];

ALTER TABLE [Entity].[Person] WITH CHECK CHECK CONSTRAINT [fk_Person_Race_Code];

ALTER TABLE [Entity].[Person] WITH CHECK CHECK CONSTRAINT [fk_Person_Sex_Code];

ALTER TABLE [Entity].[Person_Flag] WITH CHECK CHECK CONSTRAINT [fk_Person_Flag_Person];

ALTER TABLE [Entity].[Location_Link] WITH CHECK CHECK CONSTRAINT [fk_Location_Link_Person];

ALTER TABLE [Entity].[Identification] WITH CHECK CHECK CONSTRAINT [fk_Identification_Person];

ALTER TABLE [Entity].[Communication] WITH CHECK CHECK CONSTRAINT [fk_Communication_Person];

ALTER TABLE [Entity].[Officer] WITH CHECK CHECK CONSTRAINT [fk_Officer_Person];

ALTER TABLE [Entity].[Contact_Emergency] WITH CHECK CHECK CONSTRAINT [fk_Contact_Emergency_Person];

ALTER TABLE [Entity].[Employment] WITH CHECK CHECK CONSTRAINT [fk_Employment_Employee];

ALTER TABLE [Entity].[Note] WITH CHECK CHECK CONSTRAINT [fk_Note_Person];

ALTER TABLE [Entity].[Media] WITH CHECK CHECK CONSTRAINT [fk_Media_Person];

ALTER TABLE [Entity].[Item_Link] WITH CHECK CHECK CONSTRAINT [fk_Item_Reference_Link_Person];

ALTER TABLE [Entity].[Uri] WITH CHECK CHECK CONSTRAINT [fk_Uri_Person];

ALTER TABLE [Entity].[Affiliation] WITH CHECK CHECK CONSTRAINT [fk_Affiliation_Person];

ALTER TABLE [Clinical].[Condition] WITH CHECK CHECK CONSTRAINT [fk_Condition_SeverityCode];


GO
PRINT N'Update complete.';


GO
