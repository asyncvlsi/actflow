#!/bin/sh

#
# Prints some progress markers to prevent CI tools
# from marking the job as defunct.
#

check_echo=0
myecho()
{
  if [ $check_echo -eq 0 ]
  then
        check_echo=1
        count=`echo -n "" | wc -c | awk '{print $1}'`
        if [ $count -gt 0 ]
        then
                check_echo=2
        fi
  fi
  if [ $check_echo -eq 1 ]
  then
        echo -n "$@"
  else
        echo "$@\c"
  fi
}


file=$1
if [ $# -eq 2 ]
then
  threshold=$2
else
  threshold=10
fi

myecho > $file

nxt=0
num=0
count=0
while read n
do
	echo "$n" >> $file
	count=`expr $count + 1`
	if [ $count -eq $threshold ]
	then
		count=0
		num=`expr $num + 1`
		nxt=`expr $nxt + 1`
		myecho "${num}.."
		if [ $nxt -eq 10 ]
		then
			nxt=0
			echo
		fi
	fi
done
if [ $nxt -ne 0 ]
then
   echo
fi
