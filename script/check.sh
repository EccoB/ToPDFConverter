#!/bin/bash
input="/input"
output="/output"

inotifywait -m $input -e create -e moved_to |
    while read path action file; do
        echo "The file '$file' appeared in directory '$path' via '$action'"
	sleep 2
	echo "convert '$input/$file' '$output/$file.pdf'"
	convert "$input/$file" "$output/$file.pdf" || (sleep 30 && convert "$input/$file" "$output/$file.pdf")
    done
