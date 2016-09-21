#!/bin/sh

processDir=$(ls -l ./ |awk '/^d/ {print $NF}')
for dir in $processDir
do

    collectionJson=$(find ./$dir -name "*.json")

    for file in $collectionJson
	do
	   
	   mongoimport -d AZDOC -c $dir $file
	    
	done
done  