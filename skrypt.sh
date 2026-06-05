#!/bin/bash
if [ "$1" == "--date" ] || [ "$1" == "-d" ]; then
	date

elif [ "$1" == "--logs" ] || [ "$1" == "-l" ]; then
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
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
	echo "Dostępe opcje dla skryptu: "
	echo "Wyświetlanie dzisiejszej daty: '--date' lub '-d'"
	echo "Tworzy automatycznie 100 plików log: '--logs' lub '-l'"
	echo "Tworzy automatycznie podaną ilość plików log: '--logs N' lub '-l N'"
	echo "Wyświetla dostępne opcje skryptu: '--help' lub '-h'"

fi
