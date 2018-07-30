/******************************************************************************
 Copyright (c) 2004-2018, AMIQ Consulting srl. All rights reserved.

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


`ifndef __EX_IN_SEQUENCER
`define __EX_IN_SEQUENCER




class ex_in_sequencer extends uvm_sequencer #(ex_in_cmd);
	`uvm_component_utils(ex_in_sequencer)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction : new


endclass : ex_in_sequencer







`endif

