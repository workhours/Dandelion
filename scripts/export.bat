@Rem this script is for exporting document from collection by specified query string
@Rem usage: export.bat process New*
@Rem usage: export.bat process "New Task"

@echo off
echo Export %1 %2
IF "%1"=="process" (mongoexport -d AZDOC -c %1 -o %1.json -q "{ 'T33510.T33511.T33513' :{$regex: '%~2'} }") ELSE (mongoexport -d AZDOC -c %1 -o %1.json)
