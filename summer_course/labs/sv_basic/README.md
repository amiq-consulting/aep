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
 
1. copy the sim_basic/rtl/ex_clk_rst_gen.v to sv_basic/rtl folder

2. copy the sim_basic/tb/ex_intf.sv to sv_basic/tb folder

3. copy the sim_basic/tb/ex_top.sv to sv_basic/tb folder 
  
4. include tb/ex_scratch.sv in ex_top.sv

5. follow the instructions in the tb/ex_scratch.sv

6. cd sim

7. Compile sources and start a simulation.

8. Add all signals in the design to the waveform

9. Run the simulation and observe the log and waveform


Once you finished to solve exercises inside ex_scratch.sv move on to the ex_tree.sv.

1. include tb/ex_tree.sv in ex_top.sv

2. you can initialize the tree structure inside an initial begin.

3. Enjoy!
