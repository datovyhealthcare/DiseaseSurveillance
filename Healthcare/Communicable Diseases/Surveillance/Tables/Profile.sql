CREATE TABLE [Surveillance].[Profile] (
   [Profile_ID]             VARCHAR (40)  NOT NULL,
   [Profile_Type_ID]        VARCHAR (30)  NULL,
   [Profile_Name]           VARCHAR (80)  NULL,
   
   [Status_Code_ID]         VARCHAR (30) NULL,
   [Status_DateTime]        DATETIMEOFFSET NULL,

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
     
   CONSTRAINT [pk_Profile_Group] PRIMARY KEY CLUSTERED ([Profile_ID] ASC),
   CONSTRAINT [fk_Profile_ProfileType] FOREIGN KEY ([Profile_Type_ID]) 
      REFERENCES [Surveillance].[Profile_Type] ([Type_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Identify a group of conditions and circumstances that are common to an investigation of a disease, outbreak, or medical situation',
   @level0type = N'SCHEMA',   @level0name = N'Surveillance',
   @level1type = N'TABLE',    @level1name = N'Profile';
GO

