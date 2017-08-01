#!/bin/bash

# Go to the root directory of the project
cd $(cd `dirname $0` && pwd)/.. && export PROJECT_HOME=`pwd`

DEFAULT_SEED=0
TEST_NAME=irq_gen_base_test
SEED=$DEFAULT_SEED

#argument seed
if [ $# -ge 1 ]
then
	if [ $1 == "rand" ]
	then
		SEED=$(($RANDOM * $RANDOM))
	else
		SEED=$1
	fi
fi

#argument test name
if [ $# -eq 2 ]
then
	TEST_NAME=$2
fi


# Remove the working directory and create a new one
rm -rf ./work && mkdir ./work && cd ./work

# Export the name of the top module
#export TOP_MODULE=$1

# Run the simulation
irun -f $PROJECT_HOME/scripts/run_ncsim.options +SVSEED=$SEED +UVM_TESTNAME=$TEST_NAME

# Exit if successful
if [[ $? == 0 ]]; then
    exit 0
fi

# Exit and return error code if unsuccessful
printf "\n\nSIMMULATION UNSUCCESSFUL\n\n\n"

exit $?
