#!/bin/bash

# Go to the root directory of the project
cd $(cd `dirname $0` && pwd)/.. && export PROJECT_HOME=`pwd`

# Remove the working directory and create a new one
rm -rf ./work && mkdir ./work && cd ./work

# Compile the simulation
irun -f $PROJECT_HOME/scripts/irun.options +SVSEED=$1 +UVM_TESTNAME=$2 -c

# Exit if successful
if [[ $? == 0 ]]; then
    exit 0
fi

# Exit and return error code if unsuccessful
printf "\n\nCOMPILATION WITH IRUN WAS UNSUCCESSFUL!!!\n\n\n"

exit $?