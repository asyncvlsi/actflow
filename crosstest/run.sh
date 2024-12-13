#!/bin/sh

echo
echo "************************************************************************"
echo "*             Testing across tools                                     *"
echo "************************************************************************"
echo

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


fail=0

myecho " "
num=0
count=0
lim=10
while [ -d ${count} ]
do
	num=`expr $num + 1`
        if [ $count -lt 10 ]
        then
	   myecho ".[0$count]"
        else
	   myecho ".[$count]"
        fi
        ok=1
	(cd $count && ./run.sh) || ok=0
	if [ $ok -eq 0 ]
	then
		echo 
		myecho "** FAILED TEST $count: stdout"
		fail=`expr $fail + 1`
		echo " **"
		myecho " "
		num=0
	fi
	count=`expr $count + 1`
        if [ $ok -eq 1 ]
        then
                if [ $num -eq $lim ]
                then
                        echo
                        myecho " "
                        num=0
                fi
        else
                echo " **"
                myecho " "
                num=0
        fi
done

if [ $num -ne 0 ]
then
	echo
fi


if [ $fail -ne 0 ]
then
	if [ $fail -eq 1 ]
	then
		echo "--- Summary: 1 test failed ---"
	else
		echo "--- Summary: $fail tests failed ---"
	fi
	exit 1
else
	echo
	echo "SUCCESS! All tests passed."
fi
echo
