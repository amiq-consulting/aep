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
 
 1. Implement packet classes: see sv/ex_packet.svh

 2. Implement the interface: see sv/ex_intf.svh

 3. Create a top module: see sv/ex_top.svh
    - include the source files
    - contains a clock generator
    - contains two instances of the interface (driver_if and monitor_if) which are connected to clk, reset and other wires
    - contains 3 instances of the packet: packet, command packet and frame packet
    
 4. Start a simulation: create and print the 3 packets in an 'initial begin...end' statement

 5. Implement a method that checks the pack/unpack methods
 
 
 
 
                        ___________                          ___________
                       |           |__________sop___________|           |
                       |           |__________eop___________|           |
                       |   Driver  |__________vld___________|  Monitor  |
                       | Interface |__________data__________| Interface |
                       |           |__________err___________|           |
                       |           |                        |           |
                       |           |                        |           |
                       |           |                        |           |
                       |           |                        |           |
               +------o|           |                +------o|           |
               |   +---|>__________|                |   +---|>__________|
               |   |                                |   |
       rst_n---+---|--------------------------------+   |
        clk -------+------------------------------------+
              
6. Run a simulation to check that pack/unpack works correctly
    
