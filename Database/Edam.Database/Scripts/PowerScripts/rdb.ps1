﻿param (
   [string] $inst = $null,
   [string] $dbnm = $null
)
write "$inst"

# Before Executing this script...
# - Consider changing the defaults found in the "Record Tracking" columns.

# Steps to Execute this Script...
# 0: Make sure that PowerShell Execution Policy = Unrestricted (see Set-ExecutionPolicy)
# 1: In the target database the "DbAdmin" account should be created
#    with "sysadmin" server role privileges.  Use "SQL Management 
#    Studio" to create this account (if needed).  Use the below password;
# 2: Open a PowerShell Move to the directory where "dbinit.ps1" is located;
# 3: Open a PowerShell app and execute the script as "./dbinit.ps1";
# *: You may like to reset the Execution Policy back to default...

# put fully qualified name (FQN) instead of the dot.
$sqlsvr = "."  
$db = "Edam.Database"

$userId = "DbAdmin"
$passWd = "#12!98z@l0k1t0!"

write "initialize database ($db) in ($sqlsvr)."
write "Initialize Database adding Objects Code Set data."
sqlcmd -S "$sqlsvr" -U $userId -P $passWd -d $db -i "../sql-scripts/00010 - Objects Resources.sql"

write "Initialize Database adding References Code Set data."
sqlcmd -S "$sqlsvr" -U $userId -P $passWd -d $db -i "../sql-scripts/00020 - Reference Resources.sql"

write "Initialize Database adding IdBase Code Set data."
sqlcmd -S "$sqlsvr" -U $userId -P $passWd -d $db -i "../sql-scripts/00030 - IdBase Resources.sql"

write "Initialize Database adding Data Registry Code Set data."
sqlcmd -S "$sqlsvr" -U $userId -P $passWd -d $db -i "../sql-scripts/00040 - Data Registry Resources.sql"

write "done."
