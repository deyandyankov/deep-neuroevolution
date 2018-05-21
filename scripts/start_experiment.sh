#!/bin/sh
master_instance=inst0
worker_instances="inst1 inst2 inst3 inst4 inst5 inst6 inst7 inst8"
algo="nsr-es"
configfile="configurations/frostbite_nsres.json"

echo "Killing all user processes on master..."
echo "Starting scripts/run_master.sh on master..."
ssh -t $master_instance "cd deep-neuroevolution && git pull && . scripts/run_master.sh $algo $configfile"
sleep 60

for worker in $worker_instances; do
	echo "Initiating ${worker}"
	ssh -t $worker "cd deep-neuroevolution && git pull && . scripts/run_worker.sh $algo" &
	sleep 180
done
