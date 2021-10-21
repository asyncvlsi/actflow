# The ACT flow for implementing asynchronous logic

This repository contains the key modules required to use the ACT implementation flow for asynchronous logic.
The parallel algorithms used in the implemention flow use a combination of OpenMP and the [Galois](https://github.com/IntelligentSoftwareSystems/Galois)
library. 

## Dependencies

The Galois library depends on the following:

* A modern C++ compiler compliant with the C++-17 standard (gcc >= 7, Intel >= 19.0.1, clang >= 7.0)
* CMake (>= 3.13)
* Boost library (>= 1.71.0, we recommend building/installing the full library)
* libllvm (>= 7.0 with RTTI support)
* libfmt (>= 4.0)

More details about optional features/etc. are [available]((https://github.com/IntelligentSoftwareSystems/Galois).

The ACT library depends on the following:

* The system must have libedit installed. For the yum package manager, the package is called libedit-devel; for apt-get, it is libeditline-dev. Some systems have both packages. In that case please use libedit, not libeditline.
* The system should have zlib installed
* The system should have the macro pre-processing package m4 installed


## Steps

1. Pick an installation directory for all the tools, and set the environment variable `ACT_HOME` to this directory.

2. Set the environment variable `LLVM_DIR` to the path to `LLVMConfig.cmake` in your LLVM installation.

3. Run `./build`

This should build and install all the libraries and tools needed.
