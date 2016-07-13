#!/bin/bash

GCC_VERSION="4.9"

export R_HOME=/app/vendor/R
export R_INCLUDE=$R_HOME/lib64/R/include
export PATH=$R_HOME/bin:/app/vendor/gcc/bin:$PATH
export LD_LIBRARY_PATH=".$R_HOME/lib:/lib:/usr/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH=".$R_HOME/lib:/lib:/usr/lib:$LD_LIBRARY_PATH"
