	#!/bin/bash

DEFAULT_SEED=200

SEED=$DEFAULT_SEED

#uncomment next line for random seed
#SEED=$(date +%s)

#argument seed
if [ $# -eq 1 ]; then
	SEED=$1
fi

export PROJECT_HOME=~/git/consulting.interns/irq_pm

rm -rf work

vlib work

vlog -f run_questa.options
vsim pattern_matcher_tb +UVM_TESTNAME=irq_pm_random_test -sv_seed $SEED -do "waves.tcl"
