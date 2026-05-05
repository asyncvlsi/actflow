#!/bin/sh

ACTTOOL=interact

if [ $# -eq 0 ]
then
	list=*.scr
else
	list="$@"
fi

if [ ! -d runs ]
then
	mkdir runs
fi

for i in $list
do
	$ACTTOOL $i > runs/$i.stdout 2> runs/$i.stderr
done
