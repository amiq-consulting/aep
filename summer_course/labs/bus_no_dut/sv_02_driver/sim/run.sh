#!/bin/sh


# Setting the PROJ_HOME variable used to find out where the current project is stored
export PROJ_HOME=`pwd`/..

irun -f ${PROJ_HOME}/sim/run.options -svseed $1


