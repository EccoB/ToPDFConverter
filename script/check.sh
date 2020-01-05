#!/bin/bash
input="/input"
output="/output"

LANG="eng+deu" #replace with your language code
#MODUS switches OCR on/off for the pdf
if [ -z ${MODUS+x} ]; then 
	MODUS=1 
else 
	echo "MODUS is set to $MODUS"; 
fi


inotifywait -m $input -e create -e moved_to |
    while read path action file; do
        echo "The file '$file' appeared in directory '$path' via '$action'"
	sleep 2
	echo "convert '$input/$file' '$output/$file.pdf'"
	if [ "$MODUS" -eq "1" ]; then
		echo "Running OCR on $file"
		tesseract "$input/$file" "$output/$file" -l $LANG pdf || \
		( echo "Failed - wait 30s" && rm "$output/$file.pdf" && sleep 30 && tesseract "$input/$file" "$output/$file" -l $LANG pdf ) || \
		( echo "Failed - wait 30s" && rm "$output/$file.pdf" && sleep 30 && tesseract "$input/$file" "$output/$file" -l $LANG pdf )

	else
		convert "$input/$file" "$output/$file.pdf" || ( echo "Failed - wait 30s" && sleep 30 && convert "$input/$file" "$output/$file.pdf") ||  ( echo "Failed - wait 30s" && sleep 30 && convert "$input/$file" "$output/$file.pdf")
	fi
	#
    done
