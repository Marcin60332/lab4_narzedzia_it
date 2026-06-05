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
	echo "Wyświetlanie dostępnych opcji skryptu: '--help' lub '-h'"
	echo "Wyświetlanie danuch autora: '--author' lub '-a'"
	echo "Inicjalizacja repozytorium i PATH: '--init'"
	echo "Tworzy automatycznie pliki błędów: '--error' lub '-e'"
	echo "Tworzy automatycznie podaną ilość błędów: '--error N' lub '-e N'"

elif [ "$1" == "--init" ]; then
    echo "Klonowanie repozytorium..."
    git clone https://github.com/Marcin60332/lab4_narzedzia_it.git
    
    echo "Ustawianie ścieżki w zmiennej PATH..."
    export PATH="$PATH:$(pwd)"
    echo "Bieżący katalog $(pwd) został dodany do PATH."

elif [ "$1" == "--error" ] || [ "$1" == "-e" ]; then
    count=100
    if [ -n "$2" ] && [[ "$2" =~ ^[0-9]+$ ]]; then
        count=$2
    fi

    for ((i=1; i<=count; i++)); do
        dir_name="error${i}"
        mkdir -p "$dir_name"
        
        filename="${dir_name}/error${i}.txt"
        
        echo "Nazwa pliku: error${i}.txt" > "$filename"
        echo "Skrypt: $0" >> "$filename"
        echo "Data: $(date)" >> "$filename"
    done
    echo "Utworzono $count plików error w odpowiednich katalogach"
elif [ "$1" == "--author" ] || [ "$1"  == "-a" ]; then
	echo "Autor skryptu: Marcin Kozanecki"
	echo "Nr indeksu: 60332"

fi
