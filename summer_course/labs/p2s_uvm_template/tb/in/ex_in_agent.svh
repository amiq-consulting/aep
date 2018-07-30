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

`ifndef __EX_IN_AGENT
`define __EX_IN_AGENT




class ex_in_agent extends uvm_agent;
	`uvm_component_utils(ex_in_agent)

	ex_in_driver driver;
	ex_in_sequencer sequencer;
	ex_in_monitor monitor;

	function new (string name, uvm_component parent);
		super.new(name, parent);
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		monitor = ex_in_monitor::type_id::create("monitor", this);
		if (is_active == UVM_ACTIVE) begin
			driver = ex_in_driver::type_id::create("driver", this);
			sequencer = ex_in_sequencer::type_id::create("sequencer", this);
		end
	endfunction : build_phase

	virtual function void connect_phase(uvm_phase phase);
		if (is_active == UVM_ACTIVE) begin
			driver.seq_item_port.connect(sequencer.seq_item_export);
		end
	endfunction : connect_phase

endclass : ex_in_agent



`endif
