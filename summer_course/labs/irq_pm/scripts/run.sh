#!/bin/bash

# Go to the root directory of the project
cd $(cd `dirname $0` && pwd)/.. && export PROJECT_HOME=`pwd`

# Variables
Seed=$(date +%s)
# Seed=1447752629 # Uncomment this line for fixed seed

# Remove the working directory and create a new one
rm -rf ./work && mkdir ./work && cd ./work

# Run the simulation
irun -f $PROJECT_HOME/scripts/run.options +SVSEED=$Seed +UVM_TESTNAME=$1

# Exit if successful
if [[ $? == 0 ]]; then
    exit 0
fi

# Exit and return error code if unsuccessful
printf "\n\nSIMULATION UNSUCCESSFUL\n\n\n"



exit $?
