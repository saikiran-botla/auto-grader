#!/bin/bash

if [ $# != 2 ]; then
	echo "Usage: bash download.sh <link to directory> <cut-dirs argument>"
	exit 1
fi

wget  -q -np -nH --cut-dirs 2 -R index.html,index.html.tmp -r $1  

for var in $(ls -d */)
do
	mv $var mock_grading
done
