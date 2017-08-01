#!/bin/bash

export PROJECT_HOME=~/git/consulting.interns/irq_gen
irun -R -nclibdirname $PROJECT_HOME/work/INCA_libs +SVSEED=$1 +UVM_TESTNAME=$2

# Exit if successful
if [[ $? == 0 ]]; then
    exit 0
fi

# Exit and return error code if unsuccessful
printf "\n\nRUNNING WITH IRUN WAS UNSUCCESSFUL!!!\n\n\n"

exit $?
