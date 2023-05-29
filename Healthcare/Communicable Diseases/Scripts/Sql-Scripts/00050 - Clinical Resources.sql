
-- Complication v6
INSERT INTO [Clinical].[Complication_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('272033007','Deafness symptom (disorder)','SNOMED-CT'),
   ('237443002','Mastitis of mumps (disorder)','SNOMED-CT'),
   ('31646008','Mumps encephalitis (disorder)','SNOMED-CT'),
   ('44201003','Mumps meningitis (disorder)','SNOMED-CT'),
   ('75548002','Mumps oophoritis (disorder)','SNOMED-CT'),
   ('78580004','Mumps orchitis (disorder)','SNOMED-CT'),
   ('10665004','Mumps pancreatitis (disorder)','SNOMED-CT'),
   ('OTH','other','NullFlavor'),
   ('UNK','unknown','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Complication_Code]
   SET Data_Owner_ID = 'CDC',
       Category_ID = 'Mumps',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v6'
GO

-- Clinical Manifestation v1
INSERT INTO [Clinical].[Manifestation_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('233917008','Atrioventricular block (disorder)','SNOMED-CT'),
   ('193093009','Bell''s palsy (disorder)','SNOMED-CT'),
   ('48780006','Cranial neuritis (disorder)','SNOMED-CT'),
   ('45170000','Encephalitis (disorder)','SNOMED-CT'),
   ('62950007','Encephalomyelitis (disorder)','SNOMED-CT'),
   ('69588003','Erythema chronica migrans (disorder)','SNOMED-CT'),
   ('33937009','Lyme arthritis (disorder)','SNOMED-CT'),
   ('276064006','Lymphocytic meningitis (disorder)','SNOMED-CT'),
   ('72274001','Nerve root disorder (disorder)','SNOMED-CT'),
   ('OTH','Other','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Manifestation_Code]
   SET Data_Owner_ID = 'CDC',
       Category_ID = 'Clinical',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- Birth Status v1
INSERT INTO [Clinical].[Birth_Status_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('438949009','alive','SNOMED-CT'),
   ('PHC1285','Born alive, then died','PHIN VS (CDC Local Coding System)'),
   ('237364002','stillbirth','SNOMED-CT'),
   ('UNK','unknown','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Birth_Status_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- Symptom Sign v1
INSERT INTO [Clinical].[Symptom_Sign_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('84387000','asymptomatic','SNOMED-CT'),
   ('91554004','condylomata lata','SNOMED-CT'),
   ('397746007','snuffles','SNOMED-CT'),
   ('266128007','rash of secondary syphilis','SNOMED-CT'),
   ('36760000','hepatosplenomegaly','SNOMED-CT'),
   ('PHC639','Hepatitis and or Jaundice','PHIN VS (CDC Local Coding System)'),
   ('135834002','pseudoparalysis','SNOMED-CT'),
   ('267038008','edema','SNOMED-CT'),
   ('OTH','other','NullFlavor'),
   ('UNK','unknown','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Symptom_Sign_Code]
   SET Data_Owner_ID = 'CDC',
       Category_ID = 'Syphilis_CS',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- Stage Code v1
INSERT INTO [Clinical].[Stage_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('266127002','primary syphilis','SNOMED-CT'),
   ('240557004','secondary syphilis','SNOMED-CT'),
   ('186867005','latent early syphilis','SNOMED-CT'),
   ('PHC1275','late or late latent','PHIN VS (CDC Local Coding System)'),
   ('PHC1276','previously treated / serofast','PHIN VS (CDC Local Coding System)'),
   ('PHC1506','Syphilis, early non-primary, non-secondary','PHIN VS (CDC Local Coding System)'),
   ('PHC1507','Syphilis, unknown duration or late','PHIN VS (CDC Local Coding System)'),
   ('OTH','other','NullFlavor'),
   ('UNK','unknown','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Stage_Code]
   SET Data_Owner_ID = 'CDC',
       Category_ID = 'Syphilis_CS',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- Pregnancy Trimester Code v2
INSERT INTO [Clinical].[Pregnancy_Trimester_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('255246003','First trimester (qualifier value)','SNOMED-CT'),
   ('255247007','Second trimester (qualifier value)','SNOMED-CT'),
   ('255248002','Third trimester (qualifier value)','SNOMED-CT'),
   ('UNK','unknown','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Pregnancy_Trimester_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- Blood Product Code v1
INSERT INTO [Clinical].[Blood_Product_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('OTH','other','NullFlavor'),
   ('256400005','Plasma product (product)','SNOMED-CT'),
   ('256395009','Platelet product (product)','SNOMED-CT'),
   ('126242007','Red blood cells, blood product (product)','SNOMED-CT'),
   ('UNK','unknown','NullFlavor')
GO

-- Indicator Flag Code
INSERT INTO [Clinical].[Indicator_Flag_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('Y','Yes','INDICATOR-FLAG'),
   ('N','No','INDICATOR-FLAG'),
   ('U','Unknown','INDICATOR-FLAG')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Indicator_Flag_Code]
   SET Data_Owner_ID = 'COMMON',
       Agency_Reporting_ID = 'COMMON',
       Version_Number = 'v1'
GO

-- PHVS Laboratory Types Arboviral - CDC - v2
INSERT INTO [Clinical].[Lab_Test_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('LAB721','Arboviral antigen','PHIN Questions'),
   ('LAB611','Arbovirus CSF IgM','PHIN Questions'),
   ('LAB613','Arbovirus CSF PCR','PHIN Questions'),
   ('LAB612','Arbovirus CSF PRNT','PHIN Questions'),
   ('LAB621','Arbovirus IgM','PHIN Questions'),
   ('LAB618','Arbovirus Immunohistochemical Staining','PHIN Questions'),
   ('LAB622','Arbovirus PCR','PHIN Questions'),
   ('LAB623','Arbovirus PRNT','PHIN Questions'),
   ('LAB624','Arbovirus Serum IgM','PHIN Questions'),
   ('LAB610','Arbovirus Serum PCR or NAT','PHIN Questions'),
   ('LAB625','Arbovirus Serum PRNT','PHIN Questions')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Lab_Test_Code]
   SET Category_ID = 'Arboviral',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v6'
GO

-- PHVS Specimen Type Arboviral - CDC - v1
INSERT INTO [Clinical].[Specimen_Type] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('429881000124104','Acute phase serum specimen','SNOMED-CT'),
   ('119373006','Amniotic fluid specimen','SNOMED-CT'),
   ('119297000','Blood specimen','SNOMED-CT'),
   ('309051001','Body fluid sample','SNOMED-CT'),
   ('258450006','Cerebrospinal fluid sample','SNOMED-CT'),
   ('429891000124101','Convalescent phase serum specimen','SNOMED-CT'),
   ('122556008','Cord blood specimen','SNOMED-CT'),
   ('110968003','Fetal cytologic material','SNOMED-CT'),
   ('309502007','Fetus specimen','SNOMED-CT'),
   ('119342007','Saliva specimen','SNOMED-CT'),
   ('119347001','Seminal fluid specimen','SNOMED-CT'),
   ('119364003','Serum specimen','SNOMED-CT'),
   ('119403008','Specimen from placenta','SNOMED-CT'),
   ('119376003','Tissue specimen','SNOMED-CT'),
   ('128157004','Tissue specimen from brain','SNOMED-CT'),
   ('122575003','Urine specimen','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Lab_Test_Code]
   SET Category_ID = 'Arboviral',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- PHVS Lab Result Type - CDC - v1
INSERT INTO [Clinical].[Lab_Result_Type] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('42425007','Equivocal (qualifier value)','SNOMED-CT'),
   ('260385009','Negative (qualifier value)','SNOMED-CT'),
   ('10828004','Positive (qualifier value)','SNOMED-CT'),
   ('373121007','Test not done (qualifier value)','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Lab_Result_Type]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- PHVS Lab Type - CDC - v1
INSERT INTO [Clinical].[Lab_Type] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('PHC412','CDC Laboratory','PHIN VS (CDC Local Coding)'),
   ('PHC645','Commercial laboratory','PHIN VS (CDC Local Coding)'),
   ('PHC414','State Laboratory','PHIN VS (CDC Local Coding)')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Lab_Type]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- CDC  PHVS Notifiable Event Disease Condition CDC Code v35
INSERT INTO [Clinical].[Disease_Condition_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('50225','Acanthamoeba disease (excluding keratitis)','PH_NEDC - CDC'),
   ('11120','Acute flaccid myelitis','PH_NEDC - CDC'),
   ('11090','Anaplasma phagocytophilum','PH_NEDC - CDC'),
   ('10350','Anthrax','PH_NEDC - CDC'),
   ('12010','Babesiosis','PH_NEDC - CDC'),
   ('50226','Balamuthia mandrillaris disease','PH_NEDC - CDC'),
   ('11910','Blastomycosis','PH_NEDC - CDC'),
   ('10530','Botulism, foodborne','PH_NEDC - CDC'),
   ('10540','Botulism, infant','PH_NEDC - CDC'),
   ('10550','Botulism, other (includes wound)','PH_NEDC - CDC'),
   ('10548','Botulism, other unspecified','PH_NEDC - CDC'),
   ('10549','Botulism, wound','PH_NEDC - CDC'),
   ('10020','Brucellosis','PH_NEDC - CDC'),
   ('10058','Cache Valley virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10066','Cache Valley virus non-neuroinvasive disease','PH_NEDC - CDC'),
   ('11718','California encephalitis virus disease','PH_NEDC - CDC'),
   ('10054','California serogroup virus diseases, neuroinvasive','PH_NEDC - CDC'),
   ('10061','California serogroup virus diseases, nonneuroinvasive','PH_NEDC - CDC'),
   ('11020','Campylobacteriosis','PH_NEDC - CDC'),
   ('50263','Candida auris, clinical','PH_NEDC - CDC'),
   ('50264','Candida auris, colonization/screening','PH_NEDC - CDC'),
   ('50244','Carbapenemase-Producing Carbapenem-Resistant Enterobacteriaceae (CP-CRE)','PH_NEDC - CDC'),
   ('32016','Carbon Monoxide Poisoning','PH_NEDC - CDC'),
   ('10273','Chancroid','PH_NEDC - CDC'),
   ('11649','Chapare hemorrhagic fever','PH_NEDC - CDC'),
   ('10073','Chikungunya virus diseases','PH_NEDC - CDC'),
   ('10274','Chlamydia trachomatis infection','PH_NEDC - CDC'),
   ('10470','Cholera (toxigenic Vibrio cholerae O1 or O139)','PH_NEDC - CDC'),
   ('11900','Coccidioidomycosis','PH_NEDC - CDC'),
   ('10093','Colorado tick fever virus disease','PH_NEDC - CDC'),
   ('11065','Coronavirus Disease 2019 (COVID-19)','PH_NEDC - CDC'),
   ('11640','Crimean-Congo hemorrhagic fever','PH_NEDC - CDC'),
   ('11580','Cryptosporidiosis','PH_NEDC - CDC'),
   ('11575','Cyclosporiasis','PH_NEDC - CDC'),
   ('10680','Dengue','PH_NEDC - CDC'),
   ('11705','Dengue, severe','PH_NEDC - CDC'),
   ('11704','Dengue-like illness','PH_NEDC - CDC'),
   ('10040','Diphtheria','PH_NEDC - CDC'),
   ('10053','Eastern equine encephalitis virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10062','Eastern equine encephalitis virus disease, nonneuroinvasive','PH_NEDC - CDC'),
   ('11630','Ebola hemorrhagic fever','PH_NEDC - CDC'),
   ('11088','Ehrlichia chaffeensis','PH_NEDC - CDC'),
   ('11089','Ehrlichia ewingii','PH_NEDC - CDC'),
   ('11091','Ehrlichiosis/Anaplasmosis, undetermined','PH_NEDC - CDC'),
   ('11566','Enterotoxigenic E.coli (ETEC)','PH_NEDC - CDC'),
   ('50237','Flavivirus disease, not otherwise specified','PH_NEDC - CDC'),
   ('11570','Giardiasis','PH_NEDC - CDC'),
   ('10280','Gonorrhea','PH_NEDC - CDC'),
   ('11648','Guanarito hemorrhagic fever','PH_NEDC - CDC'),
   ('10590','Haemophilus influenzae, invasive disease','PH_NEDC - CDC'),
   ('10380','Hansen disease (Leprosy)','PH_NEDC - CDC'),
   ('11610','Hantavirus infection, non-Hantavirus Pulmonary Syndrome','PH_NEDC - CDC'),
   ('11590','Hantavirus pulmonary syndrome','PH_NEDC - CDC'),
   ('11550','Hemolytic uremic syndrome postdiarrheal','PH_NEDC - CDC'),
   ('10110','Hepatitis A, acute','PH_NEDC - CDC'),
   ('10105','Hepatitis B, virus infection, chronic','PH_NEDC - CDC'),
   ('10100','Hepatitis B, acute','PH_NEDC - CDC'),
   ('10104','Hepatitis B, perinatal infection','PH_NEDC - CDC'),
   ('10101','Hepatitis C, acute','PH_NEDC - CDC'),
   ('10106','Hepatitis C, Chronic','PH_NEDC - CDC'),
   ('50248','Hepatitis C, perinatal infection','PH_NEDC - CDC'),
   ('10103','Hepatitis E, acute','PH_NEDC - CDC'),
   ('11915','Histoplasmosis','PH_NEDC - CDC'),
   ('11061','Influenza-associated pediatric mortality','PH_NEDC - CDC'),
   ('11723','Invasive pneumococcal disease','PH_NEDC - CDC'),
   ('10079','Jamestown Canyon virus disease, non-neuroinvasive','PH_NEDC - CDC'),
   ('10078','Jamestown Canyon virus, neuroinvasive disease','PH_NEDC - CDC'),
   ('10059','Japanese encephalitis virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10068','Japanese encephalitis virus non-neuroinvasive disease','PH_NEDC - CDC'),
   ('11638','Junín hemorrhagic fever','PH_NEDC - CDC'),
   ('11712','Keystone virus disease','PH_NEDC - CDC'),
   ('10081','La Crosse virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10082','LaCrosse virus non-neuroinvasive disease','PH_NEDC - CDC'),
   ('11632','Lassa fever','PH_NEDC - CDC'),
   ('50258','Latent TB infection','PH_NEDC - CDC'),
   ('10490','Legionellosis','PH_NEDC - CDC'),
   ('10390','Leptospirosis','PH_NEDC - CDC'),
   ('10640','Listeriosis','PH_NEDC - CDC'),
   ('11644','Lujo virus','PH_NEDC - CDC'),
   ('11080','Lyme disease','PH_NEDC - CDC'),
   ('11637','Machupo hemorrhagic fever','PH_NEDC - CDC'),
   ('10130','Malaria','PH_NEDC - CDC'),
   ('11631','Marburg fever','PH_NEDC - CDC'),
   ('10140','Measles (rubeola)','PH_NEDC - CDC'),
   ('10150','Meningococcal disease (Neisseria meningitidis)','PH_NEDC - CDC'),
   ('11066','Multisystem Inflammatory Syndrome (MIS) associated with Coronavirus Disease 2019 (COVID-19)','PH_NEDC - CDC'),
   ('10180','Mumps','PH_NEDC - CDC'),
   ('50227','Naegleria fowleri causing Primary Amebic Meningoencephalitis','PH_NEDC - CDC'),
   ('50261','Neonatal sepsis','PH_NEDC - CDC'),
   ('11062','Novel influenza A virus infections, initial detections of','PH_NEDC - CDC'),
   ('10072','Other Arboviral diseases, not otherwise specified','PH_NEDC - CDC'),
   ('10190','Pertussis','PH_NEDC - CDC'),
   ('10440','Plague','PH_NEDC - CDC'),
   ('10410','Poliomyelitis, paralytic','PH_NEDC - CDC'),
   ('10405','Poliovirus infection, nonparalytic','PH_NEDC - CDC'),
   ('10057','Powassan virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10063','Powassan virus disease, nonneuroinvasive','PH_NEDC - CDC'),
   ('10450','Psittacosis (Ornithosis)','PH_NEDC - CDC'),
   ('10257','Q fever, acute','PH_NEDC - CDC'),
   ('10258','Q fever, chronic','PH_NEDC - CDC'),
   ('10340','Rabies, animal','PH_NEDC - CDC'),
   ('10460','Rabies, human','PH_NEDC - CDC'),
   ('11646','Respiratory Syncytial Virus-Associated Deaths','PH_NEDC - CDC'),
   ('10200','Rubella','PH_NEDC - CDC'),
   ('10370','Rubella, congenital syndrome','PH_NEDC - CDC'),
   ('11639','Sabia-associated hemorrhagic fever','PH_NEDC - CDC'),
   ('50267','Salmonella enterica serotype Typhi (S.Typhi) infection)','PH_NEDC - CDC'),
   ('50266','Salmonella enterica serotypes Paratyphi A, B (tartrate negative) and C (S. Paratyphi) infection','PH_NEDC - CDC'),
   ('50265','Salmonellosis (excluding S. Typhi infection and S. Paratyphi infection)','PH_NEDC - CDC'),
   ('10575','Severe Acute Respiratory Syndrome (SARS)-associated Coronavirus disease (SARS-CoV)','PH_NEDC - CDC'),
   ('11563','Shiga toxin-producing Escherichia coli (STEC)','PH_NEDC - CDC'),
   ('11010','Shigellosis','PH_NEDC - CDC'),
   ('11800','Smallpox','PH_NEDC - CDC'),
   ('11734','Snowshoe hare virus disease','PH_NEDC - CDC'),
   ('10250','Spotted Fever Rickettsiosis','PH_NEDC - CDC'),
   ('10051','St. Louis encephalitis virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10064','St. Louis encephalitis virus disease, nonneuroinvasive','PH_NEDC - CDC'),
   ('11710','Streptococcal disease, invasive, Group A  (Streptococcus pyogenes)','PH_NEDC - CDC'),
   ('11715','Streptococcal disease, invasive, Group B  (Streptococcus agalactiae)','PH_NEDC - CDC'),
   ('11700','Streptococcal toxic shock syndrome','PH_NEDC - CDC'),
   ('10316','Syphilis, congenital','PH_NEDC - CDC'),
   ('10313','Syphilis, early non-primary, non-secondary','PH_NEDC - CDC'),
   ('10311','Syphilis, primary','PH_NEDC - CDC'),
   ('10312','Syphilis, secondary','PH_NEDC - CDC'),
   ('10310','Syphilis, total primary and secondary','PH_NEDC - CDC'),
   ('10320','Syphilis, unknown duration or late','PH_NEDC - CDC'),
   ('10210','Tetanus','PH_NEDC - CDC'),
   ('10074','Tick-borne Encephalitis viruses','PH_NEDC - CDC'),
   ('10520','Toxic-shock syndrome (other than streptococcal)','PH_NEDC - CDC'),
   ('10270','Trichinellosis','PH_NEDC - CDC'),
   ('11724','Trivittatus virus disease','PH_NEDC - CDC'),
   ('10220','Tuberculosis','PH_NEDC - CDC'),
   ('10230','Tularemia','PH_NEDC - CDC'),
   ('11663','Vancomycin-intermediate Staphylococcus aureus (VISA)','PH_NEDC - CDC'),
   ('11665','Vancomycin-resistant Staphylococcus aureus (VRSA)','PH_NEDC - CDC'),
   ('10030','Varicella (Chickenpox)','PH_NEDC - CDC'),
   ('10055','Venezuelan equine encephalitis virus neuroinvasive disease','PH_NEDC - CDC'),
   ('10067','Venezuelan equine encephalitis virus non-neuroinvasive disease','PH_NEDC - CDC'),
   ('11545','Vibriosis (any species of the family Vibrionaceae, other than toxigenic Vibrio cholerae O1 or O139)','PH_NEDC - CDC'),
   ('10056','West Nile virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10049','West Nile virus disease, nonneuroinvasive','PH_NEDC - CDC'),
   ('10052','Western equine encephalitis virus disease, neuroinvasive','PH_NEDC - CDC'),
   ('10065','Western equine encephalitis virus disease, nonneuroinvasive','PH_NEDC - CDC'),
   ('10660','Yellow fever','PH_NEDC - CDC'),
   ('11565','Yersiniosis (non-pestis)','PH_NEDC - CDC'),
   ('50224','Zika virus disease, congenital','PH_NEDC - CDC'),
   ('50223','Zika virus disease, non-congenital','PH_NEDC - CDC'),
   ('50222','Zika virus infection, congenital','PH_NEDC - CDC'),
   ('50221','Zika virus infection, non-congenital','PH_NEDC - CDC')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Disease_Condition_Code]
   SET Category_ID = 'Public Health',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = '35'
GO

-- PHVS Syndrome Arbovirus - CDC - v7
INSERT INTO [Clinical].[Syndrome_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('84387000','Asymptomatic','SNOMED-CT'),
   ('416113008','Febrile disorder','SNOMED-CT'),
   ('7180009','Meningitis','SNOMED-CT'),
   ('PHC638','Encephalitis Including Meningoencephalitis','PHIN VS (CDC Local Coding System)'),
   ('698293005','Acute flaccid paralysis','SNOMED-CT'),
   ('40956001','Guillain-Barre Syndrome','SNOMED-CT'),
   ('PHC639','Hepatitis and or Jaundice','PHIN VS (CDC Local Coding System)'),
   ('57653000','Multiple organ failure','SNOMED-CT'),
   ('OTH','Other','NullFlavor'),
   ('PHC1457','Other Neuroinvasive Presentation','PHIN VS (CDC Local Coding System)'),
   ('38362002','Dengue','SNOMED-CT'),
   ('PHC1459','Dengue-like illness','PHIN VS (CDC Local Coding System)'),
   ('PHC1458','Severe Dengue','PHIN VS (CDC Local Coding System)'),
   ('UNK','unknown','NullFlavor'),
   ('82353009','Congenital infectious','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Syndrome_Code]
   SET Category_ID = 'Arboviral',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v7'
GO

-- PHVS Clinical Syndrome Secondary - Arboviral - CDC - v2
INSERT INTO [Clinical].[Syndrome_Secondary_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('260413007','None','SNOMED-CT'),
   ('7180009','Meningitis','SNOMED-CT'),
   ('PHC638','Encephalitis Including Meningoencephalitis','PHIN VS (CDC Local Coding System)'),
   ('698293005','Acute flaccid paralysis ','SNOMED-CT'),
   ('40956001','Guillain-Barre Syndrome','SNOMED-CT'),
   ('PHC639','Hepatitis and or Jaundice','PHIN VS (CDC Local Coding System)'),
   ('57653000','Multiple organ failure','SNOMED-CT'),
   ('OTH','Other','NullFlavor'),
   ('PHC1457','Other Neuroinvasive Presentation','PHIN VS (CDC Local Coding System)')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Syndrome_Secondary_Code]
   SET Caegory_ID = 'Arboviral',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- PHVS Clinical Finding - CDC - v1
INSERT INTO [Clinical].[Finding_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('67782005','Acute respiratory distress syndrome (disorder)','SNOMED-CT'),
   ('102594003','Electrocardiogram abnormal (finding)','SNOMED-CT'),
   ('OTH','other','NullFlavor'),
   ('233604007','Pneumonia (disorder)','SNOMED-CT'),
   ('168734001','Standard chest X-ray abnormal (finding)','SNOMED-CT'),
   ('UNK','unknown','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Finding_Code]
   SET [Category_ID] = 'COVID-19',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- PHVS Disease Acquired Jurisdiction - CDC - v3
INSERT INTO [Clinical].[Jurisdiction_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('PHC244','Indigenous, within jurisdiction','PHIN VS (CDC Local Coding System)'),
   ('C1512888','International','UMLS'),
   ('PHC245','Out of jurisdiction, from another jurisdiction within state','PHIN VS (CDC Local Coding System)'),
   ('PHC246','Out of state','PHIN VS (CDC Local Coding System)'),
   ('UNK','unknown','NullFlavor'),
   ('PHC1274','Yes imported, but not able to determine source state and/or country','PHIN VS (CDC Local Coding System)')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Jurisdiction_Code]
   SET [Category_ID] = '',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v3'
GO

-- PHVS Risk Factor - CDC - v3
INSERT INTO [Clinical].[Risk_Factor_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('406506008','Attention deficit hyperactivity disorder (disorder)','SNOMED-CT'),
   ('85828009','Autoimmune disease (disorder)','SNOMED-CT'),
   ('12295008','Bronchiectasis (disorder)','SNOMED-CT'),
   ('67569000','Bronchopulmonary dysplasia of newborn (disorder)','SNOMED-CT'),
   ('85898001','Cardiomyopathy (disorder)','SNOMED-CT'),
   ('49601007','Cardiovascular disease (disorder)','SNOMED-CT'),
   ('128188000','Cerebral palsy (disorder)','SNOMED-CT'),
   ('230690007','Cerebrovascular accident (disorder)','SNOMED-CT'),
   ('62914000','Cerebrovascular disease (disorder)','SNOMED-CT'),
   ('367336001','Chemotherapy (procedure)','SNOMED-CT'),
   ('63480004','Chronic bronchitis (disorder)','SNOMED-CT'),
   ('328383001','Chronic liver disease (disorder)','SNOMED-CT'),
   ('413839001','Chronic lung disease (disorder)','SNOMED-CT'),
   ('13645005','Chronic obstructive lung disease (disorder)','SNOMED-CT'),
   ('709044004','Chronic renal disease (disorder)','SNOMED-CT'),
   ('41040004','Complete trisomy 21 syndrome (disorder)','SNOMED-CT'),
   ('13213009','Congenital heart disease (disorder)','SNOMED-CT'),
   ('53741008','Coronary arteriosclerosis (disorder)','SNOMED-CT'),
   ('190905008','Cystic fibrosis (disorder)','SNOMED-CT'),
   ('52448006','Dementia (disorder)','SNOMED-CT'),
   ('95919007','Dependence on corticoids (disorder)','SNOMED-CT'),
   ('35489007','Depressive disorder (disorder)','SNOMED-CT'),
   ('1855002','Developmental academic disorder (disorder)','SNOMED-CT'),
   ('129104009','Developmental mental disorder (disorder)','SNOMED-CT'),
   ('73211009','Diabetes mellitus (disorder)','SNOMED-CT'),
   ('21134002','Disability (finding)','SNOMED-CT'),
   ('276720006','Dysmorphism (disorder)','SNOMED-CT'),
   ('8517006','Ex-smoker (finding)','SNOMED-CT'),
   ('84114007','Heart failure (disorder)','SNOMED-CT'),
   ('234336002','Hemopoietic stem cell transplant (procedure)','SNOMED-CT'),
   ('165816005','Human immunodeficiency virus positive (finding)','SNOMED-CT'),
   ('38341003','Hypertensive disorder, systemic arterial (disorder)','SNOMED-CT'),
   ('700250006','Idiopathic pulmonary fibrosis (disorder)','SNOMED-CT'),
   ('38013005','Immunosuppression (finding)','SNOMED-CT'),
   ('233703007','Interstitial lung disease (disorder)','SNOMED-CT'),
   ('363346000','Malignant neoplastic disease (disorder)','SNOMED-CT'),
   ('74732009','Mental disorder (disorder)','SNOMED-CT'),
   ('361055000','Misuses drugs','SNOMED-CT'),
   ('414916001','Obesity (disorder)','SNOMED-CT'),
   ('OTH','Other','NullFlavor'),
   ('PHC2277','Other chronic disease','PHIN VS (CDC Local Coding System)'),
   ('238131007','Overweight (finding)','SNOMED-CT'),
   ('77386006','Pregnancy (finding)','SNOMED-CT'),
   ('58606001','Primary immune deficiency disorder (disorder)','SNOMED-CT'),
   ('59282003','Pulmonary embolism (disorder)','SNOMED-CT'),
   ('87433001','Pulmonary emphysema (disorder)','SNOMED-CT'),
   ('70995007','Pulmonary hypertension (disorder)','SNOMED-CT'),
   ('33286000','Secondary immune deficiency disorder (disorder)','SNOMED-CT'),
   ('83911000119104','Severe obesity (disorder)','SNOMED-CT'),
   ('77176002','Smoker (finding)','SNOMED-CT'),
   ('313039003','Solid organ transplant (procedure)','SNOMED-CT'),
   ('90584004','Spinal cord injury (disorder)','SNOMED-CT'),
   ('56717001','Tuberculosis (disorder)','SNOMED-CT'),
   ('UNK','Unknown','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Risk_Factor_Code]
   SET [Category_ID] = '',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v3'
GO

-- PHVS Virus Type - Arboviral - CDC - v3
INSERT INTO [Clinical].[Virus_Type] ([Type_ID], [Description], [CodeSet_Name]) VALUES
   ('764949001','Alkhurma virus (organism)','SNOMED-CT'),
   ('281165003','Arbovirus (organism)','SNOMED-CT'),
   ('56932004','Barmah Forest virus (organism)','SNOMED-CT'),
   ('764948009','Bourbon virus (organism)','SNOMED-CT'),
   ('31546004','Cache Valley virus (organism)','SNOMED-CT'),
   ('64979004','California encephalitis virus (organism)','SNOMED-CT'),
   ('243617008','California serogroup Orthobunyavirus (organism)','SNOMED-CT'),
   ('2423009','Chikungunya virus (organism)','SNOMED-CT'),
   ('34212000','Colorado tick fever virus (organism)','SNOMED-CT'),
   ('34348001','Dengue virus (organism)','SNOMED-CT'),
   ('243601002','Eastern equine encephalitis virus (organism)','SNOMED-CT'),
   ('28375005','Genus Flavivirus (organism)','SNOMED-CT'),
   ('764947004','Heartland virus (organism)','SNOMED-CT'),
   ('588234111000087104','Highlands J virus (organism)','SNOMED-CT'),
   ('9194001','Jamestown Canyon virus (organism)','SNOMED-CT'),
   ('243603004','Japanese encephalitis virus (organism)','SNOMED-CT'),
   ('61399004','Keystone virus (organism)','SNOMED-CT'),
   ('32137001','Kyasanur Forest disease virus (organism)','SNOMED-CT'),
   ('30434006','La Crosse virus (organism)','SNOMED-CT'),
   ('19874008','Mayaro virus (organism)','SNOMED-CT'),
   ('31989009','Murray Valley encephalitis virus (organism)','SNOMED-CT'),
   ('8905000','O''nyong-nyong virus (organism)','SNOMED-CT'),
   ('33660003','Oropouche virus (organism)','SNOMED-CT'),
   ('45838003','Powassan virus (organism)','SNOMED-CT'),
   ('28335002','Rift Valley fever virus (organism)','SNOMED-CT'),
   ('71518008','Rocio virus (organism)','SNOMED-CT'),
   ('32458000','Ross River virus (organism)','SNOMED-CT'),
   ('58432001','Saint Louis encephalitis virus (organism)','SNOMED-CT'),
   ('30681002','Sindbis virus (organism)','SNOMED-CT'),
   ('28732002','Snowshoe hare virus (organism)','SNOMED-CT'),
   ('6895004','Tahyna virus (organism)','SNOMED-CT'),
   ('32323003','Tick-borne encephalitis virus (organism)','SNOMED-CT'),
   ('51253001','Toscana virus (organism)','SNOMED-CT'),
   ('87919008','Trivittatus virus (organism)','SNOMED-CT'),
   ('85183000','Usutu virus (organism)','SNOMED-CT'),
   ('62958000','Venezuelan equine encephalomyelitis virus (organism)','SNOMED-CT'),
   ('57311007','West Nile virus (organism)','SNOMED-CT'),
   ('11428003','Western equine encephalomyelitis virus (organism)','SNOMED-CT'),
   ('26630006','Yellow fever virus (organism)','SNOMED-CT'),
   ('50471002','Zika virus (organism)','SNOMED-CT')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Virus_Type]
   SET Category_ID = 'Arboviral',
       Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v8'
GO

-- PHVS Vaccine Manufacturer v14
INSERT INTO [Clinical].[Vaccine_Manufacturer_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
   ('AB','Abbott Laboratories','Manufacturers of vaccines (MVX)'),
   ('ACA','Acambis, Inc','Manufacturers of vaccines (MVX)'),
   ('AD','Adams Laboratories, Inc.','Manufacturers of vaccines (MVX)'),
   ('AKR','Akorn, Inc','Manufacturers of vaccines (MVX)'),
   ('ALP','Alpha Therapeutic Corporation','Manufacturers of vaccines (MVX)'),
   ('AR','Armour','Manufacturers of vaccines (MVX)'),
   ('ASZ','AstraZeneca','Manufacturers of vaccines (MVX)'),
   ('AVB','Aventis Behring L.L.C.','Manufacturers of vaccines (MVX)'),
   ('AVI','Aviron','Manufacturers of vaccines (MVX)'),
   ('BRR','Barr Laboratories','Manufacturers of vaccines (MVX)'),
   ('BN','Bavarian Nordic A/S','Manufacturers of vaccines (MVX)'),
   ('BAH','Baxter Healthcare Corporation','Manufacturers of vaccines (MVX)'),
   ('BA','Baxter Healthcare Corporation-inactive','Manufacturers of vaccines (MVX)'),
   ('BAY','Bayer Corporation','Manufacturers of vaccines (MVX)'),
   ('BP','Berna Products','Manufacturers of vaccines (MVX)'),
   ('BPC','Berna Products Corporation','Manufacturers of vaccines (MVX)'),
   ('BBI','Bharat Biotech International Limited','Manufacturers of vaccines (MVX)'),
   ('CSL','bioCSL','Manufacturers of vaccines (MVX)'),
   ('BTP','Biotest Pharmaceuticals Corporation','Manufacturers of vaccines (MVX)'),
   ('CNJ','Cangene Corporation','Manufacturers of vaccines (MVX)'),
   ('CMP','Celltech Medeva Pharmaceuticals','Manufacturers of vaccines (MVX)'),
   ('CEN','Centeon L.L.C.','Manufacturers of vaccines (MVX)'),
   ('CHI','Chiron Corporation','Manufacturers of vaccines (MVX)'),
   ('CON','Connaught','Manufacturers of vaccines (MVX)'),
   ('CRU','Crucell','Manufacturers of vaccines (MVX)'),
   ('DSI','Dispensing Solutions','Manufacturers of vaccines (MVX)'),
   ('DYN','Dynaport','Manufacturers of vaccines (MVX)'),
   ('DVX','Dynavax, Inc.','Manufacturers of vaccines (MVX)'),
   ('DVC','DynPort Vaccine Company, LLC','Manufacturers of vaccines (MVX)'),
   ('MIP','Emergent BioSolutions','Manufacturers of vaccines (MVX)'),
   ('PAX','Emergent Travel Health, Inc (Formerly PaxVax)','Manufacturers of vaccines (MVX)'),
   ('EVN','Evans Medical Limited','Manufacturers of vaccines (MVX)'),
   ('GEO','GeoVax Labs, Inc.','Manufacturers of vaccines (MVX)'),
   ('SKB','GlaxoSmithKline','Manufacturers of vaccines (MVX)'),
   ('GRE','Greer Laboratories, Inc.','Manufacturers of vaccines (MVX)'),
   ('GRF','Grifols','Manufacturers of vaccines (MVX)'),
   ('IDB','ID Biomedical','Manufacturers of vaccines (MVX)'),
   ('IAG','Immuno International AG','Manufacturers of vaccines (MVX)'),
   ('IUS','Immuno-U.S., Inc.','Manufacturers of vaccines (MVX)'),
   ('INT','Intercell Biomedical','Manufacturers of vaccines (MVX)'),
   ('JSN','Janssen','Manufacturers of vaccines (MVX)'),
   ('JNJ','Johnson and Johnson','Manufacturers of vaccines (MVX)'),
   ('KED','Kedrion Biopharma','Manufacturers of vaccines (MVX)'),
   ('KGC','Korea Green Cross Corporation','Manufacturers of vaccines (MVX)'),
   ('LED','Lederle','Manufacturers of vaccines (MVX)'),
   ('MBL','Massachusetts Biologic Laboratories','Manufacturers of vaccines (MVX)'),
   ('MA','Massachusetts Public Health Biologic Laboratories','Manufacturers of vaccines (MVX)'),
   ('MCM','MCM Vaccine Company','Manufacturers of vaccines (MVX)'),
   ('MED','MedImmune, Inc. (AstraZeneca)','Manufacturers of vaccines (MVX)'),
   ('MSD','Merck and Co., Inc.','Manufacturers of vaccines (MVX)'),
   ('IM','Merieux','Manufacturers of vaccines (MVX)'),
   ('MIL','Miles','Manufacturers of vaccines (MVX)'),
   ('MOD','Moderna US, Inc.','Manufacturers of vaccines (MVX)'),
   ('MSP','MSP Vaccine Company - (partnership Merck and Sanofi Pasteur)','Manufacturers of vaccines (MVX)'),
   ('NAB','NABI','Manufacturers of vaccines (MVX)'),
   ('NYB','New York Blood Center','Manufacturers of vaccines (MVX)'),
   ('NAV','North American Vaccine, Inc.','Manufacturers of vaccines (MVX)'),
   ('NOV','Novartis Pharmaceutical Corporation','Manufacturers of vaccines (MVX)'),
   ('NVX','Novavax, Inc.','Manufacturers of vaccines (MVX)'),
   ('OTC','Organon Teknika Corporation','Manufacturers of vaccines (MVX)'),
   ('ORT','Ortho-clinical Diagnostics','Manufacturers of vaccines (MVX)'),
   ('OTH','Other manufacturer','Manufacturers of vaccines (MVX)'),
   ('PD','Parkedale Pharmaceuticals','Manufacturers of vaccines (MVX)'),
   ('PFR','Pfizer, Inc','Manufacturers of vaccines (MVX)'),
   ('PWJ','PowderJect Pharmaceuticals','Manufacturers of vaccines (MVX)'),
   ('PRX','Praxis Biologics','Manufacturers of vaccines (MVX)'),
   ('PSC','Protein Sciences','Manufacturers of vaccines (MVX)'),
   ('REB','Rebel Distributors','Manufacturers of vaccines (MVX)'),
   ('PMC','Sanofi Pasteur','Manufacturers of vaccines (MVX)'),
   ('SCL','Sclavo, Inc.','Manufacturers of vaccines (MVX)'),
   ('SEQ','Seqirus','Manufacturers of vaccines (MVX)'),
   ('SPH','Sinopharm-Biotech','Manufacturers of vaccines (MVX)'),
   ('SNV','Sinovac','Manufacturers of vaccines (MVX)'),
   ('SOL','Solvay Pharmaceuticals','Manufacturers of vaccines (MVX)'),
   ('SI','Swiss Serum and Vaccine Inst.','Manufacturers of vaccines (MVX)'),
   ('TAL','Talecris Biotherapeutics','Manufacturers of vaccines (MVX)'),
   ('TVA','TEVA Pharmaceuticals USA','Manufacturers of vaccines (MVX)'),
   ('JPN','The Research Foundation for Microbial Diseases of Osaka University (BIKEN)','Manufacturers of vaccines (MVX)'),
   ('USA','United States Army Medical Research and Material Command','Manufacturers of vaccines (MVX)'),
   ('UNK','Unknown manufacturer','Manufacturers of vaccines (MVX)'),
   ('VAL','Valneva','Manufacturers of vaccines (MVX)'),
   ('VXG','VaxGen','Manufacturers of vaccines (MVX)'),
   ('VBI','VBI Vaccines, Inc','Manufacturers of vaccines (MVX)'),
   ('VET','Vetter Pharma Fertigung GmbH & Co. KG','Manufacturers of vaccines (MVX)'),
   ('WAL','Wyeth','Manufacturers of vaccines (MVX)'),
   ('WA','Wyeth-Ayerst','Manufacturers of vaccines (MVX)'),
   ('ZLB','ZLB Behring','Manufacturers of vaccines (MVX)')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Vaccine_Manufacturer_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v14'
GO

-- PHVS Vaccine Not Given Reason - CDC - v3
INSERT INTO [Clinical].[Vaccine_Reason_Not_Given_Code] ([Type_ID], [Description], [CodeSet_Name]) VALUES
   ('PHC1313','Foreign Visitor','PHIN VS (CDC Local Coding System)'),
   ('PHC1310','Immigrant','PHIN VS (CDC Local Coding System)'),
   ('PHC82','Lab evidence of previous disease','PHIN VS (CDC Local Coding System)'),
   ('PHC83','MD diagnosis of previous disease','PHIN VS (CDC Local Coding System)'),
   ('397745006','Medical contraindication','SNOMED-CT'),
   ('PHC1311','Missed opportunity in medical setting','PHIN VS (CDC Local Coding System)'),
   ('OTH','Other','NullFlavor'),
   ('PHC94','Parent/Patient forgot to vaccinate','PHIN VS (CDC Local Coding System)'),
   ('PHC95','Parent/Patient refusal','PHIN VS (CDC Local Coding System)'),
   ('PHC93','Parent/patient report of previous disease','PHIN VS (CDC Local Coding System)'),
   ('PHC1314','Parent/Patient unaware of recommendation','PHIN VS (CDC Local Coding System)'),
   ('PHC92','Philosophical objection','PHIN VS (CDC Local Coding System)'),
   ('PHC96','Religious exemption','PHIN VS (CDC Local Coding System)'),
   ('PHC1312','Too Young','PHIN VS (CDC Local Coding System)'),
   ('UNK','unknown','NullFlavor'),
   ('C4698055','Vaccine not available','UMLS'),
   ('PHC1315','Vaccine record incomplete/unavailable','PHIN VS (CDC Local Coding System)')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Vaccine_Reason_Not_Given_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v3'
GO

-- PHVS Vaccine Event Information Source - CDC - v3
INSERT INTO [Clinical].[Vaccine_Event_Source_Code] ([Type_ID], [Description], [CodeSet_Name]) VALUES
   ('184225006','Computer record of patient (record artifact)','SNOMED-CT'),
   ('06','Historical information - from birth certificate','Immunization Information Source'),
   ('02','Historical information - from other provider','Immunization Information Source'),
   ('05','Historical information - from other registry','Immunization Information Source'),
   ('PHC1435','Historical information - from patient or parent''s recall','PHIN VS (CDC Local Coding System)'),
   ('PHC1436','Historical information - from patient or parent''s written record','PHIN VS (CDC Local Coding System)'),
   ('08','Historical information - from public agency','Immunization Information Source'),
   ('07','Historical information - from school record','Immunization Information Source'),
   ('01','Historical information - source unspecified','Immunization Information Source'),
   ('PHC1936','Immunization Information System','PHIN VS (CDC Local Coding System)'),
   ('00','New immunization record','Immunization Information Source'),
   ('OTH','other','NullFlavor'),
   ('PP','Primary Care Provider','Provider Role (HL7)'),
   ('UNK','unknown','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Vaccine_Event_Source_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v3'
GO

-- PHVS Vaccine Type - CDC - v12
INSERT INTO [Clinical].[Vaccine_Type] ([Type_ID], [Description], [CodeSet_Name]) VALUES
   ('24','anthrax','Vaccines administered (CVX)'),
   ('181','anthrax immune globulin','Vaccines administered (CVX)'),
   ('19','BCG','Vaccines administered (CVX)'),
   ('27','botulinum antitoxin','Vaccines administered (CVX)'),
   ('173','cholera, BivWC','Vaccines administered (CVX)'),
   ('174','cholera, live attenuated','Vaccines administered (CVX)'),
   ('26','cholera, unspecified formulation','Vaccines administered (CVX)'),
   ('172','cholera, WC-rBS','Vaccines administered (CVX)'),
   ('516','COV-2 COVID-19 Inactivated Non-US Vaccine Product (Minhai Biotechnology  Co, KCONVAC)','Vaccines administered (CVX)'),
   ('510','COVID-19 IV Non-US Vaccine (BIBP, Sinopharm)','Vaccines administered (CVX)'),
   ('511','COVID-19 IV Non-US Vaccine (CoronaVac, Sinovac)','Vaccines administered (CVX)'),
   ('502','COVID-19 IV Non-US Vaccine (COVAXIN)','Vaccines administered (CVX)'),
   ('211','COVID-19 vaccine, Subunit, rS-nanoparticle+Matrix-M1 Adjuvant, PF, 0.5  mL','Vaccines administered (CVX)'),
   ('212','COVID-19 vaccine, vector-nr, rS-Ad26, PF, 0.5 mL','Vaccines administered (CVX)'),
   ('210','COVID-19 vaccine, vector-nr, rS-ChAdOx1, PF, 0.5 mL','Vaccines administered (CVX)'),
   ('226','COVID-19, D614, recomb, preS dTM, AS03 adjuvant add, PF, 10mcg/0.5mL','Vaccines administered (CVX)'),
   ('225','COVID-19, D614, recomb, preS dTM, AS03 adjuvant add, PF, 5mcg/0.5mL','Vaccines administered (CVX)'),
   ('230','COVID-19, mRNA, LNP-S, bivalent booster, PF, 10 mcg/0.2 mL','Vaccines administered (CVX)'),
   ('301','COVID-19, mRNA, LNP-S, bivalent booster, PF, 10 mcg/0.2 mL dose','Vaccines administered (CVX)'),
   ('300','COVID-19, mRNA, LNP-S, bivalent booster, PF, 30 mcg/0.3 mL dose','Vaccines administered (CVX)'),
   ('229','COVID-19, mRNA, LNP-S, bivalent booster, PF, 50 mcg/0.5 mL or 25mcg/0.25  mL dose','Vaccines administered (CVX)'),
   ('302','COVID-19, mRNA, LNP-S, bivalent, PF, 3 mcg/0.2 mL dose','Vaccines administered (CVX)'),
   ('218','COVID-19, mRNA, LNP-S, PF, 10 mcg/0.2 mL dose, tris-sucrose','Vaccines administered (CVX)'),
   ('207','COVID-19, mRNA, LNP-S, PF, 100 mcg/0.5 mL dose','Vaccines administered (CVX)'),
   ('219','COVID-19, mRNA, LNP-S, PF, 3 mcg/0.2 mL dose, tris-sucrose','Vaccines administered (CVX)'),
   ('208','COVID-19, mRNA, LNP-S, PF, 30 mcg/0.3 mL dose','Vaccines administered (CVX)'),
   ('217','COVID-19, mRNA, LNP-S, PF, 30 mcg/0.3 mL dose, tris-sucrose','Vaccines administered (CVX)'),
   ('221','COVID-19, mRNA, LNP-S, PF, 50 mcg/0.5 mL dose','Vaccines administered (CVX)'),
   ('228','COVID-19, mRNA, LNP-S, PF, pediatric 25 mcg/0.25 mL dose','Vaccines administered (CVX)'),
   ('56','dengue fever','Vaccines administered (CVX)'),
   ('12','diphtheria antitoxin','Vaccines administered (CVX)'),
   ('28','DT (pediatric)','Vaccines administered (CVX)'),
   ('195','DT, IPV adsorbed','Vaccines administered (CVX)'),
   ('20','DTaP','Vaccines administered (CVX)'),
   ('106','DTaP, 5 pertussis antigens','Vaccines administered (CVX)'),
   ('107','DTaP, unspecified formulation','Vaccines administered (CVX)'),
   ('146','DTaP,IPV,Hib,HepB','Vaccines administered (CVX)'),
   ('170','DTAP/IPV/HIB - non-US','Vaccines administered (CVX)'),
   ('110','DTaP-Hep B-IPV','Vaccines administered (CVX)'),
   ('50','DTaP-Hib','Vaccines administered (CVX)'),
   ('120','DTaP-Hib-IPV','Vaccines administered (CVX)'),
   ('130','DTaP-IPV','Vaccines administered (CVX)'),
   ('132','DTaP-IPV-HIB-HEP B, historical','Vaccines administered (CVX)'),
   ('01','DTP','Vaccines administered (CVX)'),
   ('198','DTP-hepB-Hib Pentavalent Non-US','Vaccines administered (CVX)'),
   ('22','DTP-Hib','Vaccines administered (CVX)'),
   ('102','DTP-Hib-Hep B','Vaccines administered (CVX)'),
   ('30','HBIG','Vaccines administered (CVX)'),
   ('52','Hep A, adult','Vaccines administered (CVX)'),
   ('169','Hep A, live attenuated','Vaccines administered (CVX)'),
   ('83','Hep A, ped/adol, 2 dose','Vaccines administered (CVX)'),
   ('84','Hep A, ped/adol, 3 dose','Vaccines administered (CVX)'),
   ('85','Hep A, unspecified formulation','Vaccines administered (CVX)'),
   ('104','Hep A-Hep B','Vaccines administered (CVX)'),
   ('193','Hep A-Hep B, pediatric/adolescent','Vaccines administered (CVX)'),
   ('08','Hep B, adolescent or pediatric','Vaccines administered (CVX)'),
   ('42','Hep B, adolescent/high risk infant','Vaccines administered (CVX)'),
   ('43','Hep B, adult','Vaccines administered (CVX)'),
   ('44','Hep B, dialysis','Vaccines administered (CVX)'),
   ('45','Hep B, unspecified formulation','Vaccines administered (CVX)'),
   ('189','HepB-CpG','Vaccines administered (CVX)'),
   ('47','Hib (HbOC)','Vaccines administered (CVX)'),
   ('46','Hib (PRP-D)','Vaccines administered (CVX)'),
   ('49','Hib (PRP-OMP)','Vaccines administered (CVX)'),
   ('48','Hib (PRP-T)','Vaccines administered (CVX)'),
   ('17','Hib, unspecified formulation','Vaccines administered (CVX)'),
   ('51','Hib-Hep B','Vaccines administered (CVX)'),
   ('118','HPV, bivalent','Vaccines administered (CVX)'),
   ('62','HPV, quadrivalent','Vaccines administered (CVX)'),
   ('86','IG','Vaccines administered (CVX)'),
   ('14','IG, unspecified formulation','Vaccines administered (CVX)'),
   ('87','IGIV','Vaccines administered (CVX)'),
   ('160','Influenza A monovalent (H5N1), ADJUVANTED-2013','Vaccines administered (CVX)'),
   ('151','influenza nasal, unspecified formulation','Vaccines administered (CVX)'),
   ('123','influenza, H5N1-1203','Vaccines administered (CVX)'),
   ('135','Influenza, high dose seasonal','Vaccines administered (CVX)'),
   ('197','influenza, high-dose, quadrivalent','Vaccines administered (CVX)'),
   ('153','Influenza, injectable, MDCK, preservative free','Vaccines administered (CVX)'),
   ('171','Influenza, injectable, MDCK, preservative free, quadrivalent','Vaccines administered (CVX)'),
   ('186','Influenza, injectable, MDCK, quadrivalent, preservative','Vaccines administered (CVX)'),
   ('158','influenza, injectable, quadrivalent','Vaccines administered (CVX)'),
   ('150','influenza, injectable, quadrivalent, preservative free','Vaccines administered (CVX)'),
   ('161','Influenza, injectable,quadrivalent, preservative free, pediatric','Vaccines administered (CVX)'),
   ('166','influenza, intradermal, quadrivalent, preservative free','Vaccines administered (CVX)'),
   ('111','influenza, live, intranasal','Vaccines administered (CVX)'),
   ('149','influenza, live, intranasal, quadrivalent','Vaccines administered (CVX)'),
   ('155','influenza, recombinant, injectable, preservative free','Vaccines administered (CVX)'),
   ('185','influenza, recombinant, quadrivalent,injectable, preservative free','Vaccines administered (CVX)'),
   ('141','Influenza, seasonal, injectable','Vaccines administered (CVX)'),
   ('140','Influenza, seasonal, injectable, preservative free','Vaccines administered (CVX)'),
   ('144','influenza, seasonal, intradermal, preservative free','Vaccines administered (CVX)'),
   ('194','Influenza, Southern Hemisphere','Vaccines administered (CVX)'),
   ('200','influenza, Southern Hemisphere, pediatric, preservative free','Vaccines administered (CVX)'),
   ('201','influenza, Southern Hemisphere, preservative free','Vaccines administered (CVX)'),
   ('202','influenza, Southern Hemisphere, quadrivalent, with preservative','Vaccines administered (CVX)'),
   ('15','influenza, split (incl. purified surface antigen)','Vaccines administered (CVX)'),
   ('168','influenza, trivalent, adjuvanted','Vaccines administered (CVX)'),
   ('88','influenza, unspecified formulation','Vaccines administered (CVX)'),
   ('16','influenza, whole','Vaccines administered (CVX)'),
   ('10','IPV','Vaccines administered (CVX)'),
   ('134','Japanese Encephalitis IM','Vaccines administered (CVX)'),
   ('39','Japanese encephalitis SC','Vaccines administered (CVX)'),
   ('129','Japanese Encephalitis, unspecified formulation','Vaccines administered (CVX)'),
   ('66','Lyme disease','Vaccines administered (CVX)'),
   ('04','M/R','Vaccines administered (CVX)'),
   ('05','measles','Vaccines administered (CVX)'),
   ('191','meningococcal A polysaccharide (non-US)','Vaccines administered (CVX)'),
   ('192','meningococcal AC polysaccharide (non-US)','Vaccines administered (CVX)'),
   ('108','meningococcal ACWY, unspecified formulation','Vaccines administered (CVX)'),
   ('163','meningococcal B, OMV','Vaccines administered (CVX)'),
   ('162','meningococcal B, recombinant','Vaccines administered (CVX)'),
   ('164','meningococcal B, unspecified','Vaccines administered (CVX)'),
   ('103','meningococcal C conjugate','Vaccines administered (CVX)'),
   ('148','Meningococcal C/Y-HIB PRP','Vaccines administered (CVX)'),
   ('147','meningococcal MCV4, unspecified formulation','Vaccines administered (CVX)'),
   ('136','Meningococcal MCV4O','Vaccines administered (CVX)'),
   ('114','meningococcal MCV4P','Vaccines administered (CVX)'),
   ('32','meningococcal MPSV4','Vaccines administered (CVX)'),
   ('167','meningococcal, unknown serogroups','Vaccines administered (CVX)'),
   ('03','MMR','Vaccines administered (CVX)'),
   ('94','MMRV','Vaccines administered (CVX)'),
   ('07','mumps','Vaccines administered (CVX)'),
   ('998','no vaccine administered','Vaccines administered (CVX)'),
   ('127','Novel influenza-H1N1-09','Vaccines administered (CVX)'),
   ('128','Novel Influenza-H1N1-09, all formulations','Vaccines administered (CVX)'),
   ('125','Novel Influenza-H1N1-09, nasal','Vaccines administered (CVX)'),
   ('126','Novel influenza-H1N1-09, preservative-free','Vaccines administered (CVX)'),
   ('02','OPV','Vaccines administered (CVX)'),
   ('179','OPV ,monovalent, unspecified','Vaccines administered (CVX)'),
   ('178','OPV bivalent','Vaccines administered (CVX)'),
   ('182','OPV, Unspecified','Vaccines administered (CVX)'),
   ('OTH','other','NullFlavor'),
   ('69','parainfluenza-3','Vaccines administered (CVX)'),
   ('177','PCV10','Vaccines administered (CVX)'),
   ('11','pertussis','Vaccines administered (CVX)'),
   ('23','plague','Vaccines administered (CVX)'),
   ('133','Pneumococcal conjugate PCV 13','Vaccines administered (CVX)'),
   ('100','pneumococcal conjugate PCV 7','Vaccines administered (CVX)'),
   ('152','Pneumococcal Conjugate, unspecified formulation','Vaccines administered (CVX)'),
   ('33','pneumococcal polysaccharide PPV23','Vaccines administered (CVX)'),
   ('109','pneumococcal, unspecified formulation','Vaccines administered (CVX)'),
   ('89','polio, unspecified formulation','Vaccines administered (CVX)'),
   ('175','Rabies - IM Diploid cell culture','Vaccines administered (CVX)'),
   ('176','Rabies - IM fibroblast culture','Vaccines administered (CVX)'),
   ('40','rabies, intradermal injection','Vaccines administered (CVX)'),
   ('90','rabies, unspecified formulation','Vaccines administered (CVX)'),
   ('159','Rho(D) - Unspecified formulation','Vaccines administered (CVX)'),
   ('157','Rho(D) -IG IM','Vaccines administered (CVX)'),
   ('156','Rho(D)-IG','Vaccines administered (CVX)'),
   ('34','RIG','Vaccines administered (CVX)'),
   ('71','RSV-IGIV','Vaccines administered (CVX)'),
   ('93','RSV-MAb','Vaccines administered (CVX)'),
   ('06','rubella','Vaccines administered (CVX)'),
   ('38','rubella/mumps','Vaccines administered (CVX)'),
   ('213','SARS-COV-2 (COVID-19) vaccine, UNSPECIFIED','Vaccines administered (CVX)'),
   ('514','SARS-COV-2 COVID-19 DNA Non-US Vaccine (Zydus Cadila, ZyCoV-D)','Vaccines administered (CVX)'),
   ('513','SARS-COV-2 COVID-19 PS Non-US Vaccine (Anhui Zhifei Longcom, Zifivax)','Vaccines administered (CVX)'),
   ('517','SARS-COV-2 COVID-19 PS Non-US Vaccine (Biological E Limited, Corbevax)','Vaccines administered (CVX)'),
   ('515','SARS-COV-2 COVID-19 PS Non-US Vaccine (Medigen, MVC-COV1901)','Vaccines administered (CVX)'),
   ('512','SARS-COV-2 COVID-19 VLP Non-US Vaccine (Medicago, Covifenz)','Vaccines administered (CVX)'),
   ('76','Staphylococcus bacterio lysate','Vaccines administered (CVX)'),
   ('138','Td (adult)','Vaccines administered (CVX)'),
   ('09','Td (adult), 2 Lf tetanus toxoid, preservative free, adsorbed','Vaccines administered (CVX)'),
   ('113','Td (adult), 5 Lf tetanus toxoid, preservative free, adsorbed','Vaccines administered (CVX)'),
   ('139','Td(adult) unspecified formulation','Vaccines administered (CVX)'),
   ('196','Td, adsorbed, preservative free, adult use, Lf unspecified','Vaccines administered (CVX)'),
   ('115','Tdap','Vaccines administered (CVX)'),
   ('180','tetanus immune globulin','Vaccines administered (CVX)'),
   ('35','tetanus toxoid, adsorbed','Vaccines administered (CVX)'),
   ('142','tetanus toxoid, not adsorbed','Vaccines administered (CVX)'),
   ('112','tetanus toxoid, unspecified formulation','Vaccines administered (CVX)'),
   ('77','tick-borne encephalitis','Vaccines administered (CVX)'),
   ('13','TIG','Vaccines administered (CVX)'),
   ('78','tularemia vaccine','Vaccines administered (CVX)'),
   ('190','Typhoid conjugate vaccine (TCV)','Vaccines administered (CVX)'),
   ('25','typhoid, oral','Vaccines administered (CVX)'),
   ('41','typhoid, parenteral','Vaccines administered (CVX)'),
   ('53','typhoid, parenteral, AKD (U.S. military)','Vaccines administered (CVX)'),
   ('91','typhoid, unspecified formulation','Vaccines administered (CVX)'),
   ('101','typhoid, ViCPs','Vaccines administered (CVX)'),
   ('999','unknown','Vaccines administered (CVX)'),
   ('75','vaccinia (smallpox)','Vaccines administered (CVX)'),
   ('105','vaccinia (smallpox) diluted','Vaccines administered (CVX)'),
   ('79','vaccinia immune globulin','Vaccines administered (CVX)'),
   ('206','Vaccinia, smallpox monkeypox vaccine live, PF','Vaccines administered (CVX)'),
   ('21','varicella','Vaccines administered (CVX)'),
   ('81','VEE, inactivated','Vaccines administered (CVX)'),
   ('80','VEE, live','Vaccines administered (CVX)'),
   ('92','VEE, unspecified formulation','Vaccines administered (CVX)'),
   ('36','VZIG','Vaccines administered (CVX)'),
   ('37','yellow fever','Vaccines administered (CVX)'),
   ('183','Yellow fever vaccine - alt','Vaccines administered (CVX)'),
   ('184','Yellow fever, unspecified formulation','Vaccines administered (CVX)')
GO

-- update this so we know where the code came from...
UPDATE [Clinical].[Vaccine_Type]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v12'
GO

-- NNDSS Event Code
INSERT INTO [Clinical].[Severity_Code] ([Code_ID], [Description], [CodeSet_Name], [Category_ID]) VALUES
   ('399166001','Fatal (qualifier value)','SNOMED-CT', 'TB'),
   ('434081000124108','Patient requires hospitalization (finding)','SNOMED-CT', 'TB')
GO

   -- update this so we know where the code came from...
UPDATE [Clinical].[Severity_Code]
   SET Data_Owner_ID = 'SNOMED-CT',
       Agency_Reporting_ID = 'SNOMED-CT',
       Version_Number = 'v1'
GO



