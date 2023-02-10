#!/bin/sh
#
# Check for c++, g++, clang++ on the system
#
#

final=none

clist="c++ g++ clang++"

for compiler in $clist $CXX
do
   cat > _tst.cc <<EOM
#include <omp.h>

int main (void)
{
  return 0;
}
EOM
   res=0
   $compiler -fopenmp -c _tst.cc >/dev/null 2>&1 || res=1
   if [ $res -eq 0 ]
   then
	final=$compiler
   fi
done

rm -f _tst.cc _tst.o

if [ "$final" = "none" ]
then
	echo "Could not find a C++ compiler that supports -fopenmp"
	echo "Please set environment variable CXX to a C++ compiler that does."
	echo "Note: modern LLVM and GNU compilers support this option; if you"
        echo "are on a Mac, installing LLVM using homebrew (brew install llvm)"
        echo "and setting CXX to be the path to the resulting clang++ should work."
	rm -f CXX_COMPILER
	exit 1
fi

echo $final > CXX_COMPILER

exit 0
