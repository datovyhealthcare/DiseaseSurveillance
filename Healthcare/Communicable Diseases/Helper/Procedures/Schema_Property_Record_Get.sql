
CREATE FUNCTION [Helper].[Schema_Property_Record_Get] (
   @Schema_Name   VARCHAR(128),
   @Table_Name    VARCHAR(128),
   @Column_Name   VARCHAR(128),
   @Property_Name VARCHAR(128)
)
RETURNS @tbl TABLE (
   [Schema] VARCHAR(128),
   [Table]  VARCHAR(128),
   [Column] VARCHAR(128),
   [Property_Name] VARCHAR(128),
   [Property_Value] VARCHAR(3000))
AS
BEGIN
   IF (@Table_Name is not null and @Table_Name <> '') and
      (@Column_Name is not null and @Column_Name <> '')
      INSERT INTO @tbl ([Schema], [Table], [Column], [Property_Name], [Property_Value])
         SELECT S.name   [Schema], 
                O.name   [Table], 
                c.name   [Column], 
                ep.name  [Property_Name], 
                cast(ep.value as varchar(3000)) [Extended_Property]
           FROM sys.extended_properties ep
           JOIN sys.all_objects O 
             ON ep.major_id = O.object_id 
            AND (@Table_Name is null
             OR  @Table_Name = ''
             OR  o.name = @Table_Name)
           JOIN sys.schemas S 
             ON O.schema_id = S.schema_id
            AND S.Name = @Schema_Name
           JOIN sys.columns AS c 
             ON ep.major_id = c.object_id 
            AND ep.minor_id = c.column_id
            AND (@Column_Name is null
             OR  @Column_Name = ''
             OR  c.name = @Column_Name)
            AND ep.name = @Property_Name
   ELSE IF (@Table_Name is not null and @Table_Name <> '') and
           (@Column_Name is null or @Column_Name = '')
      INSERT INTO @tbl ([Schema], [Table], [Column], [Property_Name], [Property_Value])
         SELECT S.name   [Schema], 
                O.name   [Table], 
                ''       [Column],
                ep.name  [Property_Name], 
                cast(ep.value as varchar(3000)) [Extended_Property]
           FROM sys.extended_properties ep
           JOIN sys.all_objects O 
             ON ep.major_id = O.object_id 
            AND (@Table_Name is null
             OR  @Table_Name = ''
             OR  o.name = @Table_Name)
           JOIN sys.schemas S 
             ON O.schema_id = S.schema_id
            AND S.Name = @Schema_Name
            AND ep.name = @Property_Name
   RETURN
END
GO

/*
SELECT * FROM [Helper].[Schema_Property_Value_Get]('Action', 'Activity', '','MS_Description')
 */
