
/*
-- The following is based on KnowTech Submission Registry:

	[Type_ID]           -- Content Type stating the kind/type of the message content.
	[Local_Type_ID]     -- Local (Native) Content Type. 
	[Regional_Type_ID]  -- Transformed Native to Community Type.
	[Description]       -- A description of the content kind/type or category.
	[Source_ID]         -- Source organization application system ID that do support this particular content type.
 */

CREATE TABLE [Message].[Content_Type]
(
	[Type_ID]               VARCHAR(30) NOT NULL,
	[Description]           VARCHAR(80) NOT NULL,
	[Local_Type_ID]         VARCHAR(30) NOT NULL,
	[Regional_Type_ID]      VARCHAR(30) NOT NULL,
	[Source_ID]             VARCHAR(40) NOT NULL,

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

   CONSTRAINT [pk_Content_Type] PRIMARY KEY CLUSTERED ([Type_ID] ASC)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Identify and describe a kind of content',
   @level0type = N'SCHEMA',   @level0name = N'Message', 
   @level1type = N'TABLE',    @level1name = N'Content_Type'
GO
