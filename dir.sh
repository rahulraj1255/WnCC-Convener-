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
		option[$l,$i]=$(echo """${option[$l,$i]}""")
		l=$((l+1))
	done
	read
	read answer[$i]
	answer[$i]=$(echo """${answer[$i]}""")
	i=$((i+1))
done
[ -d $current_dir ] && ( cd $current_dir ) &&( mkdir Treasure_Hunt)
cd Treasure_Hunt
working_dir="$current_dir/Treasure_Hunt"
i=1
while [ "${question[$i]}" != "" ]
do
	j=1
	if [ "$i" != "1" ] 
 	then
 		find * -maxdepth $((i-2)) -mindepth $((i-2)) -type d > output.txt
		while read p[$j]
		do
			j=$((j+1))
		done <output.txt
		j=$((j-1))
	else 
		p="."
		
	
	fi
	echo asd${p[1]}asds
	g=1
	while [[ $g<=$j ]]
	do
		p[$g]=$(echo """${p[$g]}""")
		cd "${p[$g]}" 
		l=0
		while [ $l -lt $option1 ] 
		do
		mkdir "${option[$l,$i]}"
		l=$((l+1))
		done
		echo ${question[$i]} > "q"$i
		cd $working_dir
		g=$((g+1))
	done
	i=$((i+1))
	rm output.txt
done
i=1
while [[ "${answer[$i]}" != "" ]]; do
	cd ./"${answer[$i]}"
	i=$((i+1))
done
echo "You Win!" > Win.txt
cd $working_dir
