//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      combi_logic
// Module Name:      combi_logic - Behavioral
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

module tb_combi_logic();

 // reg decleration (all DUT inputs)
   reg [7:0] tb_i_data_in1;
   reg [7:0] tb_i_data_in2;

 // wire decleration ( all DUT output)
   wire [8:0]  tb_adder_out;
   wire [7:0]  tb_sub_out;
   wire [15:0] tb_mult_out;


// module Instantiation
 combi_logic combi_logic_inst
 (
      .i_data_in1    (tb_i_data_in1  ),      // data_in
      .i_data_in2    (tb_i_data_in2  ),      // data_in
      .adder_out     (tb_adder_out   ),      // adder out
      .sub_out       (tb_sub_out     ),      // sub_out
      .mult_out      (tb_mult_out    )       // mult_out

 );




 initial
   begin
      tb_i_data_in1 = 8'd32;
      tb_i_data_in2 = 8'd64;
     #30;
      tb_i_data_in1 = 8'd55;
      tb_i_data_in2 = 8'd28;
     #30;
      tb_i_data_in1 = 8'd200;
      tb_i_data_in2 = 8'd12;
     #30;
      tb_i_data_in1 = 8'd255;
      tb_i_data_in2 = 8'd255;
  end

  endmodule
