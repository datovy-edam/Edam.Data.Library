using System;
using System.Threading.Tasks;

// -----------------------------------------------------------------------------

namespace Edam.Data
{

   public interface ILocalDatabaseObject
   {
      string TableName { get; }
   }

   public interface ILocalDatabaseIdNoObject : ILocalDatabaseObject
   {
      int IdNo { get; set; }
   }

   public interface ILocalDatabaseIdObject : ILocalDatabaseObject
   {
      string Id { get; set; }
   }

}
