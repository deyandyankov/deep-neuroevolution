#!/bin/sh
NAME=exp_`date "+%m_%d_%H_%M_%S"`
EXP_FILE=$2
tmux new -s redis -d
tmux send-keys -t redis 'redis-server redis_config/redis_master.conf' C-m
tmux split-window -t redis
tmux send-keys -t redis 'redis-server redis_config/redis_local_mirror.conf' C-m
tmux new -s $NAME -d
tmux send-keys -t $NAME '. scripts/local_env_setup.sh' C-m
tmux send-keys -t $NAME 'python -m es_distributed.main master --master_socket_path /tmp/es_redis_master.sock --log_dir 'log' --algo '$ALGO' --exp_file '"$EXP_FILE" C-m
