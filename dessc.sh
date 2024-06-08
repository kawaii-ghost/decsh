#!/bin/sh
for arg in $@
do
  $arg > /dev/null & child=$!
  sleep 0.03
  kill -STOP $child
  cat /proc/$child/fd/3 > $arg.dec.sh
  kill -TERM $child
done
