#!/bin/sh

# this script is for exporting document from collection by specified query string

# usage:
# 	export.bat process
# 	export.bat process New*
# 	export.bat process "New Task"
# 	export.bat C39000
# 	export.bat C39000 57a83691e94ebb4e2061e3fe

set echo off
echo Export $1 $2
if ["$1"=="process"]; then
	mongoexport -d AZDOC -c $1 -o $1.json -q "{ 'T33510.T33511.T33513' :{$regex: '$2'} }" 
elif ["%2"==""]; then
	mongoexport -d AZDOC -c $1 -o $1.json
else 
	mongoexport -d AZDOC -c $1 -o $1.json -q "{ '_id' :{'$oid': '%2' }}"
fi