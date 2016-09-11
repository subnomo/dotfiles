#!/bin/bash

playlist=$1
outputdir=${2%/}

if [ ! -d $outputdir ]; then
	echo -e "Making folder $outputdir.\n"
	mkdir -p $outputdir
fi

declare -i lines=$(wc -l < $playlist)
declare -i songs=($lines-1)/2

for ((song = 1; song <= $songs; song++)); do
	songtitle="$(awk "NR==$song*2 {print}" $playlist | cut -d',' -f2)"
	echo -e "$song/$songs\tDownloading $songtitle"
	
	songlink="$(awk "NR==$song*2+1 {print}" $playlist)"

    if [ ! -f "$outputdir/$song $songtitle.mp3" ]; then
	    curl -o "$outputdir/$song $songtitle.mp3" -s $songlink
    fi
done

echo -e "\nAll songs downloaded."
