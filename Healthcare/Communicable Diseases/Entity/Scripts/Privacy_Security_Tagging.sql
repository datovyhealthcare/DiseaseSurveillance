
-- DEFINE PRIVACY TAGS INCLUDING:
--    HIPAA    - Health Insurance Portability and Accountability Act
--    GDPR     - General Data Protection Regulation
--    PII      - Person Identifiable Information
--    NIST_PII - Person Identifiable Information

-- Person Name Components
EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Name_Given';
GO

EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Name_Middle';
GO

EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST_PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Name_Family';
GO

EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Name_Full';
GO

-- Gender/Sex Details
EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'PHI, GDPR', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Sex_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'PHI, GDPR', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Gender_Identity_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'PHI, GDPR', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Sexual_Orientation_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'PHI, GDPR', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Sex_Birth_Code_ID';
GO

-- Person Dates
EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Birth_DateTime';
GO

EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Birth_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'HIPAA, PHI, GDPR, PII, NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Birth_Date_Text';
GO

-- Person Race - Ethnicity
EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Ethnicity_Code_ID';
GO

EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Communication', 
   @level2type = N'COLUMN', @level2name = 'Phone_Number';
GO

-- Phone Numbers (see/use Communication Type table Tags column)
EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'HIPAA, PII, GDPR', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Race_Code_ID';
GO

-- Person Death
EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'HIPAA', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person_Death', 
   @level2type = N'COLUMN', @level2name = 'Death_Date';
GO

EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'HIPAA', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person_Death', 
   @level2type = N'COLUMN', @level2name = 'Death_DateTime';
GO

EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'HIPAA', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person_Death', 
   @level2type = N'COLUMN', @level2name = 'Death_Date_Text';
GO

-- Person Education Information
EXECUTE sp_addextendedproperty
   @name = N'Privacy', 
   @value = 'NIST-PII', 
   @level0type = N'SCHEMA', @level0name = N'Entity', 
   @level1type = N'TABLE',  @level1name = N'Person', 
   @level2type = N'COLUMN', @level2name = 'Education_Level_Highest_Code_ID';
GO

