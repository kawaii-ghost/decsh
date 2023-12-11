#!/bin/sh
for arg in $@
do
  $arg > /dev/null & child=$!
  prlimit --pid $child --nofile=0:
  kill -STOP $child
  head -n 1 /proc/$child/cmdline | sed 's/.*\(#!\)/\1/; $d' > $arg.dec.sh
  kill -TERM $child
done
