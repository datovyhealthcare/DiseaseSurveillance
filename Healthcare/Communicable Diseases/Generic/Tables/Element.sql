/*
   The following is based on KnowTech Kif Registry:

   This may be:
      - a List of Tasks to complete...
      - a Check-List things to collect, follow-up or other
      - a collection of flags
--
   Example: if the Type is Qualification-Check-List and this check-list has 10
          : elements to be qualified you must list those in order (use the
          : sequence-no column to specify the order)
--
   Example: if the Type is Income-Bracket-Check-Box-List and there are 6
          : income-backets to be considered then create an element entry per each
 */

CREATE TABLE [Generic].[Element]
(
   [Element_ID]            VARCHAR(40) NOT NULL,
   [Group_ID]              VARCHAR(40) NOT NULL,
   [Label_Text]            VARCHAR(128),

   [Sequence_No]           INT NULL,
   [Period_To_Comply]      VARCHAR(30) NULL DEFAULT('P0Y0M0DT0H0M0S'),
   [Required_Code_ID]      VARCHAR(30) NULL,
   [Value_Type_ID]         VARCHAR(30) NULL,

   -- identify the code set that supports the value (if any)
   [Code_Type_ID]          VARCHAR(30) NULL,

   -- default values, or valid range details
   [Checked]               BIT,
   [Start_Date]            DATE,
   [End_Date]              DATE,
   [Start_Value]           DECIMAL,
   [End_Value]             DECIMAL,
   [Value_Numeric]         DECIMAL,
   [Value_Text]            VARCHAR(128),

   -- record management
   [Tenant_ID]             VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]         VARCHAR(40) NULL DEFAULT 'COMMON',
   [Agency_Reporting_ID]   VARCHAR(40) NULL,
   [Sequence_Number]       INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]        VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]      DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID] CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]    VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Element] PRIMARY KEY CLUSTERED ([Element_ID] ASC),
   CONSTRAINT [fk_Element_Type] FOREIGN KEY ([Group_ID])
      REFERENCES [Generic].[Entity]([Entity_ID]),
   CONSTRAINT [fk_Element_Value_Type] FOREIGN KEY ([Value_Type_ID])
      REFERENCES [Generic].[Element_Value_Type] ([Type_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A description of an element and its value that will be a child of an Entity',
   @level0type = N'SCHEMA',   @level0name = N'Generic', 
   @level1type = N'TABLE',    @level1name = N'Element'
GO
