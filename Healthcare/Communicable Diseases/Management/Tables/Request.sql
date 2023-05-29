CREATE TABLE [Management].[Request]
(
   [Request_ID]             VARCHAR(40) NOT NULL,
   [Type_ID]                VARCHAR(30) NULL,
   [Alternate_ID]           VARCHAR(40) NULL,
   [Request_Date]           DATE NULL,
   [Service_Code_ID]        VARCHAR(30) NULL,

   [Case_ID]                VARCHAR(40) NULL,
   [Referral_ID]            VARCHAR(40) NULL,

   -- external reference ID
   [Provider_ID]            VARCHAR(40) NULL,
   [Activity_ID]            VARCHAR(40) NULL,
   [Item_ID]                VARCHAR(40) NULL,

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

   CONSTRAINT [pk_Request] PRIMARY KEY CLUSTERED ([Request_ID] ASC),
   CONSTRAINT [fk_Request_Case] FOREIGN KEY ([Case_ID]) 
      REFERENCES [Management].[Case] ([Case_ID]),
   CONSTRAINT [fk_Request_Referral_Type] FOREIGN KEY ([Type_ID]) 
      REFERENCES [Management].[Referral_Type] ([Type_ID]),
   CONSTRAINT [fk_Request_Service_Code] FOREIGN KEY ([Service_Code_ID]) 
      REFERENCES [Management].[Service_Code] ([Code_ID]),
   CONSTRAINT [fk_Request_Referral] FOREIGN KEY ([Request_ID])
      REFERENCES [Management].[Referral]([Referral_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Article) Item', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Request', 
   @level2type = N'COLUMN',   @level2name = N'Item_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Action) Activity', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Request', 
   @level2type = N'COLUMN',   @level2name = N'Activity_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'X_Reference', @value = 'External reference to (Provider) Provider', 
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Request', 
   @level2type = N'COLUMN',   @level2name = N'Provider_ID';
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A petition related to a recomendation to an activity, program, or product',
   @level0type = N'SCHEMA',   @level0name = N'Management', 
   @level1type = N'TABLE',    @level1name = N'Request'
GO

