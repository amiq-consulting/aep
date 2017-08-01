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

module clock_reset_generator(
    output reg clock,
    output reg reset_n
);

    localparam CLOCK_PERIOD = 10;

    initial begin
        clock = 0;
        forever #(CLOCK_PERIOD / 2) clock = ~clock;
    end

    initial begin
        reset_n = 1;
        drive_reset();
    end

    task drive_reset();
         begin
            @(posedge clock);
            #(CLOCK_PERIOD / 4);
            reset_n = 0;
            @(posedge clock);
            #(CLOCK_PERIOD / 4);
            reset_n = 1;
         end
    endtask: drive_reset

endmodule
