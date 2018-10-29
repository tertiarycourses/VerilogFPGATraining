//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      tb_decoder3_8
// Module Name:      tb_decoder3_8 - Behavioral
// Project Name:     verilog Training
// Target Devices:   xilinx
// Tool Versions:    v2017.4
// Description:
//
// Dependencies:     None
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//----------------------------------------------------------------------------------
`timescale 1ns/1ps

module tb_decoder3_8();

 // reg decleration (all DUT inputs)
   reg [2:0] tb_i_data_in;
   reg       tb_i_data_in_en;

 // wire decleration ( all DUT output)
   wire [7:0]  tb_decoder_out;


// module Instantiation
  decoder3_8  decoder3_8_inst
 (
      .i_data_in        (tb_i_data_in     ),      // data_in
      .i_data_in_en     (tb_i_data_in_en  ),      // data_in
      .decoder_out      (tb_decoder_out   )       // decoder out

 );




 initial
   begin
      tb_i_data_in_en = 1'b1;

      tb_i_data_in = 3'd1;
      #15
      tb_i_data_in = 8'd7;
     #15;
      tb_i_data_in = 8'd5;
     #15
      tb_i_data_in = 8'd2;
     #15;
      tb_i_data_in = 8'd0;
     #15
      tb_i_data_in = 8'd1;
     #15;
      tb_i_data_in = 8'd5;
     #15
      tb_i_data_in = 8'd6;
  end

  endmodule
