# actflow drop in install

contains all the actflow tools:

 ACT:
 - interact (with see back end)
 - act (act2v, adepend, aflat, atrace, ext2sp, pgen, prs2cells, prs2net, prs2sim, prsim, prspack, sv2act, act2v, techgen, test\_inlinepass, test\_statepass, tlint, tr2alint, v2act)
 - actsim (with/and xyce)
 - irsim (requires X11 and OpenGL)

 Front end:
 - chp2prs with expropt (incl yosys and abc)
 - dflowmap

 Back end:
 - lefdef
 - pwroute
 - triton route
 - sproute
 - phyDB
 - rect2lef
 - bipart
 - magic (requires X11 and OpenGL)
 - dali

 Libraries and technologies:
 - skywater 130 (technology)
 - stdlib (library)

it was verified to be working out of the box on the following 64bit systems, no additional dependencies:
 - CentOS/RHEL/Oracle Linux 7.2+
 - RHEL/RockyLinux/AlmaLinux/Oracle Linux 8
 - Debian 9/10/11
 - Ubuntu 16.04/18.04/20.04/22.04
 - OpenSUSE 15
 - Fedora 20/latest

should also work on other 64 bit systems with kernel 3.10+ (libc version) and GNU linker ld or compatible, also BSD OSes with an equiv libc/pthread/... versions (but not tested).

## install

download the latest release from https://github.com/asyncvlsi/actflow/releases and extract it with `tar -xpf actflow_package_<commit>_<date>.tar.gz`, move the act folder to you prefered install location and
just set in your shell (this is for bash, setenv works eqiv.)
```
export ACT_HOME=<path to extracted act folder>
export PATH=${ACT_HOME}/bin:${PATH}
export TERMINFO=${ACT_HOME}/share/terminfo
```
or execute in the folder you extracted the tar in, so the folder that than has a single new folder called act after extraction!
```
export ACT_HOME=$(pwd)/act
export PATH=${ACT_HOME}/bin:${PATH}
export TERMINFO=${ACT_HOME}/share/terminfo
```

and start working with it!

for the GUI applications you need X11 and libGLU installed.

## References

If you use this flow for a publication, we would appreciate a citation to the following overview paper that summarizes the flow:

   * S. Ataei, Wenmian Hua, Yihang Yang, Rajit Manohar, Yi-Shan Lu, Jiayuan He, Sepideh Maleki, Keshav Pingali, "An Open-Source EDA Flow for Asynchronous Logic," in IEEE Design & Test, vol. 38, no. 2, pp. 27-37, April 2021, doi: 10.1109/MDAT.2021.3051334.


## notes / trouble shooting: 
### nested folder in extraction (eg. interact not found)
some extraction tools create a folder with the name of the tar file around, you need to point $ACT_HOME to the `act` folder inside.

### shared object loading (eg. lib[...].so not found)
if you are on an OS that does not support loading of relativ path .so files (eg. you get lib[...].so not found), 
 - move the act folder to `/opt/act` as this is the fall back hardcoded install path,
 - or try setting `export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$ACT_HOME/lib`,  note that newer OSes ignore `LD_LIBRARY_PATH` setting during the start of the program.
      - if this does not help use `export LD_LIBRARY_PATH=$ACT_HOME/lib:${LD_LIBRARY_PATH}` this might break other programs in your OS.

### loading custom functions into act on runtime
for the custom function/lib loading during runtime in act and actsim, act looks at LD_LIBRARY_PATH, you need to set `export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:.:$ACT_HOME/lib` to load libs from your current folder and $ACT_HOME. This is covered by the dl test case in act.

## bugs or problems:

please file bugs and feature requests at https://github.com/asyncvlsi/actflow

## sources:

you can find the the sources of this build at https://github.com/asyncvlsi/actflow/releases/latest
in actflow_depencency_sources_<commit>_<date>.tar.gz and actflow_sources_<commit>_<date>.tar.gz

## documentation:

have a peek at the ACT online docs at https://avlsi.csl.yale.edu/act

# licenses

please find all the tool and dependency licenses in the license folder