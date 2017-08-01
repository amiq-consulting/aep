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

module irq_generator(
    // Clock, reset
    input             clock,
    input             reset_n,
    // Inputs
    input             serial_data_in,
    input      [15:0] min_ping,
    input      [15:0] max_ping,
    input      [15:0] sync_time,
    input             load,
    // Outputs
    output reg        ping_irq,
    output reg        sync_irq
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

    reg [15:0] min_ping_reg;
    reg [15:0] max_ping_reg;
    reg [15:0] sync_time_reg;
    reg [15:0] ping_counter_reg;
    reg [15:0] sync_counter_reg;
    reg        serial_data_reg;

    // Minimum ping time register
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            min_ping_reg <= 0;
        else if (load)
            min_ping_reg <= min_ping;

    // Maximum ping time register
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            max_ping_reg <= 0;
        else if (load)
            max_ping_reg <= max_ping;

    // Sync time register
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            sync_time_reg <= 0;
        else if (load)
            sync_time_reg <= sync_time;

    // Ping counter register
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            ping_counter_reg <= 0;
        else if (!serial_data_in)
            ping_counter_reg <= 0;
        else
            ping_counter_reg <= ping_counter_reg + 1;

    // Sync counter register
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            sync_counter_reg <= 0;
        else if (state_reg == RUNNING_STATE && !serial_data_in || sync_counter_reg == sync_time_reg)
            sync_counter_reg <= 0;
        else
            sync_counter_reg <= sync_counter_reg + 1;

    // Serial data register
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            serial_data_reg <= 0;
        else
            serial_data_reg <= serial_data_in;

    //==========================================================
    // Outputs
    //==========================================================

    // Ping IRQ
    wire irq_falling_edge = (serial_data_reg & ~serial_data_in) && (state_reg == RUNNING_STATE);

    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            ping_irq <= 0;
        else if (irq_falling_edge && ping_counter_reg >= min_ping_reg
                                  && ping_counter_reg <= max_ping_reg)
            ping_irq <= 1;
        else
            ping_irq <= 0;

    // Sync IRQ
    always @(posedge clock or negedge reset_n)
        if (!reset_n)
            sync_irq <= 0;
        else if (state_reg == RUNNING_STATE && sync_counter_reg == sync_time_reg)
            sync_irq <= serial_data_in;
        else
            sync_irq <= 0;

endmodule
