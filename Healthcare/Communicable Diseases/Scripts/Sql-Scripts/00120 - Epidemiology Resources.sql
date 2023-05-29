

-- Laboratory Type - v1
INSERT INTO [Epidemiology].[Lab_Type] ([Type_ID], [Description], [CodeSet_Name]) VALUES
   ('PHC412','CDC laboratory','PHIN VS (CDC Local Coding System)'),
   ('PHC645','Commercial laboratory','PHIN VS (CDC Local Coding System)'),
   ('PHC1317','Hospital Laboratory','PHIN VS (CDC Local Coding System)'),
   ('OTH','other','NullFlavor'),
   ('PHC1318','Other Clinical Laboratory','PHIN VS (CDC Local Coding System)'),
   ('PHC643','Public health laboratory (state or local)','PHIN VS (CDC Local Coding System)'),
   ('UNK','Unknown','NullFlavor'),
   ('PHC1316','VPD Testing Laboratory','PHIN VS (CDC Local Coding System)')
GO

-- update this so we know where the code came from...
UPDATE [Epidemiology].[Lab_Type]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v1'
GO

-- Duration / Unit Code - CDC - v2
INSERT INTO [Epidemiology].[Unit_Code] ([Code_ID], [Description], [CodeSet_Name]) VALUES
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
UPDATE [Epidemiology].[Unit_Code]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v2'
GO

-- Specimen Type v11
INSERT INTO [Epidemiology].[Lab_Test_Type] ([Type_ID], [Description], [CodeSet_Name]) VALUES
   ('13921-2','MuV XXX Ql Cult','LOINC'),
   ('22418-8','MuV IgM Ser Ql','LOINC'),
   ('47532-7','MuV RNA XXX Ql PCR','LOINC'),
   ('6476-6','MuV IgG Ser Ql EIA','LOINC'),
   ('85807-6','MuV Gentyp XXX','LOINC'),
   ('LAB608','Other Test Type','PHIN Questions'),
   ('LAB609','Unknown Test Type','PHIN Questions'),
   ('LAB610','Arbovirus Serum PCR or NAT','PHIN Questions'),
   ('LAB611','Arbovirus CSF IgM','PHIN Questions'),
   ('LAB612','Arbovirus CSF PRNT','PHIN Questions'),
   ('LAB613','Arbovirus CSF PCR','PHIN Questions'),
   ('LAB618','Arbovirus Immunohistochemical Staining','PHIN Questions'),
   ('LAB621','Arbovirus IgM','PHIN Questions'),
   ('LAB622','Arbovirus PCR','PHIN Questions'),
   ('LAB623','Arbovirus PRNT','PHIN Questions'),
   ('LAB624','Arbovirus Serum IgM','PHIN Questions'),
   ('LAB625','Arbovirus Serum PRNT','PHIN Questions'),
   ('LAB633','Molecular typing','PHIN Questions'),
   ('LAB640','Mumps IgG Antibody (Acute)','PHIN Questions'),
   ('LAB641','Mumps IgG Antibody (Convalescent)','PHIN Questions'),
   ('LAB707','Unspecified Serology','PHIN Questions'),
   ('LAB721','Arboviral antigen  ','PHIN Questions')
GO

-- update this so we know where the code came from...
UPDATE [Epidemiology].[Lab_Test_Type]
   SET Data_Owner_ID = 'CDC',
       Category_ID = 'Other',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v11'
GO
UPDATE [Epidemiology].[Lab_Test_Type]
   SET Data_Owner_ID = 'CDC',
       Category_ID = 'Arbovirus',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v11'
 WHERE [Description] like 'Arbo%'
GO
UPDATE [Epidemiology].[Lab_Test_Type]
   SET Data_Owner_ID = 'CDC',
       Category_ID = 'Mumps',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v11'
 WHERE [Description] like 'Mu%'
GO

-- Specimen Type v6
INSERT INTO [Epidemiology].[Specimen_Type] ([Type_ID], [Description], [CodeSet_Name]) VALUES
   ('429951000124103','Bacterial isolate specimen (specimen)','SNOMED-CT'),
   ('119297000','Blood specimen (specimen)','SNOMED-CT'),
   ('309051001','Body fluid sample (specimen)','SNOMED-CT'),
   ('258607008','Bronchoalveolar lavage fluid sample (specimen)','SNOMED-CT'),
   ('258564008','Buccal smear sample (specimen)','SNOMED-CT'),
   ('PHC227','Buccal Swab','PHIN VS (CDC Local Coding System)'),
   ('122554006','Capillary blood specimen (specimen)','SNOMED-CT'),
   ('128306009','Cataract (morphologic abnormality)','SNOMED-CT'),
   ('258450006','Cerebrospinal fluid sample (specimen)','SNOMED-CT'),
   ('69640009','Crust (morphologic abnormality)','SNOMED-CT'),
   ('258566005','Deoxyribonucleic acid sample (specimen)','SNOMED-CT'),
   ('119294007','Dried blood specimen (specimen)','SNOMED-CT'),
   ('309049000','Lesion sample (specimen)','SNOMED-CT'),
   ('PHC228','Macular Scraping','PHIN VS (CDC Local Coding System)'),
   ('119303007','Microbial isolate specimen (specimen)','SNOMED-CT'),
   ('258411007','Nasopharyngeal aspirate (specimen)','SNOMED-CT'),
   ('258500001','Nasopharyngeal swab (specimen)','SNOMED-CT'),
   ('258467004','Nasopharyngeal washings (specimen)','SNOMED-CT'),
   ('448789008','Nucleic acid specimen (specimen)','SNOMED-CT'),
   ('441620008','Oral fluid specimen (specimen)','SNOMED-CT'),
   ('418932006','Oral swab (specimen)','SNOMED-CT'),
   ('119361006','Plasma specimen (specimen)','SNOMED-CT'),
   ('258603007','Respiratory sample (specimen)','SNOMED-CT'),
   ('441673008','Ribonucleic acid specimen (specimen)','SNOMED-CT'),
   ('119342007','Saliva specimen (specimen)','SNOMED-CT'),
   ('435541000124108','Scab specimen (specimen)','SNOMED-CT'),
   ('119364003','Serum specimen (specimen)','SNOMED-CT'),
   ('309068002','Skin lesion sample (specimen)','SNOMED-CT'),
   ('123038009','Specimen (specimen)','SNOMED-CT'),
   ('122609004','Specimen from lung obtained by bronchial washing procedure (specimen)','SNOMED-CT'),
   ('440674008','Specimen obtained by lavage (specimen)','SNOMED-CT'),
   ('119339001','Stool specimen (specimen)','SNOMED-CT'),
   ('257261003','Swab (specimen)','SNOMED-CT'),
   ('472862007','Swab from lesion of skin (specimen)','SNOMED-CT'),
   ('472901003','Swab from nasal sinus (specimen)','SNOMED-CT'),
   ('472875007','Swab from vesicle (specimen)','SNOMED-CT'),
   ('258529004','Throat swab (specimen)','SNOMED-CT'),
   ('119376003','Tissue specimen (specimen)','SNOMED-CT'),
   ('445297001','Swab of internal nose (specimen)','SNOMED-CT'),
   ('122575003','Urine specimen (specimen)','SNOMED-CT'),
   ('258482009','Vesicle fluid sample (specimen)','SNOMED-CT'),
   ('430751000124105','Viral isolate specimen (specimen)','SNOMED-CT'),
   ('UNK','unknown','NullFlavor'),
   ('OTH','other','NullFlavor')
GO

-- update this so we know where the code came from...
UPDATE [Epidemiology].[Specimen_Type]
   SET Data_Owner_ID = 'CDC',
       Agency_Reporting_ID = 'CDC',
       Version_Number = 'v6'
GO
