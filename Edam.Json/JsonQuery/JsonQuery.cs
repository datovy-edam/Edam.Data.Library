using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

// -----------------------------------------------------------------------------
using Jsonata;
using Jsonata.Net.Native;
using Edam.Diagnostics;

namespace Edam.Json.JsonQuery
{

   public class JsonQuery
   {

      public static ResultsLog<string> Execute(string jsonData, string query)
      {
         ResultsLog<string> results = new ResultsLog<string>();
         try
         {
            JsonataQuery q = new JsonataQuery(query);
            results.Instance = q.Eval(jsonData);
            results.ResultValueObject = results.Instance;
            results.ReturnText = results.Instance;
            results.ReturnValue = (int)EventCode.Success;
            results.Succeeded();
         }
         catch(Exception ex)
         {
            results.Failed(ex);
            results.ReturnValue = (int)EventCode.Failed;
            results.Instance = null;
         }
         return results;
      }

   }

}
