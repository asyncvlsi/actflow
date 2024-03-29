# The ACT flow for implementing asynchronous logic

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/asyncvlsi/actflow/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/asyncvlsi/actflow/tree/main)

This repository contains the key modules required to use the ACT implementation flow for asynchronous logic.
The parallel algorithms used in the implemention flow use a combination of OpenMP and the [Galois](https://github.com/IntelligentSoftwareSystems/Galois)
library.


## Dependencies

The Galois library depends on the following:

* A modern C++ compiler compliant with the C++-17 standard (gcc >= 7, Intel >= 19.0.1, clang >= 7.0)
* CMake (>= 3.16)
* Boost library (>= 1.71.0, we recommend building/installing the full library)
* libfmt (>= 4.0)

More details about optional features/etc. are [available](https://github.com/IntelligentSoftwareSystems/Galois).
Note that while the Galois library does depend on the LLVM compiler infrastructure, we are only using a small part
of the library so we have eliminated this dependency for actflow.

The ACT library depends on the following:

* The system must have libedit installed. For the yum package manager, the package is called libedit-devel; for apt-get, it is libeditline-dev. Some systems have both packages. In that case please use libedit, not libeditline.
* The system should have zlib installed
* The system should have the macro pre-processing package m4 installed

The expression optimization library uses the [abc](https://people.eecs.berkeley.edu/~alanmi/abc/) logic synthesis and verification library from Berkeley.
It can also use [yosys](https://github.com/YosysHQ/yosys), if the binary
is installed on your system.
The README provided by yosys has detailed installation instructions.

Your system may have an older version of the Boost libraries installed.
If you cannot update those and need to install a more modern version of
Boost in a different directory, then you can point the build process to
your new Boost library location by setting the `BOOST_ROOT` environment
variable to the new install directory.

## Steps

1. Pick an installation directory for all the tools, and set the environment variable `ACT_HOME` to this directory. Create this directory. 

2. Make sure you have all the submodules needed as well (`git submodule update --init --recursive`), if you didn't clone the repo with all the submodules.

3. Run `./build`

This should build and install all the libraries and tools needed.

If you'd like to delete all the files generated during the build process, run `./clean`

## References

If you use this flow for a publication, we would appreciate a citation to the following overview paper that summarizes the flow:

   * Samira Ataei, Wenmian Hua, Yihang Yang, Rajit Manohar, Yi-Shan Lu, Jiayuan He, Sepideh Maleki, Keshav Pingali, "An Open-Source EDA Flow for Asynchronous Logic," in IEEE Design & Test, vol. 38, no. 2, pp. 27-37, April 2021, doi: 10.1109/MDAT.2021.3051334.
