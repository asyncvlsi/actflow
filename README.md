# The ACT flow for implementing asynchronous logic

This repository contains the key modules required to use the ACT implementation flow for asynchronous logic.
The parallel algorithms used in the implemention flow use a combination of OpenMP and the [Galois](https://github.com/IntelligentSoftwareSystems/Galois)
library. 

## Dependencies

The Galois library depends on the following:

* A modern C++ compiler compliant with the C++-17 standard (gcc >= 7, Intel >= 19.0.1, clang >= 7.0)
* CMake (>= 3.16)
* Boost library (>= 1.71.0, we recommend building/installing the full library)
* libllvm (>= 7.0 with RTTI support)
* libfmt (>= 4.0)

More details about optional features/etc. are [available](https://github.com/IntelligentSoftwareSystems/Galois).

The ACT library depends on the following:

* The system must have libedit installed. For the yum package manager, the package is called libedit-devel; for apt-get, it is libeditline-dev. Some systems have both packages. In that case please use libedit, not libeditline.
* The system should have zlib installed
* The system should have the macro pre-processing package m4 installed

The expression optimization library requires [yosys](https://github.com/YosysHQ/yosys) to be installed on your system.
While this does not impact building the flow, logic optimization launches the `yosys` executable and will fail if it cannot find the executable. 
The README provided by yosys has detailed installation instructions.


## Steps

1. Pick an installation directory for all the tools, and set the environment variable `ACT_HOME` to this directory. Create this directory.

2. Set the environment variable `LLVM_DIR` to the path to `LLVMConfig.cmake` in your LLVM installation.

3. Run `./build`

This should build and install all the libraries and tools needed.

If you'd like to delete all the files generated during the build process, run `./clean`

## References

If you use this flow for a publication, we would appreciate a citation to the following overview paper that summarizes the flow:

   * S. Ataei et al., "An Open-Source EDA Flow for Asynchronous Logic," in IEEE Design & Test, vol. 38, no. 2, pp. 27-37, April 2021, doi: 10.1109/MDAT.2021.3051334.
