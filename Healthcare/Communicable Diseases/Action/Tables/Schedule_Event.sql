CREATE TABLE [Action].[Schedule_Event]
(
   [Schedule_Event_ID]      VARCHAR(40) NOT NULL,
   [Type_ID]                VARCHAR(30) NULL,

   [Activity_ID]            VARCHAR(40) NULL,
   [Disposition_ID]         VARCHAR(40)  NULL,

   [Name]                   VARCHAR(80)  NULL,
   [Description]            VARCHAR(256) NULL,

   [Priority_Code_ID]       VARCHAR(30)  NULL,
   [Reason_Code_ID]         VARCHAR(30)  NULL,

   [Scheduled_DateTime]     DATETIMEOFFSET NULL,
   [Started_DateTime]       DATETIMEOFFSET NULL,
   [Ended_DateTime]         DATETIMEOFFSET NULL,

   [Status_Code_ID]         VARCHAR(30) NULL,
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

   CONSTRAINT [pk_Schedule_Event] PRIMARY KEY ([Schedule_Event_ID]),
   CONSTRAINT [fk_Schedule_Event] FOREIGN KEY ([Type_ID])
      REFERENCES [Action].[Activity_Type]([Type_ID]),
   CONSTRAINT [fk_Event_Disposition] FOREIGN KEY ([Disposition_ID]) 
      REFERENCES [Action].[Disposition] ([Disposition_ID]),
   CONSTRAINT [fk_Event_Priority_Code] FOREIGN KEY ([Priority_Code_ID])
      REFERENCES [Action].[Priority_Code] ([Code_ID]),
   CONSTRAINT [fk_Event_Reason_Code] FOREIGN KEY ([Reason_Code_ID]) 
      REFERENCES [Action].[Reason_Code] ([Code_ID]),
   CONSTRAINT [fk_Schedule_Activity] FOREIGN KEY ([Activity_ID])
      REFERENCES [Action].[Activity]([Activity_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Define details about an action, activity or event that happend or is planned',
   @level0type = N'SCHEMA',   @level0name = N'Action', 
   @level1type = N'TABLE',    @level1name = N'Schedule_Event'
GO

