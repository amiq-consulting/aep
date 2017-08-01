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

`ifndef __ex_scoreboard
`define __ex_scoreboard

// Create a new class called ex_scoreboard that contains: 
//    - a constructor
//    - a list of packets: driven packets
//    - add pointers to driver and monitor
// Implement driver_listener() and monitor_listener() tasks. These listen on the events in driver/monitor and react accordingly:
//   - @driver.new_packet_e the packet is added to the driven_packets list
//   - @monitor.new_packet_e the packet is checked against the driven_packets list
//  
// Move the coverage group from the monitor to the scoreboard and if the check is successfull => sample the packet
    
`endif

