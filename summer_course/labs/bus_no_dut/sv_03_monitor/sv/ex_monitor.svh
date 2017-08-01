/******************************************************************************
Copyright (c) 2004-2017, AMIQ Consulting srl. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
 *******************************************************************************/

`ifndef __ex_monitor
`define __ex_monitor

/***

   Create a new class called ex_monitor that contains: a virtual interface, a constructor, a packet instance 

   Implement tasks: 
 * monitor():
   - handles reset
   - recovers packets from the bus and prints them. 
   - This should end after `EX_NOF_PACKETS packets or after 1us.
 * constructor

   Check that code compiles and simulation can run.
 
   Instantiate the monitor in the top module. 
   Connect the monitor in the top module to the monitor_if.

   Check that code compiles and simulation can run.

   Add a coverage group containing items for the relevant features of the protocol.

   Check that code compiles and simulation can run.

   Visually check that recovered packets are identical to the driven ones. 

   Visually check that there is some coverage collected.

***/
    
`endif

