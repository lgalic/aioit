#!/bin/bash

rm -f 1.txt

for i in {1..100}
do
	if (( $i % 2 != 0))
	then
		echo $i >> 1.txt
	fi
done
