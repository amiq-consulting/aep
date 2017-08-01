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

`timescale 1ns / 1ps

module pattern_matcher(
    // Clock, reset
    input             clock,
    input             reset_n,
    // Inputs
    input             serial_data_in,
    input       [7:0] pattern,
    input             load,
    input             read,
    input             read_and_clear,
    // Outputs
    output reg        serial_data_out,
    output reg        match,
    output reg [31:0] bit_count,
    output reg [31:0] match_count
);

    //==========================================================
    // State machine
    //==========================================================

    localparam IDLE_STATE = 1'b0;
    localparam RUNNING_STATE = 1'b1;

    reg state_reg;

    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            state_reg <= IDLE_STATE;
        else if (load)
            state_reg <= RUNNING_STATE;

    //==========================================================
    // Registers
    //==========================================================

    reg  [7:0] shift_reg;
    reg  [7:0] pattern_reg;
    reg [31:0] bit_counter_reg;
    reg [31:0] match_counter_reg;

    wire [7:0] shift_nxt   = { shift_reg[6:0], serial_data_in };
    wire       match_found = (shift_nxt == pattern_reg) && (state_reg == RUNNING_STATE);

    // Shift register
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            shift_reg <= 0;
        else
            shift_reg <= shift_nxt;

    // Pattern register
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            pattern_reg <= 0;
        else if (load)
            pattern_reg <= pattern;

    // Bit counter register
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            bit_counter_reg <= 0;
        else if (read_and_clear)
            bit_counter_reg <= 0;
        else
            bit_counter_reg <= bit_counter_reg + 1;

    // Match counter register
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            match_counter_reg <= 0;
        else if (read_and_clear)
            match_counter_reg <= 0;
        else if (match_found)
            match_counter_reg <= match_counter_reg + 1;

    //==========================================================
    // Outputs
    //==========================================================

    // Serial data out
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            serial_data_out <= 0;
        else
            serial_data_out <= serial_data_in;

    // Match
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            match <= 0;
        else
            match <= match_found;

    // Bit count
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            bit_count <= 0;
        else if (read || read_and_clear)
            bit_count <= bit_counter_reg;

    // Match count
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            match_count <= 0;
        else if (read || read_and_clear)
            match_count <= match_counter_reg;

endmodule
