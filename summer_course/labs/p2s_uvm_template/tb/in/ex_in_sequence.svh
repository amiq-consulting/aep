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



`ifndef __EX_IN_SEQUENCE
`define __EX_IN_SEQUENCE




class ex_in_sequence extends uvm_sequence#(ex_in_cmd);
	`uvm_object_utils(ex_in_sequence)
	`uvm_declare_p_sequencer(ex_in_sequencer)

	rand int unsigned nof_items;
	rand ex_in_cmd trans;
	
	//add constraint here

	function new(string name = "ex_in_sequence");
		super.new(name);
	endfunction : new

	virtual task body();
//      trans1 = ex_in_cmd::type_id::create(
//          .name("trans1"),
//          .contxt(get_full_name())  );
//      assert(trans1.randomize());
//      start_item(trans1);
//      finish_item(trans1);
		repeat(nof_items)
			`uvm_do(trans)
	endtask : body

endclass : ex_in_sequence











`endif

