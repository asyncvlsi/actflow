# This folder contains the test excecuters for the individual components

2 types of tests are run:

## dynamic linker tests
the linker tests are checking if the binary or shared library exsits and if it can load all required libraries.
as we are heavyly reling on relative RPATH linking $ORIGIN/../lib and not Full path (which is exsiting as a fall back in some binaries)
to test this the packaging test will move the $ACT_HOME to a new path and activly break all hardcoded pathes combined with testing on almost bare OSes that ensures that linking is sucessfully using the relativ RPATH.

if everything is fine the test will report `found <binary/sharedlibrary>`

the `test_helper.sh` provides the generic linker test functions

## test suits of the subcomponents
if test suits exsits that test the functionality of the componentes they are also excecuted, some test like dynamic binary loading are patched to use pre build test binaries moved to $ACT_HOME by the packaging skripts.