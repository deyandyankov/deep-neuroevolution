#!/bin/sh
NAME=exp_`date "+%m_%d_%H_%M_%S"`
ALGO=$1
EXP_FILE=$2
tmux new -s $NAME -d
tmux send-keys -t $NAME '. scripts/local_env_setup.sh' C-m
tmux send-keys -t $NAME 'python -m es_distributed.main workers --master_host 192.168.0.23 --relay_socket_path /tmp/es_redis_relay.sock --algo '$ALGO' --num_workers 40' C-m
tmux a -t $NAME
