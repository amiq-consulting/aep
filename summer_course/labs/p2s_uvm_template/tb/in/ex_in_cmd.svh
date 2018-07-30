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

`ifndef __EX_IN_CMD
`define __EX_IN_CMD



//define class here




/*
	`uvm_object_utils_begin(ex_in_cmd)
			`uvm_field_int(idle_time, UVM_DEFAULT)
			`uvm_field_int(address, UVM_DEFAULT)
			`uvm_field_int(data, UVM_DEFAULT)
			`uvm_field_enum(ex_rnw_t, rnw, UVM_DEFAULT)
	`uvm_object_utils_end


	function new (string name = "ex_in_cmd");
		super.new(name);
	endfunction : new
	
	
	function string convert2string();
		string str1;
		string temp;
		if(rnw == EX_READ)
		begin
			temp = "read";
		end
		else
		begin
			temp = "write";
		end
		str1 =  {
			$sformatf("in_cmd seq item data = %d \n",data),
			$sformatf("in_cmd seq item idle time = %d \n",address),
			$sformatf("in_cmd seq item idle time = %s \n",temp)
		};
		return str1;
	endfunction : convert2string

	function void preety_print();
		`uvm_info("uart seq item",convert2string(), UVM_LOW);
	endfunction : preety_print



	function bit[3:0] compute_crc_w_initial(bit [3:0] initial_crc);
		bit [3:0] crc;
		bit [16:0] buf_data ={rnw, address, data};

		crc[0] = buf_data[15] ^ buf_data[11] ^ buf_data[10] ^ buf_data[9] ^ buf_data[8] ^ buf_data[6] ^ buf_data[4] ^ buf_data[3] ^ buf_data[0] ^ initial_crc[2];
		crc[1] = buf_data[16] ^ buf_data[15] ^ buf_data[12] ^ buf_data[8] ^ buf_data[7] ^ buf_data[6] ^ buf_data[5] ^ buf_data[3] ^ buf_data[1] ^ buf_data[0] ^ initial_crc[2] ^ initial_crc[3];
		crc[2] = buf_data[16] ^ buf_data[13] ^ buf_data[9] ^ buf_data[8] ^ buf_data[7] ^ buf_data[6] ^ buf_data[4] ^ buf_data[2] ^ buf_data[1] ^ initial_crc[0] ^ initial_crc[3];
		crc[3] = buf_data[14] ^ buf_data[10] ^ buf_data[9] ^ buf_data[8] ^ buf_data[7] ^ buf_data[5] ^ buf_data[3] ^ buf_data[2] ^ initial_crc[1];

		return crc;
	endfunction : compute_crc_w_initial

	function bit[3:0] compute_crc();
		return compute_crc_w_initial(4'hF);
	endfunction : compute_crc


*/





`endif

