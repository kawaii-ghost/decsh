#!/bin/sh
for arg in $@
do
  $arg > /dev/null & child=$!
  sleep 0.01
  kill -STOP $child
  cat /proc/$child/cmdline | sed 's/.*\(#!\)/\1/; $d' > $arg.dec.sh
  kill -TERM $child
done
