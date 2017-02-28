#!/bin/bash

# Get all container names
docker stats --no-stream --format "{{.Name}}" > containerNames.txt

while read containerName; do
	if [[ ${containerName} != *"-aws"* ]];then
    	./tailContainer.sh ${containerName} &
	fi
done < containerNames.txt

# Kill all spawned subprocesses on exit (Ctrl-C)
function handle_sigint()
{
    for proc in `jobs -p`
    do
        kill $proc
    done
}

trap handle_sigint SIGINT

wait

