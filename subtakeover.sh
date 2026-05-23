#!/bin/bash
trap exit SIGINT # Prevents infinite loops

if [ "$1" == "" ] # Usage example
then
	echo "SUBDOMAIN TAKEOVER"
	echo "USAGE: $0 WORDLIST DOMAIN"
	echo "Ex: $0 wordlist.txt example.com"
else
	for word in $(cat $1); 
	do
		host -t cname $word.$2 | grep "alias for";
	done
fi
