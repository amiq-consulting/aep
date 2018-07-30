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

// state value definitions
`define TX_STATE_WAIT 0
`define TX_STATE_DATA_SR_1 1
`define TX_STATE_DATA_SR_2 2

// parallel to serial converter module
module ex_p2s(
      clk    ,
      rst_n  ,
      cmd    ,
      rnw    ,
      addr   ,
      data_in,
      busy   ,
      sdata
   );

   // Input interface
   input clk;
   input rst_n;
   input cmd;
   input rnw;
   input [7:0] addr;
   input [7:0] data_in;
   output wire busy;

   //Output interface
   output wire sdata;

   // buffer concatenated user data
   wire [16:0] buf_data;

   // shift registers 1 and 2
   reg [24:0] sr_1, sr_2;

   // indicates which of the shift registers contains data ready to be sent
   reg[1:0] sr_has_data;

   // counts the number of bits that were sent
   reg[4:0] sr_cnt;

   // hold the state variable
   reg[1:0] tx_state, tx_next_state;

   // hold crc and initial crc value
   wire[3:0] crc, initial_crc;

   // continuous assignments
   assign buf_data = rnw?{rnw,addr,8'h5A}:{rnw,addr,data_in};
   assign initial_crc = 4'hC;
   assign crc[0] = buf_data[15] ^ buf_data[11] ^ buf_data[10] ^ buf_data[9] ^ buf_data[8] ^ buf_data[6] ^ buf_data[4] ^ buf_data[3] ^ buf_data[0] ^ initial_crc[2];
   assign crc[1] = buf_data[16] ^ buf_data[15] ^ buf_data[12] ^ buf_data[8] ^ buf_data[7] ^ buf_data[6] ^ buf_data[5] ^ buf_data[3] ^ buf_data[1] ^ buf_data[0] ^ initial_crc[2] ^ initial_crc[3];
   assign crc[2] = buf_data[16] ^ buf_data[13] ^ buf_data[9] ^ buf_data[8] ^ buf_data[7] ^ buf_data[6] ^ buf_data[4] ^ buf_data[2] ^ buf_data[1] ^ initial_crc[0] ^ initial_crc[3];
   assign crc[3] = buf_data[14] ^ buf_data[10] ^ buf_data[9] ^ buf_data[8] ^ buf_data[7] ^ buf_data[5] ^ buf_data[3] ^ buf_data[2] ^ initial_crc[1];
   assign busy = (sr_has_data[0] && sr_has_data[1]);

   assign sdata = (tx_state == `TX_STATE_WAIT)?0:(tx_state == `TX_STATE_DATA_SR_1)?sr_1[24]:(tx_state == `TX_STATE_DATA_SR_2)?sr_2[24]:0;

   // compute FSM's next state
   always@(tx_state or sr_has_data or sr_cnt) begin
      case(tx_state)
         `TX_STATE_WAIT: begin
            if (sr_has_data[0])
               tx_next_state = `TX_STATE_DATA_SR_1;
            else if (sr_has_data[1])
               tx_next_state = `TX_STATE_DATA_SR_2;
            else
               tx_next_state = `TX_STATE_WAIT;
         end
         `TX_STATE_DATA_SR_1 : begin
            if (sr_cnt == 23) begin
               if (sr_has_data[1])
                  tx_next_state = `TX_STATE_DATA_SR_2;
               else
                  tx_next_state = `TX_STATE_WAIT;
            end else
               tx_next_state = `TX_STATE_DATA_SR_1;
         end
         `TX_STATE_DATA_SR_2 : begin
            if (sr_cnt == 23) begin
               if (sr_has_data[0])
                  tx_next_state = `TX_STATE_DATA_SR_1;
               else
                  tx_next_state = `TX_STATE_WAIT;
            end else
               tx_next_state = `TX_STATE_DATA_SR_2;
         end
      endcase
   end

   // FSM state update process
   always @(posedge clk) begin
      if (!rst_n)
         tx_state <= `TX_STATE_WAIT;
      else
         tx_state <= tx_next_state;
   end

   // bit counter
   always@(posedge clk) begin
      if (!rst_n) begin
         sr_cnt <= 0;
      end else begin
         case(tx_state)
            `TX_STATE_WAIT:       sr_cnt <= 0;
            `TX_STATE_DATA_SR_1 : sr_cnt <= (sr_cnt == 24)?0:(sr_cnt + 1);
            `TX_STATE_DATA_SR_2 : sr_cnt <= (sr_cnt == 24)?0:(sr_cnt + 1);
            default             : sr_cnt <= 0;
         endcase
      end
   end

   // output driving process
   always@(posedge clk) begin
      if (!rst_n) begin
         sr_1 <= 0;
         sr_2 <= 0;
         sr_has_data <= 0;
      end else begin
         case(tx_state)
            `TX_STATE_WAIT: begin
               if (cmd) begin
                  sr_1 <= {4'hC, buf_data, crc};
                  sr_has_data[0] <= 1;
               end else begin
                  sr_1 <= sr_1;
                  sr_has_data[0] <= 0;
               end

            end
            `TX_STATE_DATA_SR_1 : begin
               sr_has_data[0] <= (sr_cnt != 24);
               sr_1 <= sr_1 << 1;
               if (cmd && sr_has_data[1] == 0) begin
                  sr_2 <= {4'hC, buf_data, crc};
                  sr_has_data[1] <= 1;
               end else begin
                  sr_2 <= sr_2;
                  sr_has_data[1] <= sr_has_data[1];
               end
            end
            `TX_STATE_DATA_SR_2 : begin
               sr_has_data[1] <= (sr_cnt != 24);
               sr_2 <= sr_2 << 1;
               if (cmd && sr_has_data[0] == 0) begin
                  sr_1 <= {4'hC, buf_data, crc};
                  sr_has_data[0] <= 1;
               end else begin
                  sr_1 <= sr_1;
                  sr_has_data[0] <= sr_has_data[0];
               end
            end
         endcase
      end
   end
endmodule






