#!/bin/bash

# set in debug mode
# set -x
#
echo 'starting path definition for run time'
export PATH=$HOME/miniconda/envs/r_env/lib/R/bin:$HOME/miniconda/envs/r_env/bin:$HOME/miniconda/bin:$PATH
export LD_LIBRARY_PATH=$HOME/miniconda/envs/r_env/lib/R/lib:$HOME/miniconda/envs/r_env/lib:/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.45.x86_64/jre/lib/amd64/server
export R_DOC_DIR=$HOME/miniconda/envs/r_env/lib/R/doc
export R_HOME=$HOME/miniconda/envs/r_env/lib/R
export R_INCLUDE_DIR=$HOME/miniconda/envs/r_env/lib/R/include
export R_SHARE_DIR=$HOME/miniconda/envs/r_env/lib/R/share
export R_LIBS="$HOME/miniconda/envs/r_env/lib/R/library"
export R_LIBS_SITE=$R_LIBS
export R_LIBS_USER=$R_LIBS
export RHOME=$R_HOME
export R_PROFILE_D_TEST = ".profile test successful"
echo 'run time path definition complete.'
