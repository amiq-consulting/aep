#!/bin/bash

export PROJECT_HOME=~/git/consulting.interns/irq_pm

irun -f $PROJECT_HOME/scripts/irun.options +SVSEED=$1 +UVM_TESTNAME=$2 -gui

# Exit if successful
if [[ $? == 0 ]]; then
    exit 0
fi

# Exit and return error code if unsuccessful
printf "\n\nRUNNING WITH IRUN WAS UNSUCCESSFUL!!!\n\n\n"

exit $?
