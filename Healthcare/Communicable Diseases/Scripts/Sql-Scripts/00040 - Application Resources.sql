
-- Register well known issues
INSERT INTO [Application].[App_Message_Code]
   ([Code_Number], [Description], [Category_ID]) VALUES
   (-4003, 'Unknown Content Type', 'Submission'),
   (-3001, 'Failed Inserting Submission', 'Submission'),
   (-3002, 'Failed Updating Submission Count', 'Submission')
GO
