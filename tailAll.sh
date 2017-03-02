#!/bin/bash

# Get all container names
docker stats --no-stream --format "{{.Name}}" > containerNames.txt

while true; do
	# Collect docker stats output
	statsOutput=$(docker stats --no-stream --format "{{.Name}},{{.CPUPerc}},{{.MemPerc}}")
	statsDate=$(date +%Y-%m-%dT%H:%M:%S)

	while read containerName; do
		# Skip AWS system containers
		if [[ ${containerName} != *"-aws"* ]];then
	    	verboseRowStats=$(echo "${statsOutput}" | grep "${containerName}" | tr -d '%')
	    	# Remove first column from string
	    	stringToRemove="${containerName},"
	    	rowStats="${verboseRowStats/$stringToRemove/}"
	    	echo $statsDate,$rowStats >> ./logs/${containerName}.log
		fi
	done < containerNames.txt

	sleep 5
done



