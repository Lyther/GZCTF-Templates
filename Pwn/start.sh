#!/usr/bin/env bash

echo $GZCTF_FLAG > /home/ctf/flag.txt

chown -R root:ctf /home/ctf && \
    chmod -R 410 /home/ctf && \
    chmod 400 /home/ctf/flag.txt

export GZCTF_FLAG=not_flag
GZCTF_FLAG=not_flag

xinetd -dontfork