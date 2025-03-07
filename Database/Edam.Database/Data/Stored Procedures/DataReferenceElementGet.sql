﻿
CREATE PROCEDURE Data.DataReferenceElementGet
   @SessionId       VARCHAR(40) = NULL,
   @OrganizationId  VARCHAR(20),
   @Root            VARCHAR(1024),
   @DomainUri       VARCHAR(2048)
AS
BEGIN
   SET NOCOUNT ON
   
   IF @Root is null
      SET @Root = ''
   IF @DomainUri is null
      SET @DomainUri = ''

   SELECT e.CreatedDate,
          e.LastUpdateDate,
          e.ReferenceDate,
          e.OrganizationId,
          e.DataOwnerId,
          e.ExpiredDate,
          e.AssetNo,
          e.Root,
          e.Domain,
          e.Type,
          e.Element,
          e.ElementNo,
          e.ParentNo,
          e.ElementId,
          e.TypeNo,
          e.ElementURI,
          e.ElementName,
          e.ElementType,
          e.ElementDataType,
          e.ElementPath,
          e.Description,
          e.ElementSequenceID,
          e.ElementTypeNo,
          e.ElementGroupNo,
          e.ElementConstraintNo,
          e.ElementKeyTypeNo,
          e.AutoGeneratedTypeNo,
          e.StatusNo,
          e.ValueTypeNo,
          e.MinLength,
          e.MaxLength,
          e.MinOccurrence,
          e.MaxOccurrence,
          e.Nillable,
          e.DefaultValue,
          e.FixedValue,
          e.SampleValue,
          e.PropertiesBagText,
          e.ProcessInstructionsBagText,
          e.SchemaText,
          e.OrdinalNo,
          e.SequenceId,
          e.VersionId,
          e.BatchId,
          e.UpdateSessionId,
          e.RecordStatusCode,
          e.ConstraintsText,
          e.KindNo,
          e.Tags,
          e.Guid
     FROM Data.DataElement e
     JOIN Data.DataDomain d
       ON e.DomainNo = d.DomainNo
    WHERE e.OrganizationId = @OrganizationId
      AND (@Root = ''
       OR  e.Root = @Root)
      AND (@DomainUri = ''
       OR  d.DomainUri like '%' + @DomainUri + '%')
END
