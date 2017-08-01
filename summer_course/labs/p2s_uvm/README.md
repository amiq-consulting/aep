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

The scope of this lab is to port the verification environment developed in p2s_sv to UVM.

1. Copy all sources from p2s_sv/ to p2s_uvm/
2. Port data items to inherit uvm_sequence_item
3. Port monitor to inherit uvm_monitor
4. Port driver to inherit uvm_driver
5. Port agent to inherit uvm_agent
6. Define p2s_sequence#(p2s_sequence_item)
7. Define p2s_sqr (a sequencer)
8. Integrate the p2s_sqr in the p2s_agent
9. Port p2s_env to inherit uvm_env
10. Port p2s_scoreboard to inherit uvm_scoreboard
11. Create package p2s_pkg that includes all sources.
12. Create a separate package p2s_test_pkg which includes the
13. Import / include all sources in the top module 