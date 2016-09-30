@Rem this script is for exporting document from collection by specified query string

@Rem usage: 
@Rem	export.bat process
@Rem 	export.bat process New*
@Rem 	export.bat process "New Task"
@Rem 	export.bat C39000
@Rem 	export.bat C39000 57a83691e94ebb4e2061e3fe

@echo off
echo Export %1 %2
IF "%1"=="process" (mongoexport -d AZDOC -c %1 -o %1.json -q "{ 'T33510.T33511.T33513' :{$regex: '%~2'} }") ELSE (if "%2"=="" (mongoexport -d AZDOC -c %1 -o %1.json) else (mongoexport -d AZDOC -c %1 -o %1.json -q "{ '_id' :{'$oid': '%2' }}"))
