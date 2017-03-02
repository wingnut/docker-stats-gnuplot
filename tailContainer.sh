#!/bin/bash

containerName="$1"
echo ${containerName}

while true; do
	echo $(date +%Y-%m-%dT%H:%M:%S),$(docker stats --no-stream --format "{{.CPUPerc}},{{.MemPerc}}" $containerName) | tr -d '%' >> ./logs/${containerName}.log
	sleep 5
done
