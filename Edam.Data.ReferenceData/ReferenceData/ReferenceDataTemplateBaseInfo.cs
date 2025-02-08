using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// -----------------------------------------------------------------------------
using Edam.DataObjects.Models;
using Edam.Serialization;
using Edam.Data.Asset;

namespace Edam.DataObjects.ReferenceData;


public class ReferenceDataTemplateMetadata
{
   public string OrganizationId { get; set; }
   public string TemplateName { get; set; }
   public string TemplateVersionId { get; set; }
   public string TemplateURI { get; set; }
}

public class ReferenceDataTemplateBaseInfo
{
   public ReferenceDataTemplateMetadata Metadata { get; set; }
   public List<ElementInfo> Templates { get; set; }

   /// <summary>
   /// Underlying Elements Group Item that is prepared to be binded to UI 
   /// Elements...
   /// </summary>
   public ElementGroupItem ElementGroupItem { get; set; }

   public ReferenceDataTemplateBaseInfo()
   {
      Templates = new List<ElementInfo>();
      Metadata = new ReferenceDataTemplateMetadata();
   }

   public static string ToJson(ReferenceDataTemplateBaseInfo template)
   {
      return JsonSerializer.Serialize(template);
   }

}
