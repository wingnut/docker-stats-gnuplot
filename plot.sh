#!/bin/bash

metric="$1"

case "$metric" in
"CPU")
    col=2
    title="CPU in percent"
    ;;
"MEM")
    col=3
    title="MEM in percent out of a total of 1GB"
    ;;
*)
    echo "Usage: $0 [CPU|MEM]"
   	exit 1
    ;;
esac


# Get all container names
fileNames=""
for file in ./logs/*
do
    if [[ -f $file ]]; then
        fileNames="$fileNames$file "
    fi
done

echo ${fileNames}

gnuplot -e "fileNames='$fileNames'" -e "col=$col" -e "title='$title'" liveplot.gnu
