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

`ifndef __EX_TEST
`define __EX_TEST

class ex_test extends uvm_test;
	`uvm_component_utils(ex_test)

	// environment instance
	ex_env env;
	// printer instance
	uvm_table_printer printer;

	function new(string name = "ex_test", uvm_component parent=null);
		super.new(name,parent);
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env = ex_env::type_id::create("env", this);
		printer = new();
		printer.knobs.depth = 3;
	endfunction : build_phase

	virtual function void end_of_elaboration_phase(uvm_phase phase);
		`uvm_info(get_type_name(), $sformatf("Printing the test topology :\n%s", this.sprint(printer)), UVM_LOW);// Print the test topology
	endfunction : end_of_elaboration_phase

	task run_phase(uvm_phase phase);
		ex_in_sequence seq;
		super.run_phase(phase);
		phase.raise_objection(this);
		seq = ex_in_sequence::type_id::create("seq");
		assert (seq.randomize());
		seq.start(env.in_agent.sequencer);
		phase.drop_objection(this);
	endtask : run_phase



endclass : ex_test



`endif

