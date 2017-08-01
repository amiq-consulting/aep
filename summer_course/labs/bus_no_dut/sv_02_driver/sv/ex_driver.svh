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

`ifndef __ex_driver
`define __ex_driver

// Create a new class called ex_driver that contains: a virtual interface, a constructor, a packet instance 

/***
 Implement the following tasks:
* drive_packet(): prints the packets
* scenario(): 
  - creates/generates 10 packets in a for loop that uses as a limit the macro `EX_NOF_PACKETS defined in the top module file
  - calls drive_packet() for each packet

 Check that code compiles and simulation can run.

 Implement reset handling support in the scenario() task:
  - wait for reset negedge
  - initialize signals
  - wait for reset posedge
  - wait for clk posedge
 Make sure the top module logic generates at least one reset pulse

 Check that code compiles and simulation can run.

 Update packet's constructor method to:
 - initialize the size of the payload
 - initialize the data array with random values

 Check that code compiles and simulation can run.

 Extend the implementation of drive_packet() to drive the packet on the bus according to the protocol.

 Check that code compiles and simulation can run. Check visually that the protocol is obeyed


***/




`endif

