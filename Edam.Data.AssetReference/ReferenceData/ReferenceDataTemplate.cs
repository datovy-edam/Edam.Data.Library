using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Edam.Application;
using Edam.Data.AssetSchema;
using Edam.DataObjects.Models;
using Edam.DataObjects.ReferenceData;
using dataCodes = Edam.DataObjects.DataCodes;

namespace Edam.Data.AssetReference.ReferenceData;


public class ReferenceDataTemplate
{

   /// <summary>
   /// Prepare ElementInfo instance...
   /// </summary>
   /// <param name="title"></param>
   /// <param name="name"></param>
   /// <param name="description"></param>
   /// <returns></returns>
   public static ElementInfo PrepareGroupElement(
      string name, string title, string description = null)
   {
      ElementInfo iinfo = new ElementInfo();
      iinfo.Title = title == null ? String.Empty : title;
      iinfo.Description = description == null ? String.Empty : description;
      iinfo.Name = name == null ? String.Empty : name;
      iinfo.Type = ResourceType.Group;
      return iinfo;
   }

   /// <summary>
   /// Prepare Template using given asset data set.
   /// </summary>
   /// <param name="template">optional template instanse in where to add
   /// template information</param>
   /// <param name="asset"></param>
   /// <returns></returns>
   public static ReferenceDataTemplateBaseInfo FromAssetData(
      ReferenceDataTemplateBaseInfo template, AssetData asset)
   {
      List<dataCodes.DataGroupInfo> groups =
         new List<dataCodes.DataGroupInfo>();

      ReferenceDataTemplateBaseInfo tpl =
         template ?? new ReferenceDataTemplateBaseInfo();

      tpl.Metadata.OrganizationId = Session.OrganizationId;
      tpl.Metadata.TemplateName = asset.Name;
      tpl.Metadata.TemplateVersionId = "v1r0";
      tpl.Metadata.TemplateURI = asset.DefaultNamespace.UriText +
         "/refdata/" + asset.Name;

      ElementInfo? iinfo = null;

      foreach (var item in asset.Items)
      {
         // identify the group
         var grp = groups.Find((x) => x.GroupName == item.Domain);
         if (grp == null)
         {
            grp = new dataCodes.DataGroupInfo();
            grp.GroupName = item.Domain;
            grp.GroupNo = grp.Items.Count + 1;
            grp.Items.Add(item);
            groups.Add(grp);

            iinfo = PrepareGroupElement(
               String.Empty, item.Domain, Convert.ToTitleCase(item.Domain));

            tpl.Templates.Add(iinfo);
         }

         // register add template
         ElementNodeInfo? node = item.PropertiesBag == null ? null :
            item.PropertiesBag.AssetTemplateInstance as ElementNodeInfo;

         if (node == null)
         {
            continue;
         }

         iinfo.Items.Add(node);
      }
      return tpl;
   }

   public static ReferenceDataTemplateBaseInfo FromAssetData(
      List<AssetData> items)
   {
      ReferenceDataTemplateBaseInfo template =
         new ReferenceDataTemplateBaseInfo();
      foreach (var l in items)
      {
         FromAssetData(template, l);
      }
      return template;
   }

}
