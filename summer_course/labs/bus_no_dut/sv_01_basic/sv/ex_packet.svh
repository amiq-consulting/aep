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

`ifndef __ex_packet
`define __ex_packet

/***
 TODO: Define an enumeration type on 3bits containing the following items: EX_OK - 0, EX_CRC_ERR - 3, EX_BOUNCED_PKT_ERR - 5, EX_INCOMPLETE_PKT_ERR = 7
 TODO: Define a command enum type on 4bits: EX_READ=1, EX_WRITE=2, EX_STATUS=3, EX_EVENT=4
***/

/*** 
TODO: Define a packet class containing the following fields:
 * destination address : 8bit
 * source address : 8bit
 * packet prio: 3bit
 * packet type: 5bit, if bit0=0->the packet has no payload and the length field represents an event id; 
 *                       bit0=1->there is a payload and the length field is interpreted as number of valid bytes 
 * packet length: 8bit, specifies how many bytes of the payload are valid. 0 -> 1 byte valid, 1 word in payload, 1->2bytes valid, 1word in payload, 255->256bytes are valid
 * payload data: data array of 16bit (words) values with a size between [0..128].
 * error : of type error enum. this field should not be packed by pack_bytes()

TODO: Implement the following methods:
 * constructor
 * pack_bytes() - returns an array of bytes. The return type should be an aliased type for byte[] (tip: define it using typedef outside the class)
 * unpack_bytes() - restores the packet's fields from an array of bytes
 * check_packet() - returns 1 bit: 
    - 1 - packet is without errors
    - 0 - packet contains errors

 * pretty_print() 
 * compare() - returns 1 if the argument's packet fields are identical with the current packet's fields. it takes as an argument another packet
 - print the fields of the packet in nice format using $display, $sformatf and C-like string formatting
***/

// define a "command" packet class inheriting the packet class that contains the following fields
// In case of EX_EVENT you should make sure the bit0 of the Type field is 0. 
// maximum length of the packet's payload is 8

/*** 
Define a "frame" packet that inherits the packet class
* add an 8-bit field that is packed into the first 8-bit of the payload: 
 - MS-4bit=current fragment index
 - LS-4bit=total number of fragments
***/

`endif

