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

`timescale 1ns/1ns

// TODO: Include the source files

 /*
 
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
  */            
    
    
module ex_top();
 
 // TODO: declare reset, clock and interface specific signals
  
 // TODO: implement a clock generator
 // TODO: implement a simple reset generator: it drives one reset pulse / simulation
 
 // TODO: instantiate the ex_intf twice: driver_if and monitor_if 
 // TODO: connect them to clk, reset and other wires
 
 initial begin
    // TODO: declare 3 variables, one for each type of packet: packet, command packet and frame packet
    // TODO: implement a method to verify the correctness of the pack/unpack methods
 end 
 
   
endmodule 


