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

module combi_logic
 (
   input    [7:0]    i_data_in1,            // data_in
   input    [7:0]    i_data_in2,            // data_in
   output   [8:0]    adder_out,             // adder out
   output   [7:0]    sub_out,               // sub_out
   output   [15:0]   mult_out               // mult_out

 );




assign adder_out = i_data_in1 + i_data_in2;
assign sub_out   = i_data_in1 - i_data_in2;
assign mult_out  = i_data_in1 * i_data_in2;





// end of counter module
endmodule

