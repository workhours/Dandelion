#!/bin/sh
# this script is for exporting document from collection by specified query string
# check script syntax on: http://www.shellcheck.net/#

# usage:
# . ./export process
# . ./export process New*
# . ./export process "New Task"
# . ./export C39000
# . ./export C39000 57a83691e94ebb4e2061e3fe

# set -x
echo "Export $1 $2"	
if [ "$1" = "process" ]; then
	mongoexport -d AZDOC -c "$1" -o "$1".json -q "{ 'T33510.T33511.T33513' :{\$regex: '$2'} }" 
elif [ $# = 1 ]; then
	mongoexport -d AZDOC -c "$1" -o "$1".json
else 
	mongoexport -d AZDOC -c "$1" -o "$1".json -q "{ '_id' :{'\$oid': '$2' }}"
fi