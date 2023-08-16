#!bin/bash
#evaluate.sh

touch marksheet.csv
touch distribution.txt
touch distribution1.txt

for var in $(ls ./organised)
do
	mkdir ./organised/$var/students_outputs
	for var1 in $(ls ./organised/$var/*.cpp)
	do
		marks=0
		timeout 5 g++ $var1 2>/dev/null
		for var2  in $(ls ./mock_grading/inputs)
		do
			output=${var2%.*}.out
			touch ./organised/$var/students_outputs/$output 
			timeout 5 ./a.out < ./mock_grading/inputs/$var2 > ./organised/$var/students_outputs/$output /dev/null |: 2>/dev/null
			if cmp -s ./organised/$var/students_outputs/$output ./mock_grading/outputs/$output; then	
				$((marks++)) 2>/dev/null
			fi
		done
		echo "$var  $marks" >> marksheet.csv
		echo "$marks " >> distribution1.txt
	done
done 
sort -r distribution1.txt > distribution.txt
rm distribution1.txt
