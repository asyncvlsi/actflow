#!/bin/sh

code=0
for ref in 0 1 2 3
do
	act-test -ref=${ref} -ep ref.act > o${ref}.act
	if cmp o${ref}.act expect${ref}.act > /dev/null 2>&1
	then
		rm o${ref}.act
	else
		code=1
	fi
done
exit $code
