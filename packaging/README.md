# How to Package
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/bics-rug/yale-asyncvlsi-actflow/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/bics-rug/yale-asyncvlsi-actflow/tree/main)

## optional: get/build dependencies first from actflow-dependencies

download and extract the prebuild dependencies from https://github.com/bics-rug/actflow-dependencies/releases
and extract them into your `$ACT_HOME`

or build them from https://github.com/bics-rug/actflow-dependencies

## requirements:
if you build on an older OS your package is compatible with more target platforms, thats why the CI builds on centos7.2

you need gcc 9+, m4, make ... (see centos7_install_build_system.sh)

on centos7 just run centos7_install_build_system.sh toget your system ready

## environment variables

`$ACT_HOME` is pointing to the install path
`$EDA_SRC` is pointing to the folder containing the sources
`$VLSI_TOOLS_SRC` is pointing to the folder containing the act sources

on centos7 just `source packaging/centos7_ci_build_environment.sh` from the repository root to get them set up with act home in `/opt/act`.

## run the steps

for running all the packaging steps in order, simply execute on the root of the repo
`for script in packaging/0*.sh; do bash $script; done`
or run all the 00X-*****.sh script in assending order

### relation to the toplevel build/clear/test
the scripts in packaging actually run the top level sripts for you

## make a release permanent 

to make a release permanent add a tag eg v0.1 to the current git head, and after the CI build everything go to the release on github, edit the release and select the new tag to prevent overwriting, any release connected to the tag rowling will be overwriten on a sucessfull CI run.

# CI
## package build
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/bics-rug/yale-asyncvlsi-actflow/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/bics-rug/yale-asyncvlsi-actflow/tree/main)
[![CircleCI](https://dl.circleci.com/insights-snapshot/gh/bics-rug/yale-asyncvlsi-actflow/main/build/badge.svg?window=60d)](https://app.circleci.com/insights/github/bics-rug/yale-asyncvlsi-actflow/workflows/build/overview?branch=main&reporting-window=last-60-days&insights-snapshot=true)

## dependencies
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/bics-rug/actflow-dependencies/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/bics-rug/actflow-dependencies/tree/main)
[![CircleCI](https://dl.circleci.com/insights-snapshot/gh/bics-rug/actflow-dependencies/main/build/badge.svg?window=60d)](https://app.circleci.com/insights/github/bics-rug/actflow-dependencies/workflows/build/overview?branch=main&reporting-window=last-60-days&insights-snapshot=true)

