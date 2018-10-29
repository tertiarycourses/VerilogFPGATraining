//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      counter
// Module Name:      counter - Behavioral
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

module counter
 (
   input          resetn,            // input active low reset
   input          clock,             // clock
   input          enable,            // data enable signal
   output [7:0]   count_out          // counter output

 );

// reg decleration (internal signals)
reg [7:0]  r_count_out;

// incremental up_counter
always @(posedge clock or negedge resetn)  // what every you put here will become asynchronous.
   if(~resetn)           // resetn == 1'b0;
      r_count_out <= 8'b0;
   else if (enable == 1'b1)
      r_count_out <= r_count_out + 1;
   else
     r_count_out <= 8'b0;

// assign reg to output
assign count_out = r_count_out;

// end of counter module
endmodule

