#!/usr/bin/env sh

# Example Usage:
# ./run.sh rake serve:devel

docker run\
  --env SSH_AUTH_SOCK=/ssh-agent\
  -v $SSH_AUTH_SOCK:/ssh-agent\
  -v "$(pwd)/workdir:/workdir:rw"\
  -v "$(pwd)/rosindex:/workdir/rosindex:rw"\
  --net=host\
  -p 4000:4000\
  -ti rosindex/rosindex\
  $@
