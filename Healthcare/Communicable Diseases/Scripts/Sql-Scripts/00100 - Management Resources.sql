
-- Detection Method v2
INSERT INTO [Management].[Detection_Method_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('C0004398','Autopsy','UMLS'),
   ('C4084924','Clinical evaluation','UMLS'),
   ('PHC2262','Contact tracing','PHIN VS (CDC Local Coding System)'),
   ('PHC2264','EpiX notification of traveler','PHIN VS (CDC Local Coding System)'),
   ('PHC2112','Laboratory reported','PHIN VS (CDC Local Coding System)'),
   ('OTH','other','NullFlavor'),
   ('PHC241','Provider reported','PHIN VS (CDC Local Coding System)'),
   ('PHC243','Routine physical examination','PHIN VS (CDC Local Coding System)'),
   ('PHC2263','Routine surveillance','PHIN VS (CDC Local Coding System)'),
   ('UNK','unknown','NullFlavor'),
   ('PHC311','Prenatal screening','PHIN VS (CDC Local Coding System)'),
   ('PHC242','Prison entry screening','PHIN VS (CDC Local Coding System)'),
   ('306098008','Self-referral (procedure)','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Management].[Detection_Method_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- Probable Reason Code v1
INSERT INTO [Management].[Probable_Reason_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('PHC2259','Meets clinical criteria AND epidemiologic evidence with no confirmatory  lab testing performed','PHIN VS (CDC Local Coding System)'),
   ('PHC2260','Meets presumptive lab evidence AND either clinical criteria OR epidemiologic  evidence','PHIN VS (CDC Local Coding System)'),
   ('PHC2261','Meets vital records criteria with no confirmatory lab testing','PHIN VS (CDC Local Coding System)')
GO

-- update this so we know where the code came from...
UPDATE [Management].[Probable_Reason_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- PHVS Case Class Status NND - CDC - v1
INSERT INTO [Management].[Class_Status_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('410605003', 'Confirmed present (qualifier value)', 'SNOMED-CT'),
   ('PHC178',    'Not a Case', 'PHIN VS (CDC Local Coding System)'),
   ('2931005',   'Probable diagnosis (contextual qualifier) (qualifier value)', 'SNOMED-CT'),
   ('415684004', 'Suspected (qualifier value)', 'SNOMED-CT'),
   ('UNK', 'unknown', 'NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Management].[Class_Status_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- PHVS Case Class Status NND - CDC - v2
INSERT INTO [Management].[Unit_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('d', 'day', 'PH_UnitsOfMeasure_UCUM'),
   ('h', 'hour', 'PH_UnitsOfMeasure_UCUM'),
   ('min', 'minute', 'PH_UnitsOfMeasure_UCUM'),
   ('mo', 'month', 'PH_UnitsOfMeasure_UCUM'),
   ('OTH', 'other', 'PH_NullFlavor_HL7_V3'),
   ('s', 'second', 'PH_UnitsOfMeasure_UCUM'),
   ('UNK', 'unknown', 'PH_NullFlavor_HL7_V3'),
   ('wk', 'week', 'PH_UnitsOfMeasure_UCUM'),
   ('a', 'year', 'PH_UnitsOfMeasure_UCUM')
GO

-- update this so we know where the code came from...
UPDATE [Management].[Unit_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

