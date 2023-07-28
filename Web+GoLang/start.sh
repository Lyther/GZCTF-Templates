#!/bin/sh

echo $GZCTF_FLAG > ./flag.txt
touch ./$GZCTF_FLAG

chmod 400 ./flag.txt && \
    chmod 400 ./$GZCTF_FLAG

export GZCTF_FLAG=not_flag
GZCTF_FLAG=not_flag

/go/app