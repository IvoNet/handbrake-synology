#!/bin/sh
find . -iname "*mkv" -print0 | while read -d $'\0' file
do
   m4v.sh "$file"
   test $? -gt 0 && break;
done