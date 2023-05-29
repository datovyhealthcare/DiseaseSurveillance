INSERT INTO [Generic].[Entity_Type] (
   [Type_ID], [Description]) VALUES
   ('List.SingleSelect', 'Single select List'),
   ('List.MultiSelect',  'Multi select List'),
   ('List.ToogleSwitch', 'Toogle Switch List'),
   ('CheckList',         'Check List')
GO

-- Prepare Parent Element Entity
INSERT INTO [Generic].[Entity] (
   [Entity_ID], [Entity_Type], [Description]) VALUES
   ('FollowUp', 'List.MultiSelect', 'FollowUp List')
GO

INSERT INTO [Generic].[Element] (
   [Entity_ID], [Sequence_No], [Element_ID], [Name]) VALUES
   ('FollowUp', 1, 'FU-001', 'New Requests for Information'),
   ('FollowUp', 2, 'FU-002', 'Active Cases'),
   ('FollowUp', 3, 'FU-003', 'Cases near completion'),
   ('FollowUp', 4, 'FU-004', 'Must Call or Follow-up Case or Person'),
   ('FollowUp', 5, 'FU-005', 'Case Closed in last 60 days')
GO
