#!/bin/sh
NAME=exp_`date "+%m_%d_%H_%M_%S"`
ALGO=$1
tmux new -s redis -d
tmux send-keys -t redis 'redis-server redis_config/redis_master.conf' C-m
tmux split-window -t redis
tmux send-keys -t redis 'redis-server redis_config/redis_local_mirror.conf' C-m
tmux new -s $NAME -d
tmux send-keys -t $NAME '. scripts/local_env_setup.sh' C-m
tmux send-keys -t $NAME "MKL_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python -m es_distributed.main workers --master_host 192.168.0.34 --relay_socket_path /tmp/es_redis_relay.sock --algo $ALGO --num_workers 1" C-m
