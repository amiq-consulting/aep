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
 
 1. Copy&Paste all sv/svh source files from sv_03_monitor to sv_04_scoreboard/sv folder
 2. Create a new class called ex_scoreboard that contains: 
    - a constructor
    - a list of packets: driven packets
    - add pointers to driver and monitor
    
 3. In the top module:
    - include ex_scoreboard source file
    - create an instance of the scoreboard
    - connect monitor&driver pointers into the scoreboard
    
 4. Start a simulation and notice the hierarchy
 
 5. Implement driver_listener() and monitor_listener() tasks. These listen on the events in driver/monitor and react accordingly:
  - @driver.new_packet_e the packet is added to the driven_packets list
  - @monitor.new_packet_e the packet is checked against the driven_packets list
  
 6. Move the coverage group from the monitor to the scoreboard and if the check is successfull => sample the packet

 7. Start a simulation and have a look on the waveform and also on the coverage group
 