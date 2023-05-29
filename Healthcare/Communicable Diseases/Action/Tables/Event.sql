CREATE TABLE [Action].[Event] (
   [Event_ID]               VARCHAR(40) NOT NULL,
   [Alternate_ID]           VARCHAR(40) NULL,
   [Activity_ID]            VARCHAR(40) NULL,
   [EventType_ID]           VARCHAR(20) NULL,
   [Description]            VARCHAR(256) NULL,

   -- external references
   [Organization_ID]        VARCHAR(40) NULL,
   [Person_ID]              VARCHAR(40) NULL,

   [Scheduled_DateTime]     DATETIMEOFFSET NULL,
   [Started_DateTime]       DATETIMEOFFSET NULL,
   [Ended_DateTime]         DATETIMEOFFSET NULL,
   
   [Status_Code_ID]         VARCHAR(30)  NULL,
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

   CONSTRAINT [pk_Event] PRIMARY KEY CLUSTERED ([Event_ID] ASC),
   CONSTRAINT [fk_Event_Activity] FOREIGN KEY ([Activity_ID])
      REFERENCES [Action].[Activity] ([Activity_ID])
);
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'An external reference to an (Entity) Organization', 
   @level0type = N'SCHEMA',   @level0name = N'Action',
   @level1type = N'TABLE',    @level1name = N'Event',
   @level2type = N'COLUMN',   @level2name = 'Organization_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'An external reference to an (Entity) Person', 
   @level0type = N'SCHEMA',   @level0name = N'Action',
   @level1type = N'TABLE',    @level1name = N'Event',
   @level2type = N'COLUMN',   @level2name = 'Person_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A instance of an action withing an activity, incident, or a process',
   @level0type = N'SCHEMA',   @level0name = N'Action', 
   @level1type = N'TABLE',    @level1name = N'Event'
GO
