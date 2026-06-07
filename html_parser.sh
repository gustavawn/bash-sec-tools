#!/bin/bash
trap exit SIGINT # Prevents infinite loops

if [ "$1" == "" ] # Usage example
then
	echo "HTML PARSER"
	echo "USAGE: $0 URL"
	echo "Ex: $0 www.example.com"
else
	echo "[+] SEARCHING SUBDOMAINS ON $1"
	echo -e "\n"

	echo "[+] SUBDOMAINS FOUND:"
	
	# Fetching HTML to stdout and parsing directly into a variable (no local files created)
	subdomains=$(wget -qO- $1 | grep href | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l")
	
	for url in $subdomains; do
		host $url | grep "has address";
	done
fi
