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
 
 1. Copy&Paste all sv/svh source files from sv_04_scoreboard to sv_05_env/sv folder
 
 2. Create a new class called ex_env that contains: 
    - a constructor
    - move driver, monitor and scoreboard instances into this class
    - move instance creation & connection logic into this class
    - add logic to propagate interfaces
    - add logic for pointer connections
    
 3. In the top module:
    - include ex_env source file
    - create an instance of the env
    - propagate interfaces into the env
    - connect pointers
    - start driving and monitoring tasks
    
 4. Start a simulation and notice the hierarchy
  