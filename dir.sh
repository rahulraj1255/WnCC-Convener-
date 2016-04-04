#!/bin/bash
#Program to create a Directory based treasure hunt
#Usage: dir.sh [No. of options] < [File containing input]
current_dir=~/Desktop       #You may change it to the directory where you want the Treasure_Hunt folder to be created
option1=$1
i=1
declare -A option
while read question[$i]
do
	l=0
	while [ $l -lt $option1 ] 
	do
		read option[$l,$i]
		l=$((l+1))
	done
	read
	read answer[$i]
	i=$((i+1))
done
[ -d $current_dir ] && ( cd $current_dir ) &&( mkdir Treasure_Hunt)
cd Treasure_Hunt
working_dir="$current_dir/Treasure_Hunt"
i=1
while [ "${question[$i]}" != "" ]
do
	if [ "$i" != "1" ] 
 	then
 		paths=$(find * -maxdepth $((i-2)) -mindepth $((i-2)) -type d)
	else 
		paths="."
	fi
	for p in $paths
	do
		cd $p 
		l=0
		while [ $l -lt $option1 ] 
		do
		mkdir ${option[$l,$i]}
		l=$((l+1))
		done
		echo ${question[$i]} > "q"$i
		cd $working_dir
	done
	i=$((i+1))
done
i=1
while [[ ${answer[$i]} != "" ]]; do
	cd ./${answer[$i]}
	i=$((i+1))
done
echo "You Win!" > Win.txt
cd $working_dir
