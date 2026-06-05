#!/bin/bash
if [ "$1" == "--date" ]; then
	date

elif [ "$1" == "--logs" ]; then
	count=100
	if [ -n "$2" ] && [[ "$2" =~ ^[0-9]+$ ]]; then
	count=$2
fi

	for ((i=1; i<=count; i++)); do
		filename="log${i}.txt"
		echo "Nazwa pliku:  $filename" > "$filename"
		echo "Skrypt: $0" >> "$filename"
		echo "Data: $(date)" >> "$filename"
	done
	echo "Utworzono $count plików"
fi
