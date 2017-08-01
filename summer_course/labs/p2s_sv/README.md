*******************************************************************************
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
******************************************************************************

The goal of amiq_p2s_sv is to ramp-up students with SystemVerilog knowledge.

Here are the steps that any student should follow:

1. Read the P2S specification. 
Create a verification plan and a verification environment structure.

2. Implement the input interface ***ex_in_if***.


3. Implement a class that models the command. See the ex_command.svh file


4. Follow the instructions in tb/ex_top.sv


5. Implement the input driver in a file called ***ex_in_driver.svh***:
    - define the ***ex_in_driver*** class
    - create a pointer to the input interface (i.e. ***virtual interface*** field)
    - declare ***drive_command(ex_cmd acmd);*** task that drives the command on the input bus
    - declare & implement ***scenario()*** task that creates 10 commands, randomizes them and drives them on the bus using the ***drive_command*** task

6. Implement the input monitor class ***ex_in_monitor.svh***

7. Implement the input agent class ***ex_in_agent*** that contains the following:
    - one input monitor instance
    - one drive instance

8. Create a package named ***ex_in_pkg.sv*** and include all input-related files. The input interface should be included outside of the package.


9. Implement the output interface ***ex_out_if***.


10. Implement an object called ***ex_serial_obj*** that models the transfer on the output bus.


11. Implement the output monitor in a file called ***ex_out_monitor.svh***



12. Implement the output agent class ***ex_out_agent*** that contains an instance of the output monitor instance.

13. Create a package named ***ex_out_pkg.sv*** and include all output related files. The output interface should be included outside the package.


14. Define package ***ex_pkg*** which imports all classes from ex_in_pkg and ex_out_pkg

15. Implement the ***ex_env*** class

16. Implement the scoreboard class ***ex_sb***

17. Instantiate the scoreboard in the verification environment class.

18. Run a simulation using qrun

19. 

