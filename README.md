# The ACT flow for implementing asynchronous logic

This repository contains the key modules required to use the ACT implementation flow for asynchronous logic.
The parallel algorithms used in the implemention flow use a combination of OpenMP and the [Galois](https://github.com/IntelligentSoftwareSystems/Galois)
library. 

## Steps

1. Pick an installation directory for all the tools, and set the environment variable `$ACT_HOME` to this directory.

2. Build the `Galois` library and install it in `$ACT_HOME`. The `Galois` submodule has the latest release of Galois that has been tested with the ACT tools.
   * Please follow the instructions provided by the [Galois](https://github.com/IntelligentSoftwareSystems/Galois) repository to build and install the Galois library.
   * Use `-DCMAKE_INSTALL_PREFIX=$ACT_HOME` as part of the `cmake` command-line options during the build process. 
   * On some systems, the `Galois` library may be installed in `$ACT_HOME/lib32/` or `$ACT_HOME/lib64/`; if that is the case, please add a symbolic link
from `$ACT_HOME/lib/libgalois_shmem.a` to the appropriate `libgalois_shmem.a` on your system.

3. Run `./build`

This should build and install all the libraries and tools needed.
