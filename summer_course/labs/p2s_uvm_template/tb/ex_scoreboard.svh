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

`ifndef __EX_SCOREBOARD
`define __EX_SCOREBOARD








class ex_scoreboard extends uvm_scoreboard;
	`uvm_component_utils(ex_scoreboard)
	//analysis imports
	`uvm_analysis_imp_decl(_collected_item_in)
	uvm_analysis_imp_collected_item_in#(ex_in_cmd, ex_scoreboard) in_port;

	`uvm_analysis_imp_decl(_collected_item_out)
	uvm_analysis_imp_collected_item_out#(ex_out_serial_obj, ex_scoreboard) out_port;


	function new(string name, uvm_component parent);
		super.new(name, parent);
		in_port = new("in_port", this);
		out_port = new("out_port", this);
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction : build_phase

	virtual task run_phase(uvm_phase phase);
		process main;// Used by the reset handling mechanism
		`uvm_info(get_type_name(), $sformatf("scoreboard starts"), UVM_MEDIUM);
		super.run_phase(phase);
	endtask : run_phase

	virtual function void extract_phase(uvm_phase phase);
	
	endfunction : extract_phase

	function void write_collected_item_in(ex_in_cmd item);
	//add stuff here
	endfunction : write_collected_item_in

	function void write_collected_item_out(ex_out_serial_obj item);
	//add stuff here
	endfunction : write_collected_item_out




endclass : ex_scoreboard







`endif

