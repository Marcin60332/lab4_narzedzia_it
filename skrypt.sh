#!/bin/bash
if [ "$1" == "--date" ]; then
	date

elif [ "$1" == "--logs" ]; then
	for ((i=1; i<=100; i++)); do
		filename="log${i}.txt"
		echo "Nazwa pliku:  $filename" > "$filename"
		echo "Skrypt: $0" >> "$filename"
		echo "Data: $(date)" >> "$filename"
	done
	echo "Utworzono 100 plików"
fi
