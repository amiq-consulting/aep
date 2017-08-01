# ******************************************************************************
# * (C) Copyright 2015 AMIQ Consulting SRL
# * All rights reserved.
# * NOTICE:  All information contained herein is, and remains
# * the property of AMIQ Consulting SRL and its suppliers,
# * if any.  The intellectual and technical concepts contained
# * herein are proprietary to AMIQ Consulting SRL
# * and its suppliers and may be covered by Romanian or U.S. and Foreign Patents,
# * patents in process, and are protected by trade secret or copyright law.
# * Dissemination of this information or reproduction of this material
# * is strictly forbidden unless prior written permission is obtained
# * from AMIQ Consulting SRL.
# * This file is part of Hardware Verification Course, created and delivered by AMIQ Consulting SRL.
# * The project can not be copied and/or distributed without the express
# * permission of AMIQ Consulting SRL.
# *******************************************************************************

# Setting the PROJ_HOME variable used to find out where the current project is stored
export PROJ_HOME=`pwd`/..

rm -rf INCA_libs waves.shm *.log

irun -f ${PROJ_HOME}/sim/ncsim_run.options -svseed $1


