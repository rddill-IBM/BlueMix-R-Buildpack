#!/bin/bash

# set in debug mode
# set -x
#

# display messages with yellow bars above and below
function topic() {
    YELLOW='\033[1;33m'
    RESET='\033[0m'
    echo -e "${YELLOW}===========================" | indent
    echo -e "${RESET}-----> $*" | indent
    echo -e "${YELLOW}===========================${RESET}" | indent
}

# indent displayed text
function indent() {
  c='s/^/       /'
  case $(uname) in
    Darwin) sed -l "$c";;
    *)      sed -u "$c";;
  esac
}

topic "setting paths"

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

# topic "remove symbolic links for conda in $HOME/miniconda/r_env/bin"
# pushd $HOME/miniconda/envs/r_env/bin
# rm -r conda
# rm -r activate
# rm -r deactivate
# popd
# topic "create new symbolic links for conda in $HOME/miniconda/envs/r_env/bin"
# ln -s $HOME/miniconda/bin/conda $HOME/miniconda/envs/r_env/bin
# ln -s $HOME/miniconda/bin/activate $HOME/miniconda/envs/r_env/bin
# ln -s $HOME/miniconda/bin/deactivate $HOME/miniconda/envs/r_env/bin
