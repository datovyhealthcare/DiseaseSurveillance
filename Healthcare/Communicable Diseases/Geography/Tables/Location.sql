CREATE TABLE [Geography].[Location] (
   [Location_ID]            VARCHAR(40) NOT NULL,
   [Alternate_ID]           VARCHAR(40) NULL,
   [Alternate_Type]         VARCHAR(20) NULL, 

   [Type_ID]                VARCHAR(30) NULL,
   [Name]                   VARCHAR(80) NULL,
   [Alias]                  VARCHAR(30) NULL,
   [Description]            VARCHAR(128) NULL,

   [Landmark_Text]          VARCHAR(128) NULL,
   [Address_Full_Text]      VARCHAR(128) NULL,

   [Address_Line_ID]        VARCHAR(40) NULL,
   [Address_Structured_ID]  VARCHAR(40) NULL,
  
   [City_Name]              VARCHAR(30) NULL,
   [State_Code]             VARCHAR(2) NULL,
   [Postal_Code]            VARCHAR(10) NULL,
   [Postal_Code_Extension]  VARCHAR(4) NULL,
   [Region_Code]            VARCHAR(10) NULL,
   [District_Code]          VARCHAR(30) NULL,
   [Country_Code]           VARCHAR(30) NULL,

   [Latitude]               DECIMAL(18, 7) NULL,
   [Longitude]              DECIMAL(18, 7) NULL,

   [Primary_Indicator]      CHAR(1) NULL,
   
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

   CONSTRAINT [pk_Location] PRIMARY KEY CLUSTERED ([Location_ID] ASC),
   CONSTRAINT [fk_Location_Type] FOREIGN KEY ([Type_ID])
      REFERENCES [Geography].[Location_Type]([Type_ID]),
   CONSTRAINT [fk_Location_Address_Line] FOREIGN KEY ([Address_Line_ID])
      REFERENCES [Geography].[Address_Line]([Address_Line_ID]),
   CONSTRAINT [fk_Location_Address_Structured] FOREIGN KEY ([Address_Structured_ID])
      REFERENCES [Geography].[Address_Structured]([Address_Structured_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Details about a geographical area or specific point in a geography',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'Location'
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Identify and describe a kind of location',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'Location', 
   @level2type = N'COLUMN',   @level2name = N'Type_ID';

