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
 
`ifndef __ex_intf
`define __ex_intf

// TODO: create an interface containing the following signals
// input clk - 1bit
// input reset - 1bit
// sop (start of packet) - 1bit
// eop (end of packet) - 1bit
// valid - 1bit
// data - 16bit
// error - 3bits (can be assigned any time while valid is asserted)

/* Protocol diagram
 * reset (not represented) is active low
 * sop - indicates the start of a packet
 * eop - indicates the end of a packet
 * sequences like sop->sop or eop->eop are invalid
 * data is valid only if vld=1
 * err is valid only on the last cycle of the packet (eop=1)
        __    __    __    __    __    __    __    __    __    __    __    __    __    __    __    __    __    __    __    __
clk____|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|  |__|
              _____
sop__________|     |___________________________________________________________________________________________________________
                                                                                _____
eop____________________________________________________________________________|     |_________________________________________
              _____________________________             ___________             _____ 
vld__________|                             |___________|           |___________|     |_________________________________________
    _________ _____________________________ ___________ ___________ ___________ _____ ________________________________________ 
data_________X_____________________________X___________X___________X___________X_____X_________________________________________
    ___________________________________________________ ___________ ___________ _____ ________________________________________ 
err ___________________________________________________X___________X___________X_____X_________________________________________
  

 */


`endif
 
