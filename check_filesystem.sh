#!/bin/sh
#
# Check for c++, g++, clang++ on the system
#
#

compiler=`cat CXX_COMPILER`

cat > _tst.cc <<EOM
#include <filesystem>

int main (void)
{
  std::filesystem::path tst {".."};
  return 0;
}
EOM
res=0
$compiler -std=c++17 _tst.cc >/dev/null 2>&1 || res=1
rm -f _tst.o a.out
if [ $res -ne 0 ]
then
   res=0
   $compiler -std=c++17 _tst.cc -lstdc++fs >/dev/tty 2>&1 || res=1
   if [ $res -ne 0 ]
   then
      echo "C++ compiler does not directly support std::filesystem."
      echo "Please set environment variable CXX to a C++ compiler that does."
      rm -f _tst.cc _tst.o a.out
      exit 1
   else
      echo "C++ compiler requires -lstdc++fs for std::filesystem"
      touch CXX_LIBFS
   fi
fi

rm -f _tst.cc _tst.o a.out
exit 0
