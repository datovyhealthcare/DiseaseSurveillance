/*
   The following is based on KnowTech Kif Registry:

   Element Items are the information provided by the user for a particular 
   element in the group or list.  It could be a range of dates (start - end), a
   start and end numeric value, a value as a text item, a just a check-mark or
   other.
--
   * The Element-ID points to the element template details, like the text to be
     displayed (see Label_Text).
   * The Type is used to know what UI item to present and what to expect.
   * The Order identify the position of the item in the group or list.
--
   Note that the "Entity_ID" points to the reference data object whose values 
   are related too... you need to programatically relate those,
   no FK is available so far linking the value to another parent table.
 */

CREATE TABLE [Generic].[Element_Value]
(
   [Element_Value_ID]      VARCHAR(40) NOT NULL,

   [Element_ID]            VARCHAR(40) NOT NULL,
   [Type_ID]               VARCHAR(30) NOT NULL,
   [Sequence_No]           INT NULL,

   [Reference_Date]        DATE NULL,
   [Reference_Time]        TIME NULL,

   -- answered value relate to the following entity...
   [Entity_Type_ID]        VARCHAR(30) NOT NULL,
   [Entity_ID]             VARCHAR(40) NOT NULL,

   -- item values
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

   CONSTRAINT [pk_Element_Value] PRIMARY KEY CLUSTERED ([Element_Value_ID] ASC),
   CONSTRAINT [fk_Element_Value_Element] FOREIGN KEY ([Element_ID])
      REFERENCES [Generic].[Element] ([Element_ID]),
   CONSTRAINT [fk_Element_Value_ID] FOREIGN KEY ([Type_ID])
      REFERENCES [Generic].[Element_Value_Type] ([Type_ID]),
   CONSTRAINT [fk_Element_Value_Entity] FOREIGN KEY ([Entity_Type_ID])
      REFERENCES [Entity].[Entity_Type] ([Type_ID])
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'A instance of an Element and provided value',
   @level0type = N'SCHEMA',   @level0name = N'Generic', 
   @level1type = N'TABLE',    @level1name = N'Element_Value'
GO

