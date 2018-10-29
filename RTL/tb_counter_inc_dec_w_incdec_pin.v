
//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      tb_counter_updown
// Module Name:      tb_counter_updown - Behavioral
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

module tb_counter_inc_dec_w_incdec_pin();

// reg decleration ( all inputs of DUT)
   reg         tb_resetn;
   reg         tb_clock;
   reg         tb_enable;
   reg         tb_inc_dec;

// wire decleration ( all outputs of DUT)
   wire [7:0]  tb_count_out;


 // parameters
   parameter CLOCK_PERIOD = 5;


// instsantiate the DUT
 counter_inc_dec_w_incdec_pin counter_inst
 (
   .resetn		(tb_resetn),            // input active low reset
   .clock		(tb_clock),             // clock
   .enable   	(tb_enable),            // data enable signal
   .inc_dec    (tb_inc_dec),              // selcet mode for incr or dec counter
   .count_out 	(tb_count_out)          // counter output

 );


 // initialization of signals
 initial
   begin
      tb_resetn   	= 1'b0;
      tb_clock    	= 1'b0;
      #20;
      tb_resetn   = 1'b1;
      #30;
    end

 initial
    begin
       tb_enable = 1'b1;
    end

initial
    begin
       tb_inc_dec  = 1'b1;
       #50
       tb_inc_dec  = 1'b0;
       #70
       tb_inc_dec  = 1'b1;
       #30
        tb_inc_dec = 1'b0;
    end



  // clock generation
 always
 #( CLOCK_PERIOD/2 )tb_clock = ~tb_clock;



  endmodule
