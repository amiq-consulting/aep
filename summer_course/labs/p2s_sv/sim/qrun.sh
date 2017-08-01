#!/bin/sh

export PROJ_HOME=`pwd`/..
export RTL_SRC=$PROJ_HOME/rtl
export TB_SRC=$PROJ_HOME/tb

rm -rf work

vlib work
vlog -sv +incdir+$RTL_SRC ex_p2s.v
vlog -sv +incdir+$TB_SRC ex_top.sv

vsim -i work.ex_top &
