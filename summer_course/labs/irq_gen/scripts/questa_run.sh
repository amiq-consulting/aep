#!/bin/bash

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

export PROJECT_HOME=~/git/consulting.interns/irq_gen

rm -rf work > /dev/null

vlib work

vlog -f $PROJECT_HOME/scripts/run_questa.options
vsim top +UVM_TESTNAME=$TEST_NAME -sv_seed $SEED
