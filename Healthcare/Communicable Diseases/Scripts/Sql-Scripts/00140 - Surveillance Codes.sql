
-- Transmission Setting v3
INSERT INTO [Surveillance].[Transmission_Setting_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('C1510656','Athletics','UMLS'),
   ('224864007','College (environment)','SNOMED-CT'),
   ('133928008','Community (social concept)','SNOMED-CT'),
   ('1348009','Day care center (environment)','SNOMED-CT'),
   ('ER','Emergency room','RoleCode'),
   ('264362003','Home (environment)','SNOMED-CT'),
   ('C0029916','Hospital Outpatient Clinic','UMLS'),
   ('PHC179','International Travel','PHIN VS (CDC Local Coding System)'),
   ('PHC64','Military (Environment)','PHIN VS (CDC Local Coding System)'),
   ('OTH','other','NullFlavor'),
   ('257656006','Penal institution (environment)','SNOMED-CT'),
   ('257659004','Place of worship (environment)','SNOMED-CT'),
   ('257698009','School (environment)','SNOMED-CT'),
   ('83891005','Solo practice private office (environment)','SNOMED-CT'),
   ('UNK','unknown','NullFlavor'),
   ('225746001','Ward (environment)','SNOMED-CT'),
   ('285141008','Work environment (environment)','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Transmission_Setting_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v3'
GO

-- Detection Method v2
INSERT INTO [Surveillance].[Detection_Method_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
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
UPDATE [Surveillance].[Detection_Method_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- PHVS Investigation Status - v32
INSERT INTO [Surveillance].[Case_Investigation_Status_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('9571008','Approved (qualifier value)','SNOMED-CT'),
   ('29179001','Closed (qualifier value)','SNOMED-CT'),
   ('CA','Deleted','Document availability status (HL7)'),
   ('385651009','In progress (qualifier value)','SNOMED-CT'),
   ('C0422202','Notified','UMLS'),
   ('OTH','other','NullFlavor'),
   ('PHC226','Ready for Review','PHIN VS (CDC Local Coding System)'),
   ('C1548437','Rejected','UMLS'),
   ('C1709940','Reviewed','UMLS'),
   ('385655000','Suspended (qualifier value)','SNOMED-CT'),
   ('UNK','unknown','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Case_Investigation_Status_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v3'
GO

-- PHVS Reporting Criteria - v2
INSERT INTO [Surveillance].[Case_Classification_Exposure_Source_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('PHC464','endemic case','PHIN VS (CDC Local Coding System)'),
   ('PHC466','imported-virus case','PHIN VS (CDC Local Coding System)'),
   ('PHC465','import-linked case','PHIN VS (CDC Local Coding System)'),
   ('OTH','other','NullFlavor'),
   ('UNK','unknown','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Case_Classification_Exposure_Source_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- PHVS Reporting Criteria - v2
INSERT INTO [Surveillance].[Reporting_Criterial_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('PHC1140','Exposure to suspected product from Canada or Mexico','PHIN VS (CDC Local Coding System)'),
   ('PHC1139','Has case contacts in or from Mexico or Canada','PHIN VS (CDC Local Coding System)'),
   ('PHC1141','Other situations that may require binational notification or coordination  of response','PHIN VS (CDC Local Coding System)'),
   ('PHC1215','Potentially exposed by a resident of Mexico or Canada','PHIN VS (CDC Local Coding System)'),
   ('PHC1137','Potentially exposed while in Mexico or Canada','PHIN VS (CDC Local Coding System)'),
   ('PHC1138','Resident of Canada or Mexico','PHIN VS (CDC Local Coding System)')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Reporting_Criterial_Code]
   SET Data_Owner_ID = 'CDC',
       Category_ID = 'Binational',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- PHVS Reporting Source Type v2
INSERT INTO [Surveillance].[Reporting_Source_Type] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('331L00000X','Blood Bank','Healthcare Provider Taxonomy (HIPAA)'),
   ('C0442681','Correctional Institutions','UMLS'),
   ('1348009','Day care center (environment)','SNOMED-CT'),
   ('122300000X','Dentist','Healthcare Provider Taxonomy (HIPAA)'),
   ('PHC256','Drug treatment facility','PHIN VS (CDC Local Coding System)'),
   ('ER','Emergency room','RoleCode'),
   ('PHC257','Family planning facility','PHIN VS (CDC Local Coding System)'),
   ('C1608220','federal agency','UMLS'),
   ('PHC1222','HIV Care Facility','PHIN VS (CDC Local Coding System)'),
   ('PHC1220','HIV Counseling and Testing Site','PHIN VS (CDC Local Coding System)'),
   ('1','Hospital','Organization Unit Type (HL7)'),
   ('PHC1225','Labor and Delivery','PHIN VS (CDC Local Coding System)'),
   ('PHC247','Laboratory','PHIN VS (CDC Local Coding System)'),
   ('PHC248','Managed Care and or health maintainence organization','PHIN VS (CDC Local Coding System)'),
   ('PHC1226','Mental Health Provider','PHIN VS (CDC Local Coding System)'),
   ('PHC249','Military (Organization)','PHIN VS (CDC Local Coding System)'),
   ('PHC1223','National Job Training Program','PHIN VS (CDC Local Coding System)'),
   ('OTH','other','NullFlavor'),
   ('PHC1224','Other Health Department Clinic','PHIN VS (CDC Local Coding System)'),
   ('PHC252','Other state and or local agencies','PHIN VS (CDC Local Coding System)'),
   ('PHC250','Other treatment center','PHIN VS (CDC Local Coding System)'),
   ('333600000X','Pharmacy','Healthcare Provider Taxonomy (HIPAA)'),
   ('PHC259','Prenatal and or obstetrics Facility','PHIN VS (CDC Local Coding System)'),
   ('39350007','Private physicians'' group office (environment)','SNOMED-CT'),
   ('PHC251','Public health clinic','PHIN VS (CDC Local Coding System)'),
   ('C0034975','Registries','UMLS'),
   ('261QR1300X','Rural Health','Healthcare Provider Taxonomy (HIPAA)'),
   ('PHC1219','STD Clinic','PHIN VS (CDC Local Coding System)'),
   ('261QS1000X','Student Health','Healthcare Provider Taxonomy (HIPAA)'),
   ('PHC1221','TB Clinic','PHIN VS (CDC Local Coding System)'),
   ('PHC253','Tribal government','PHIN VS (CDC Local Coding System)'),
   ('C0085141','United States Indian Health Service','UMLS'),
   ('UNK','unknown','NullFlavor'),
   ('PHC254','Veterinary source','PHIN VS (CDC Local Coding System)'),
   ('C0042836','Vital Statistics','UMLS')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Reporting_Source_Type]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- PHVS Result Status - v1
INSERT INTO [Surveillance].[Result_Status_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('F','Final results; Can only be changed with a corrected result.','Observation result status (HL7)'),
   ('C','Record coming over is a correction and thus replaces a final result','Observation result status (HL7)'),
   ('X','Results cannot be obtained for this observation','Observation result status (HL7)')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Result_Status_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- PHVS Case Class Status NND - CDC - v1
INSERT INTO [Surveillance].[Class_Status_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('410605003', 'Confirmed present (qualifier value)', 'SNOMED-CT'),
   ('PHC178',    'Not a Case', 'PHIN VS (CDC Local Coding System)'),
   ('2931005',   'Probable diagnosis (contextual qualifier) (qualifier value)', 'SNOMED-CT'),
   ('415684004', 'Suspected (qualifier value)', 'SNOMED-CT'),
   ('UNK', 'unknown', 'NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Class_Status_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- Generic / Tuberculosis and Latent Tuberculosis Infection v2
INSERT INTO [Surveillance].[Case_Transmission_Mode_Code] ([Code_ID], [Description], [CodeSet_Name], [Category_ID]) VALUES
   ('416380006',	 'Airborne transmission',	                'SNOMED-CT', 'TB and LTB1'),
   ('409700000',	 'Animal to human transmission',	          'SNOMED-CT', 'TB and LTB1'),
   ('420014008',   'Blood borne transmission',	             'SNOMED-CT', 'TB and LTB1'),
   ('461551000124100', 'Droplet transmission',                    'SNOMED-CT', 'TB and LTB1'),
   ('416086007',	     'Food-borne transmission',                 'SNOMED-CT', 'TB and LTB1'),
   ('418375005',	     'Indeterminate disease transmission mode', 'SNOMED-CT', 'TB and LTB1'),
   ('PHC142',	    'Mechanical',	                            'PHIN VS (CDC Local Coding System)', 'TB and LTB1'),
   ('416085006',	 'Nosocomial transmission',	             'SNOMED-CT', 'TB and LTB1'),
   ('OTH',	       'Other',	                               'NullFlavor','TB and LTB1'), 
   ('417564009',	 'Sexual transmission',	                   'SNOMED-CT', 'TB and LTB1'),
   ('420193003',	 'Transdermal transmission',	             'SNOMED-CT', 'TB and LTB1'),
   ('417409004',	 'Transplacental transmission',            'SNOMED-CT', 'TB and LTB1'),
   ('418427004',	 'Vector-borne transmission',	             'SNOMED-CT', 'TB and LTB1'),
   ('418117003',	 'Water-borne transmission',	             'SNOMED-CT', 'TB and LTB1')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Case_Transmission_Mode_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- PHVS Disease Acquired Jurisdiction - CDC - v3
INSERT INTO [Surveillance].[Jurisdiction_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('PHC244','Indigenous, within jurisdiction','PHIN VS (CDC Local Coding System)'),
   ('C1512888','International','UMLS'),
   ('PHC245','Out of jurisdiction, from another jurisdiction within state','PHIN VS (CDC Local Coding System)'),
   ('PHC246','Out of state','PHIN VS (CDC Local Coding System)'),
   ('UNK','unknown','NullFlavor'),
   ('PHC1274','Yes imported, but not able to determine source state and/or country','PHIN VS (CDC Local Coding System)')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Jurisdiction_Code]
   SET [Category_ID] = '',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v3'
GO

-- Duration / Unit Code - CDC - v2
INSERT INTO [Surveillance].[Unit_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
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
UPDATE [Surveillance].[Unit_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- Sexual Preference v1
INSERT INTO [Surveillance].[Sexual_Preference_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('43018001','Babysitter (occupation)','SNOMED-CT'),
   ('PHC299','Child cared for by this patient','PHIN VS (CDC Local Coding System)'),
   ('PHC300','Household member non-sexual','PHIN VS (CDC Local Coding System)'),
   ('PHC1304','Other Contact Type','PHIN VS (CDC Local Coding System)'),
   ('PHC301','Playmate','PHIN VS (CDC Local Coding System)'),
   ('225517006','Sexual partners (observable entity)','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Sexual_Preference_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- Contact Type v2
INSERT INTO [Surveillance].[Contact_Type] ([Type_ID], [Description], [CodeSet_Name]) VALUES
   ('43018001','Babysitter (occupation)','SNOMED-CT'),
   ('PHC299','Child cared for by this patient','PHIN VS (CDC Local Coding System)'),
   ('PHC300','Household member non-sexual','PHIN VS (CDC Local Coding System)'),
   ('PHC1304','Other Contact Type','PHIN VS (CDC Local Coding System)'),
   ('PHC301','Playmate','PHIN VS (CDC Local Coding System)'),
   ('225517006','Sexual partners (observable entity)','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Contact_Type]
   SET Data_Owner_ID = 'CDC',
       Category_ID = 'Hepatitis',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- Exposure Setting v2
INSERT INTO [Surveillance].[Exposure_Setting_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('257562009','Airport (environment)','SNOMED-CT'),
   ('PHC2266','Animal with confirmed or suspected disease','PHIN VS (CDC Local Coding System)'),
   ('413817003','Child day care center (environment)','SNOMED-CT'),
   ('C3826521','Congregate housing','UMLS'),
   ('PHC2267','Contact with known case','PHIN VS (CDC Local Coding System)'),
   ('C1880391','Domestic','UMLS'),
   ('C1512888','International','UMLS'),
   ('C3841750','Mass gathering','UMLS'),
   ('OTH','other','NullFlavor'),
   ('257656006','Penal institution (environment)','SNOMED-CT'),
   ('473085002','Recent cruise travel (event)','SNOMED-CT'),
   ('257698009','School (environment)','SNOMED-CT'),
   ('UNK','unknown','NullFlavor'),
   ('285141008','Work environment (environment)','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Travel_Purpose_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- Travel Purpose v2
INSERT INTO [Surveillance].[Travel_Purpose_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('702348006','Active duty military (occupation)','SNOMED-CT'),
   ('PHC386','Business','PHIN VS (CDC Local Coding System)'),
   ('C0013976','Emigration and Immigration','UMLS'),
   ('OTH','other','NullFlavor'),
   ('440593000','Response of community to disaster (observable entity)','SNOMED-CT'),
   ('C0683587','tourism','UMLS'),
   ('UNK','unknown','NullFlavor'),
   ('PHC387','Visiting relatives and or friends','PHIN VS (CDC Local Coding System)')
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Travel_Purpose_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- NNDSS Event Code
INSERT INTO [Surveillance].[Event_Code] ([Code_ID], [Description], [CodeSet_Name], [Category_ID], [Notifiable_Indicator]) VALUES
   ('50225','Acanthamoeba disease (excluding keratitis)','NNDSS Event Codes','Parasitic Diseases',0),
   ('11120','Acute flaccid myelitis','NNDSS Event Codes','Neurological',0),
   ('11090','Anaplasma phagocytophilum','NNDSS Event Codes','Vectorborne Diseases',1),
   ('10350','Anthrax','NNDSS Event Codes','Zoonotic',1),
   ('12010','Babesiosis','NNDSS Event Codes','Zoonotic',1),
   ('50226','Balamuthia mandrillaris disease','NNDSS Event Codes','Parasitic Diseases',0),
   ('11910','Blastomycosis','NNDSS Event Codes','Fungal disease',0),
   ('10530','Botulism, foodborne','NNDSS Event Codes','Botulism',1),
   ('10540','Botulism, infant','NNDSS Event Codes','Botulism',1),
   ('10550','Botulism, other (includes wound)','NNDSS Event Codes','Botulism',1),
   ('10548','Botulism, other unspecified','NNDSS Event Codes','Botulism',1),
   ('10549','Botulism, wound','NNDSS Event Codes','Botulism',1),
   ('10020','Brucellosis','NNDSS Event Codes','Zoonotic',1),
   ('10058','Cache Valley virus disease, neuroinvasive','NNDSS Event Codes','Arboviral Diseases',0),
   ('10066','Cache Valley virus disease, non-neuroinvasive','NNDSS Event Codes','Arboviral Diseases',0),
   ('11718','California encephalitis virus disease','NNDSS Event Codes','Arboviral Diseases',1),
   ('10054','California serogroup virus diseases, neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10061','California serogroup virus diseases, non-neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('11020','Campylobacteriosis','NNDSS Event Codes','Enteric Diseases',1),
   ('50263','Candida auris, clinical','NNDSS Event Codes','Fungal disease',1),
   ('50264','Candida auris, colonization/screening','NNDSS Event Codes','Fungal disease',0),
   ('50244','Carbapenemase-producing carbapenem-resistant Enterobacteriaceae (CP-CRE)','NNDSS Event Codes','Carbapenem Resistant Infections',1),
   ('32016','Carbon monoxide poisoning','NNDSS Event Codes','Toxic exposure',1),
   ('10273','Chancroid','NNDSS Event Codes','Sexually Transmitted Diseases',1),
   ('11649','Chapare hemorrhagic fever','NNDSS Event Codes','Hemorrhagic fevers',1),
   ('10073','Chikungunya virus diseases','NNDSS Event Codes','Arboviral Diseases',1),
   ('10274','Chlamydia trachomatis infection','NNDSS Event Codes','Sexually Transmitted Diseases',1),
   ('10470','Cholera (toxigenic Vibrio cholerae O1 or O139)','NNDSS Event Codes','Enteric Diseases',1),
   ('11900','Coccidioidomycosis','NNDSS Event Codes','Coccidioidomycosis',1),
   ('10093','Colorado tick fever virus disease','NNDSS Event Codes','Arboviral Diseases',0),
   ('11065','Coronavirus Disease 2019 (COVID-19)','NNDSS Event Codes','Coronavirus',1),
   ('11640','Crimean-Congo hemorrhagic fever','NNDSS Event Codes','Hemorrhagic fevers',1),
   ('11580','Cryptosporidiosis','NNDSS Event Codes','Enteric Diseases',1),
   ('11575','Cyclosporiasis','NNDSS Event Codes','Enteric Diseases',1),
   ('10680','Dengue','NNDSS Event Codes','Arboviral Diseases',1),
   ('11705','Dengue, severe','NNDSS Event Codes','Arboviral Diseases',1),
   ('11704','Dengue-like illness','NNDSS Event Codes','Arboviral Diseases',1),
   ('10040','Diphtheria','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('10053','Eastern equine encephalitis virus disease, neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10062','Eastern equine encephalitis virus disease, non-neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('11630','Ebola hemorrhagic fever','NNDSS Event Codes','Hemorrhagic fevers',1),
   ('11088','Ehrlichia chaffeensis','NNDSS Event Codes','Vectorborne Diseases',1),
   ('11089','Ehrlichia ewingii','NNDSS Event Codes','Vectorborne Diseases',1),
   ('11091','Ehrlichiosis/Anaplasmosis, undetermined','NNDSS Event Codes','Vectorborne Diseases',1),
   ('11566','Enterotoxigenic E.coli (ETEC) ','NNDSS Event Codes','Enteric Diseases',0),
   ('50237','Flavivirus disease, not otherwise specified','NNDSS Event Codes','Arboviral Diseases',0),
   ('11570','Giardiasis','NNDSS Event Codes','Enteric Diseases',1),
   ('10280','Gonorrhea','NNDSS Event Codes','Sexually Transmitted Diseases',1),
   ('11648','Guanarito hemorrhagic fever','NNDSS Event Codes','Hemorrhagic fevers',1),
   ('10590','Haemophilus influenzae, invasive disease','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('10380','Hansen''s disease (Leprosy)','NNDSS Event Codes','Hansen disease (Leprosy)',1),
   ('11610','Hantavirus infection, non-Hantavirus Pulmonary Syndrome','NNDSS Event Codes','Zoonotic',1),
   ('11590','Hantavirus pulmonary syndrome','NNDSS Event Codes','Zoonotic',1),
   ('11550','Hemolytic uremic syndrome postdiarrheal','NNDSS Event Codes','Enteric Diseases',1),
   ('10110','Hepatitis A, acute','NNDSS Event Codes','Hepatitis',1),
   ('10105','Hepatitis B virus infection, chronic','NNDSS Event Codes','Hepatitis',1),
   ('10100','Hepatitis B, acute','NNDSS Event Codes','Hepatitis',1),
   ('10104','Hepatitis B, perinatal infection','NNDSS Event Codes','Hepatitis',1),
   ('10101','Hepatitis C, acute','NNDSS Event Codes','Hepatitis',1),
   ('10106','Hepatitis C, Chronic','NNDSS Event Codes','Hepatitis',1),
   ('50248','Hepatitis C, perinatal infection','NNDSS Event Codes','Hepatitis',1),
   ('10103','Hepatitis E, acute','NNDSS Event Codes','Hepatitis',0),
   ('11915','Histoplasmosis','NNDSS Event Codes','Fungal disease',0),
   ('11061','Influenza-associated pediatric mortality','NNDSS Event Codes','Influenza',1),
   ('11723','Invasive pneumococcal disease','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('10078','Jamestown Canyon virus disease, neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10079','Jamestown Canyon virus disease, non-neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10059','Japanese encephalitis virus disease, neuroinvasive','NNDSS Event Codes','Arboviral Diseases',0),
   ('10068','Japanese encephalitis virus disease, non-neuroinvasive','NNDSS Event Codes','Arboviral Diseases',0),
   ('11638','Junín hemorrhagic fever','NNDSS Event Codes','Hemorrhagic fevers',1),
   ('11712','Keystone virus disease','NNDSS Event Codes','Arboviral Diseases',1),
   ('10081','La Crosse virus disease, neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10082','La Crosse virus disease, non-neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('11632','Lassa fever','NNDSS Event Codes','Hemorrhagic fevers',1),
   ('10490','Legionellosis','NNDSS Event Codes','Legionellosis',1),
   ('10390','Leptospirosis','NNDSS Event Codes','Zoonotic',1),
   ('10640','Listeriosis','NNDSS Event Codes','Enteric Diseases',1),
   ('11644','Lujo virus','NNDSS Event Codes','Hemorrhagic fevers',1),
   ('11080','Lyme disease','NNDSS Event Codes','Vectorborne Diseases',1),
   ('11637','Machupo hemorrhagic fever','NNDSS Event Codes','Hemorrhagic fevers',1),
   ('10130','Malaria','NNDSS Event Codes','Vectorborne Diseases',1),
   ('11631','Marburg fever','NNDSS Event Codes','Hemorrhagic fevers',1),
   ('10140','Measles (rubeola)','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('10150','Meningococcal disease  (Neisseria meningitidis)','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('11066','Multisystem Inflammatory Syndrome (MIS) associated with Coronavirus Disease 2019 (COVID-19)','NNDSS Event Codes','Coronavirus',0),
   ('10180','Mumps','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('50227','Naegleria fowleri causing Primary Amebic Meningoencephalitis','NNDSS Event Codes','Parasitic Diseases',0),
   ('50261','Neonatal sepsis','NNDSS Event Codes','Condition in EIP ABCs',0),
   ('11062','Novel influenza A virus infections, initial detections of','NNDSS Event Codes','Influenza',1),
   ('10072','Other Arboviral diseases, not otherwise specified','NNDSS Event Codes','Arboviral Diseases',0),
   ('10190','Pertussis','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('10440','Plague','NNDSS Event Codes','Zoonotic',1),
   ('10410','Poliomyelitis, paralytic','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('10405','Poliovirus infection, nonparalytic ','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('10057','Powassan virus disease, neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10063','Powassan virus disease, non-neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10450','Psittacosis (Ornithosis)','NNDSS Event Codes','Zoonotic',1),
   ('10257','Q fever, acute','NNDSS Event Codes','Zoonotic',1),
   ('10258','Q fever, chronic','NNDSS Event Codes','Zoonotic',1),
   ('10340','Rabies, animal','NNDSS Event Codes','Zoonotic',1),
   ('10460','Rabies, human','NNDSS Event Codes','Zoonotic',1),
   ('11646','Respiratory Syncytial Virus-Associated Deaths','NNDSS Event Codes','RSV-associated death',0),
   ('10200','Rubella','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('10370','Rubella, congenital syndrome','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('11639','Sabia-associated hemorrhagic fever','NNDSS Event Codes','Hemorrhagic fevers',1),
   ('50266','Salmonella enterica serotypes Paratyphi A, B (tartrate negative) and C (S. Paratyphi) infection','NNDSS Event Codes','Enteric Diseases',1),
   ('50267','Salmonella enterica Typhi (S.Typhi) infection','NNDSS Event Codes','Enteric Diseases',1),
   ('50265','Salmonellosis (excluding S. Typhi infection and S. Paratyphi infection)','NNDSS Event Codes','Enteric Diseases',1),
   ('10575','Severe Acute Respiratory Syndrome (SARS)-associated Coronavirus disease (SARS-CoV)','NNDSS Event Codes','Coronavirus',1),
   ('11563','Shiga toxin-producing Escherichia coli (STEC)','NNDSS Event Codes','Enteric Diseases',1),
   ('11010','Shigellosis','NNDSS Event Codes','Enteric Diseases',1),
   ('11800','Smallpox','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('11734','Snowshoe hare virus disease','NNDSS Event Codes','Arboviral Diseases',1),
   ('10250','Spotted Fever Rickettsiosis','NNDSS Event Codes','Vectorborne Diseases',1),
   ('10051','St. Louis encephalitis virus disease, neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10064','St. Louis encephalitis virus disease, non-neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('11710','Streptococcal disease, invasive, group A (Streptococcus pyogenes)','NNDSS Event Codes','Condition in EIP ABCs',0),
   ('11715','Streptococcal disease, invasive, group B (Streptococcus agalactiae)','NNDSS Event Codes','Condition in EIP ABCs',0),
   ('11700','Streptococcal toxic shock syndrome','NNDSS Event Codes','Streptococcal toxic shock syndrome',1),
   ('10316','Syphilis, congenital','NNDSS Event Codes','Sexually Transmitted Diseases',1),
   ('10313','Syphilis, early non-primary, non-secondary','NNDSS Event Codes','Sexually Transmitted Diseases',1),
   ('10311','Syphilis, primary','NNDSS Event Codes','Sexually Transmitted Diseases',1),
   ('10312','Syphilis, secondary','NNDSS Event Codes','Sexually Transmitted Diseases',1),
   ('10310','Syphilis, total primary and secondary','NNDSS Event Codes','Sexually Transmitted Diseases',1),
   ('10320','Syphilis, unknown duration or late','NNDSS Event Codes','Sexually Transmitted Diseases',1),
   ('10210','Tetanus','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('10074','Tick-borne Encephalitis viruses','NNDSS Event Codes','Arboviral Diseases',0),
   ('10520','Toxic-shock syndrome (other than streptococcal)','NNDSS Event Codes','Toxic-shock syndrome (other than streptococcal)',1),
   ('10270','Trichinellosis','NNDSS Event Codes','Zoonotic',1),
   ('11724','Trivittatus virus disease','NNDSS Event Codes','Arboviral Diseases',1),
   ('10220','Tuberculosis','NNDSS Event Codes','Tuberculosis',1),
   ('11663','Vancomycin-intermediate Staphylococcus aureus (VISA)','NNDSS Event Codes','Vancomycin-intermediate Staphylococcus aureus (VISA)',1),
   ('11665','Vancomycin-resistant Staphylococcus aureus (VRSA)','NNDSS Event Codes','Vancomycin-resistant Staphylococcus aureus (VRSA)',1),
   ('10030','Varicella (Chickenpox)','NNDSS Event Codes','Vaccine Preventable Diseases',1),
   ('10055','Venezuelan equine encephalitis virus neuroinvasive disease','NNDSS Event Codes','Arboviral Diseases',0),
   ('10067','Venezuelan equine encephalitis virus non-neuroinvasive disease','NNDSS Event Codes','Arboviral Diseases',0),
   ('11545','Vibriosis (any species of the family Vibrionaceae, other than toxigenic Vibrio cholerae O1 or O139)','NNDSS Event Codes','Enteric Diseases',1),
   ('10056','West Nile virus disease, neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10049','West Nile virus disease, non-neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10052','Western equine encephalitis virus disease, neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10065','Western equine encephalitis virus disease, non-neuroinvasive','NNDSS Event Codes','Arboviral Diseases',1),
   ('10660','Yellow fever ','NNDSS Event Codes','Arboviral Diseases',1),
   ('11565','Yersiniosis (non-pestis)','NNDSS Event Codes','Enteric Diseases',0),
   ('50224','Zika virus disease, congenital','NNDSS Event Codes','Arboviral Diseases',1),
   ('50223','Zika virus disease, non-congenital','NNDSS Event Codes','Arboviral Diseases',1),
   ('50222','Zika virus infection, congenital','NNDSS Event Codes','Arboviral Diseases',1),
   ('50221','Zika virus infection, non-congenital','NNDSS Event Codes','Arboviral Diseases',1)
GO

-- update this so we know where the code came from...
UPDATE [Surveillance].[Event_Code]
   SET Data_Owner_ID = 'NNDSS',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- NNDSS Event Code
INSERT INTO [Surveillance].[Severity_Code] ([Code_ID], [Description], [CodeSet_Name], [Category_ID], [Notifiable_Indicator]) VALUES
   ('399166001','Fatal (qualifier value)','SNOMED-CT', 'TB'),
   ('434081000124108','Patient requires hospitalization (finding)','SNOMED-CT', 'TB')
GO

   -- update this so we know where the code came from...
UPDATE [Surveillance].[Severity_Code]
   SET Data_Owner_ID = 'SNOMED-CT',
       Agency_Reporting_ID = 'SNOMED-CT',
       Version_Number = 'v1'
GO