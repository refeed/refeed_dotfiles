#!/bin/sh

while :
do
        read line
        echo "mystuff | $line" || exit 1
done

