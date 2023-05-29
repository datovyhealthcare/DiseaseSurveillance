CREATE PROCEDURE [Helper].[Comment_Column_Add]
   @SchemaName VARCHAR(128) = NULL,
   @TableName  VARCHAR(128) = NULL,
   @ColumnName VARCHAR(128) = NULL,
   @TagName    VARCHAR(128) = NULL,
   @ValueText  VARCHAR(4000) = NULL
AS
BEGIN
   IF @ValueText is null or @ValueText = ''
      RETURN 0

   IF @SchemaName is null or @SchemaName = ''
      SET @SchemaName = 'dbo'
   IF @TagName is null or @TagName = ''
      SET @TagName = 'MS_Description'

   --SELECT @SchemaName, @TableName, @ColumnName, @TagName, @ValueText

   IF @TableName is null or @TableName = ''
   BEGIN
      EXECUTE sp_addextendedproperty
         @name = @TagName,          @value = @ValueText,
         @level0type = N'SCHEMA',   @level0name = @SchemaName
   END
   ELSE
   IF @ColumnName is null or @ColumnName = ''
   BEGIN
      EXECUTE sp_addextendedproperty
         @name = @TagName,          @value = @ValueText,
         @level0type = N'SCHEMA',   @level0name = @SchemaName, 
         @level1type = N'TABLE',    @level1name = @TableName
   END
   ELSE
   BEGIN
      EXECUTE sp_addextendedproperty
         @name = @TagName,          @value = @ValueText,
         @level0type = N'SCHEMA',   @level0name = @SchemaName, 
         @level1type = N'TABLE',    @level1name = @TableName, 
         @level2type = N'COLUMN',   @level2name = @ColumnName
   END
END
GO

