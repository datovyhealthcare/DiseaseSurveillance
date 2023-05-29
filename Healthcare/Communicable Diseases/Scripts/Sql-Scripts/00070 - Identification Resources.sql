
INSERT INTO Entity.Identification_Type (Type_ID, Description, Tags) VALUES
   ('ssn',                'Social Security Number', ''),
   ('license-driver-num', 'Driver License Number', ''),
   ('password-num',       'Passport Number', '')
GO

INSERT INTO Entity.Uri_Type (Type_ID, Description) VALUES
   ('person-email',   'Personal Email'),
   ('person-website', 'Personal Web Site'),
   ('work-email',     'Work Email')
GO

INSERT INTO Entity.Media_Type (Type_ID, Description) VALUES
   ('unknown',   'Not Defined')
GO

INSERT INTO Entity.Communication_Type (Type_ID, Description) VALUES
   ('home',      'Home Telephone Number'),
   ('work',      'Work Telephone Number'),
   ('mobile',    'Mobile Telephone Number'),
   ('emergency', 'Emergency Telephone Number'),
   ('pager',     'Pager Telephone Number'),
   ('text',      'Text Telephone Number (SMS)'),
   ('school',    'School Telephone Number'),
   ('custodian', 'Custodian Telephone Number'),
   ('facsimile', 'Fax Telephone Number'),
   ('other',     'Other Telephone Number (please specify)')
GO



