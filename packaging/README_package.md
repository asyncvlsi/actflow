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

it was verified to be working out of the box on the following systems, no additional dependencies:
 - CentOS/RHEL/Oracle Linux 7.2+
 - RHEL/RockyLinux/AlmaLinux/Oracle Linux 8
 - Debian 9/10/11
 - Ubuntu 16.04/18.04/20.04/22.04
 - OpenSUSE 15
 - Fedora 20/latest

should also work on other systems with kernel 3.10+ (libc version) and GNU linker ld or compatible, like BSD OSes (but not tested).

## install

download the latest release from https://github.com/bics-rug/yale-asyncvlsi-actflow/releases and extract it with `tar -xpf actflow_<commit>_<date>.tar.gz`, move the act folder to you prefered install location and
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

#### notes / trouble shooting: 
some extraction tools create a folder with the name of the tar file around, you need to point $ACT_HOME to the `act` folder inside.

if you are on an OS that does not support loading of relativ path .so files (eg. you get lib[...].so not found), move the act folder to `/opt/act` or try setting `export LD_LIBRARY_PATH=$ACT_HOME/lib:${LD_LIBRARY_PATH}` note that newer OSes ignore this setting during the start of the program.

for the custom function/lib loading during runtime, you need to set `export LD_LIBRARY_PATH=.:$ACT_HOME/lib:${LD_LIBRARY_PATH}` to load libs from your current folder and $ACT_HOME. This is covered by the dl test case in act.
## bugs or problems:

please file bugs and feature requests at https://github.com/asyncvlsi/actflow

## sources:

you can find the the sources of this build at https://github.com/asyncvlsi/actflow/releases/latest
in actflow_depencency_sources_<commit>_<date>.tar.gz and actflow_sources_<commit>_<date>.tar.gz

## documentation:

have a peek at the ACT online docs at https://avlsi.csl.yale.edu/act

# licenses

please find all the tool and dependency licenses in the license folder