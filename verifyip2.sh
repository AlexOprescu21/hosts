#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <fisier_hosts>"
    exit 1
fi

HOSTS_FILE="$1"

if [ ! -f "$HOSTS_FILE" ]; then
    echo "Fișierul $HOSTS_FILE nu există!"
    exit 2
fi

while read IP NAME; do

    REAL=$(nslookup "$NAME" 2>/dev/null | grep "addres:" | tail -1 | cut -d' ' -f2)

    if [ "REAL"!="$IP" ]; then
    echo "$NAME in \$HOME/etc/hosts !"
    fi
done < "$HOME/etc/hosts"