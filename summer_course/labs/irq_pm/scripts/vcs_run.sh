#!/bin/sh
curdir=`pwd`


cd $(cd `dirname $0` && pwd)/.. && export PROJECT_HOME=`pwd`

rm -rf ./work && mkdir ./work && cd ./work

vcs -full64 -ntb_opts uvm-1.1 +acc +vpi -timescale=1ns/1ps \
-cm line -debug -sverilog \
+incdir+${PROJECT_HOME}/ve/irq_pm/sv \
+incdir+${PROJECT_HOME}/ve/irq_pm/test \
+incdir+${PROJECT_HOME}/ve/tb \
${PROJECT_HOME}/rtl/*.v \
${PROJECT_HOME}/ve/irq_pm/sv/irq_pm_pkg.sv \
${PROJECT_HOME}/ve/irq_pm/test/irq_pm_test_pkg.sv \
${PROJECT_HOME}/ve/tb/*.v \
${PROJECT_HOME}/ve/tb/*.sv \
-top pattern_matcher_tb -R -gui
+libext+.sv +libext+.svh
