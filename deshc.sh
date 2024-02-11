#!/bin/sh

bin_dir="$(dirname "$(readlink -f "$(which sh)")")"

for arg in $@; do
	if [ -f $arg ] || [ -f $bin_dir/$arg ]; then
		$arg >/dev/null 2>&1 &
		child=$!
		sleep 0.07

		kill -STOP $child
		cat /proc/$child/cmdline | sed 's/.*\(#!\)/\1/; $d' >$arg.dec.sh
		kill -TERM $child
	else
		echo "error: file $arg not found."
	fi
done
