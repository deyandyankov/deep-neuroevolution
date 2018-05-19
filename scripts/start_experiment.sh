#!/bin/sh
master_instance=inst0
worker_instances="inst1 inst2 inst3 inst4 inst5 inst6 inst7 inst8 inst9 inst10 inst11 inst12 inst13 inst14 inst15 inst16"
algo="nsr-es"
configfile="configurations/frostbite_nsres.json"

ssh $master_instance "pkill -u `whoami`"
ssh -t $master_instance "cd deep-neuroevolution && git pull && . scripts/run_master.sh $algo $configfile"

for worker in $worker_instances; do
	ssh -t $worker "pkill -u `whoami`"
	ssh -t $worker "cd deep-neuroevolution && git pull && . scripts/run_worker.sh $algo"
done
