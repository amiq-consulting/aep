#!/bin/sh


PROJECT_HOME=`pwd`/../

rm -rf ./work && mkdir ./work && cd ./work

vcs -full64 -ntb_opts uvm-1.1 +acc +vpi -timescale=1ns/1ps \ -cm line -debug -sverilog \
${PROJECT_HOME}/rtl/*.v \
${PROJECT_HOME}/ve/*.sv \
${PROJECT_HOME}/tb/*.sv \
+incdir+${PROJECT_HOME}/rtl \
+incdir+${PROJECT_HOME}/ve \
+incdir+${PROJECT_HOME}/tb \
-top top -R -gui \
+libext+.sv +libext+.svh
