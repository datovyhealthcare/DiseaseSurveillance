
-- The following is the "Initialization Session ID".  Keep it.
-- SELECT cast(newid() as VARCHAR(40))
-- Initialization GUID = 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67'
INSERT INTO [Application].[Session] (
   [Session_ID], [Session_Type_ID])
   SELECT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67', 'INITIALIZATION'
GO

-- Add Minimal Data to Initialize the Database
INSERT INTO [Entity].[Organization_Type] (
   [Type_ID], [Description], [Category_ID]  ) VALUES
   ('Corporation', 'Corporation', 'IT'),
   ('Community', 'Community', 'IT'),
   ('CDC', 'Center for Disease Control and Prevention', 'CDC')
GO

INSERT INTO [Entity].[Organization] (
   [Organization_ID], [Type_ID], [URL], [Description]) VALUES
   ('Common', 'Community', null, 'The Local Healthcare Community'),
   ('Datovy', 'Corporation', 'http://www.datovy.com', 'Information Architecture Consultants')
GO
