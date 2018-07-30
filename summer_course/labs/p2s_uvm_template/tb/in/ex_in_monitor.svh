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

`ifndef __EX_IN_MONITOR
`define __EX_IN_MONITOR

class ex_in_monitor extends uvm_monitor;
	`uvm_component_utils(ex_in_monitor)

	protected virtual ex_in_intf in_vif;

	ex_in_cmd my_item;

	event new_cmd_e;

	covergroup item_cg @(new_cmd_e);
	//add coverpoints here
	endgroup

	uvm_analysis_port #(ex_in_cmd) collected_item_port;

	function new (string name, uvm_component parent);
		super.new(name, parent);
		collected_item_port = new("collected_item_port", this);
		item_cg=new();
		item_cg.set_inst_name({get_full_name(), ".item_addr_cg"});
		my_item = ex_in_cmd::type_id::create(.name("my_item"), .parent(this),.contxt(get_full_name()));
	endfunction : new

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual ex_in_intf)::get(this, "", "in_vif", in_vif))
			`uvm_fatal("NOVIF", {"virtual interface must be set for: ", get_full_name(), ".in_vif"})
	endfunction: build_phase

	virtual task run_phase(uvm_phase phase);
		process main_thread; // main thread
		process rst_mon_thread; // reset monitor thread
		@(negedge in_vif.rst_n);
		forever     // Start monitoring
		begin
			@(posedge in_vif.rst_n);
			fork

				begin                                           // Start the monitoring thread
					main_thread=process::self();
					forever
					begin
						monitor_bus();
						collected_item_port.write(my_item);
						->new_cmd_e;
					end
				end//end thread actual monitoring thread

				begin                                       // Monitor the reset signal
					rst_mon_thread = process::self();
					@(negedge in_vif.rst_n)
					begin
						// Interrupt current item at reset
						if(main_thread)
						begin
							main_thread.kill();
						end//end if main thread exists
					end//end if received reset
				end//end thread monitor reset signal

			join_any
		end//end forever
	endtask : run_phase

	virtual protected task monitor_bus();
	//add stuff here
	//fills "my_item" with correct data. monitors one package
	endtask : monitor_bus

endclass : ex_in_monitor



`endif
