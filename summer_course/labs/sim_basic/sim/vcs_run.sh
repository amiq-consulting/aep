#!/bin/sh
curdir=`pwd`


export PROJECT_HOME=`pwd`/..


rm -rf *.log
rm -rf ./work && mkdir ./work && cd ./work

vcs -full64 +acc +vpi -timescale=1ns/1ps \
-cm line -debug -sverilog \
+incdir+${PROJECT_HOME}/rtl \
+incdir+${PROJECT_HOME}/tb \
${PROJECT_HOME}/rtl/*.v \
${PROJECT_HOME}/tb/ex_top.sv \
-top ex_top -R -gui
#+libext+.sv +libext+.svh