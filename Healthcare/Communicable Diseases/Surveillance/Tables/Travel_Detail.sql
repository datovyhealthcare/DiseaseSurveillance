CREATE TABLE [Surveillance].[Travel_Detail] (
   [Travel_Detail_ID]       VARCHAR(40)  NOT NULL,
   [Travel_Parent_ID]       VARCHAR(40)  NULL,
   [Type_ID]                VARCHAR(20)  NULL,
   [Purpose_Code_ID]        VARCHAR(30)  NULL,

   -- external references
   [Case_ID]                VARCHAR(40)  NULL,
   [Subject_ID]             VARCHAR(40)  NULL,

   [Travel_Number]          VARCHAR(20)  NULL,

   -- reference to location census table
   [State_Code_ID]          VARCHAR(30)  NULL,
   [County_Code_ID]         VARCHAR(30)  NULL,
   [Country_Code_ID]        VARCHAR(30)  NULL,

   -- reference to a Location
   [Origin_ID]              VARCHAR(20)  NULL,
   [Destination_ID]         VARCHAR(20)  NULL,

   -- refence dates
   [Departure_DateTime]     DATETIMEOFFSET NULL,
   [Arrival_DateTime]       DATETIMEOFFSET NULL,

   -- record management
   [Tenant_ID]              VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]    VARCHAR(40) NULL,
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Travel_Detail] PRIMARY KEY CLUSTERED ([Travel_Detail_ID] ASC),
   CONSTRAINT [fk_Travel_Purpose_Code] FOREIGN KEY ([Purpose_Code_ID]) 
      REFERENCES [Surveillance].[Travel_Purpose_Code] ([Code_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Management) Case', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Travel_Detail', 
   @level2type = N'COLUMN',   @level2name = 'Case_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Surveillance', 
   @level1type = N'TABLE',    @level1name = N'Travel_Detail', 
   @level2type = N'COLUMN',   @level2name = 'Subject_ID'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A person travel details',
   @level0type = N'SCHEMA',   @level0name = N'Surveillance',
   @level1type = N'TABLE',    @level1name = N'Travel_Detail';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'By Air, By Train, By Ship',
   @level0type = N'SCHEMA',   @level0name = N'Surveillance',
   @level1type = N'TABLE',    @level1name = N'Travel_Detail',
   @level2type = N'COLUMN',   @level2name = 'Type_ID';
GO

