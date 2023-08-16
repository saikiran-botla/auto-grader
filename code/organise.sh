#!/bin/bash

mkdir organised;
for var in $(cat ./mock_grading/roll_list)
do
	mkdir ./organised/$var
	for var1 in $(ls ./mock_grading/submissions)
	do
		if [[ $var1 == *$var* ]]; then
			cp ./mock_grading/submissions/$var1 ./organised/$var
		fi
	done
done