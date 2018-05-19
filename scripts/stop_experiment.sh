#!/bin/sh
master_instance=inst0
worker_instances="inst1 inst2 inst3 inst4 inst5 inst6 inst7 inst8 inst9 inst10 inst11 inst12 inst13 inst14 inst15 inst16"

ssh $master_instance "pkill -u `whoami`"

for worker in $worker_instances; do
	ssh -t $worker "pkill -u `whoami`"
done
