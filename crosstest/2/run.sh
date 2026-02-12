#!/bin/sh

actsim -p test test_actsim_new.act > output 2>/dev/null <<EOF
get select.O.r
get select.O.a
EOF

if cmp output expected > /dev/null 2>&1
then
	rm output
	exit 0
else
	exit 1
fi
