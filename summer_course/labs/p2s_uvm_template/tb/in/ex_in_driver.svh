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

`ifndef __EX_IN_DRIVER
`define __EX_IN_DRIVER


class ex_in_driver extends uvm_driver #(ex_in_cmd);
	`uvm_component_utils(ex_in_driver)

	protected virtual ex_in_intf in_vif;

	ex_in_cmd my_item;

	function new (string name, uvm_component parent);
		super.new(name, parent);
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual ex_in_intf)::get(this,"", "in_vif", in_vif))
			`uvm_fatal("NO_VIF_IN", {"virtual interface must be set for: ", get_full_name(), ".in_vif"})
	endfunction: build_phase
	
	virtual task run_phase(uvm_phase phase);
		process main_thread; // main thread
		process rst_mon_thread; // reset monitor thread
		reset_signals();
		@(negedge in_vif.rst_n);
		forever
		begin
			@(posedge in_vif.rst_n);
			fork// Drive current transaction

				begin// actually drive the transaction
					forever
					begin
						main_thread=process::self();
						seq_item_port.get_next_item(my_item);// Get the next item from the sequencer
						drive_command(my_item);
						seq_item_port.item_done();
					end//end forever
				end//end thread that drives transactions

				begin   // Monitor the reset signal
					rst_mon_thread = process::self();
					@(negedge in_vif.rst_n)
						if(main_thread) // Interrupt current transaction at reset
						begin
							main_thread.kill();
						end
					// Do reset
					reset_signals();
				end//end monitor reset signals

			join_any
		end//end forever
	endtask : run_phase

	virtual protected task drive_command(ex_in_cmd item);
	//add stuff here
	endtask : drive_command

	function void reset_signals();
		in_vif.addr = 0;
		in_vif.data_in =0;
		in_vif.cmd =0;
		in_vif.rnw = 0;
	endfunction : reset_signals

endclass : ex_in_driver




`endif
