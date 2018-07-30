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

`timescale 1ns/1ps

// TODO: include the required source files

module ex_top(); //tb_top
	import uvm_pkg::*;
	import ex_pkg::*;
	import ex_test_pkg::*;


	initial begin
		//uvm_config_db#(virtual ex_in_intf)::set(.cntxt(null),.inst_name("uvm_test_top.env.in_agent*"),.field_name("in_vif"),.value(in_intf));
		//uvm_config_db#(virtual ex_out_intf)::set(.cntxt(null),.inst_name("uvm_test_top.env.out_agent*"),.field_name("out_vif"),.value(out_intf));
		run_test();
	end

endmodule













