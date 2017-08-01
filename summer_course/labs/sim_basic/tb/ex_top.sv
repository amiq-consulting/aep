/*******************************************************************************
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
******************************************************************************/

`timescale 1ns/1ps

/**
 * TODO: include ex_intf.sv 
 */
module ex_top();
 
/* 
 * TODO: declare reset and clock signals using wire
 * 
 * TODO: instantiate ex_clk_rst_gen and connect it to the clk and reset wires
 * 
 * TODO: declare data(8bit) and valid(1bit) wires 
 * 
 * TODO: instantiate ex_in_if and: 
 * - connect it's ports
 * - connect it's internal signals to data and valid wires
 * 
 * TODO: instantiate ex_out_if and: 
 * - connect it's ports
 * - connect it's internal signals to data and valid wires
 *  
**/
 
 initial begin
    /* 
     * TODO: drive reset 4 times by calling the reset task defined in the ex_clk_rst_gen
     * 
     * TODO: start the ex_in_if.drive_data and ex_out_if.monitor_data tasks to run in parallel. 
     * once they finish call the $stop system task.
     * 
     */
 end 
  
endmodule 


