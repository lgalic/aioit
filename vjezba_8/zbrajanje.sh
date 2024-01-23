#!/bin/bash

sum=0

while read -r broj
do
	if (( $broj % 3 == 0 ))
	then
		sum=$(expr $sum + $broj)
	fi
done < 1.txt

echo $sum
