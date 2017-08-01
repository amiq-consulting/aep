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

`ifndef __ex_in_cmd
`define __ex_in_cmd

/***
 * TODO: Define the enumeration ex_rnw_t on 1bit containing the following items: EX_READ - 1, EX_WRITE - 0
 * 
 * 
 * TODO: Define the ex_cmd class containing the following fields:
 * address : 8bit
 * data : 8bit
 * rnw : ex_rnw_t
 * 
 * 
 * TODO: Implement the constructor method
 * 
 * 
 * 
 * TODO: implement the pretty_print() method. 
 * It prints the fields of the command in nice format using $display, $sformatf and C-like string formatting 
 * 
 * 
 * 
 * TODO: implement compare(ex_cmd acmd) function 
 * It returns 1 if the argument's fields are identical with the current command object fields.
 * 
 * 
 * 
 * 
 * TODO: implement a compute_crc() function
 * It returns bit[3:0] - the crc computed over commands {rnw, address, data} fields
 */


`endif

