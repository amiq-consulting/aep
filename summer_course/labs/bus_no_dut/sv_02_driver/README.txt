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
 
 1. Copy&Paste all sv/svh source files from sv_01_basic to sv_02_driver/sv folder

 2. Create a new class called ex_driver that contains: a virtual interface, a constructor, a packet instance 
    See also the contents of the sv/ex_driver.svh.

 3. In the top module:
    - include ex_driver source file
    - create an instance of the driver
    - connect the driver interface to the driver
    - clean-up: remove packet related code
    
 4. Start a simulation and notice the hierarchy
    

 
