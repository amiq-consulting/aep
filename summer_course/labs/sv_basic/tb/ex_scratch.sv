/*******************************************************************************
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
******************************************************************************/


/**
 * TODO: define an unsized enumeration color_t that has the following items:
 * - RED, GREEN, BLUE, YELLOW, BROWN, ORANGE 
 * 
 * TODO: define a sized enumeration error_t on 2 bits that has the following items:
 * - NONE, INFO, WARNING, ERROR
 * 
 * TODO: declare a class "first_class"
 * - add 4 fields of type : color_t, byte, unsigned integer, 32x5-bit array 
 * - implement its constructor and initialize each element in the array to be equal to its index
 * - implement a function get_string() which returns a string similar to "My fields are: color=RED, byte=0x23, uint=14524535, array=[0x00, 0x1F, ....]"
 * - implement a function print_me() that displays the string returned by get_string()
 * - Implement a function compute_crc() that computes an 8bit crc by XOR-ing individual elements
 * 
 * TODO: declare a class "second_class" that inherits "first_class"
 * - declare an error_t field
 * - implement a constructor that calls the first_class constructor and then sets the error_t field to be INFO
 * - override the get_string() method to also include the error_t field 
 * 
 * TODO: declare a class called "run_container"
 * - declare a field of type first_class
 * - declare a field of type second_class
 * - initialize the two fields in the constructor
 * 
 * ----------------------------------------------------------------------------
 * Randomization, Constraints etc
 * 
 * TODO: declare the color_t, byte and the array fields of first_class as randomize-able
 * 
 * TODO: in the run_container play with the randomization: generate 100 items and print them.
 * Play with the following types of constraints: 
 * - constant value 
 * - values within a range
 * - values outside of a range
 * - conditional constraints
 * - iterating constraints
 * - order constraints
 * 
 */


