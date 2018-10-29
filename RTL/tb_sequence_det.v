
//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      tb_sequence_det.v
// Module Name:      tb_sequence_det - Behavioral
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

module tb_sequence_det();

// reg decleration ( all inputs of DUT)
   reg         tb_resetn;
   reg         tb_clock;
   reg         tb_data_in;

// wire decleration ( all outputs of DUT)
   wire        tb_output_valid;


 // parameters
   parameter CLOCK_PERIOD = 5;


// instsantiate the DUT
  sequence_det sequence_det_inst
 (
   .resetn        (tb_resetn        ),     // input active low reset
   .clock         (tb_clock         ),     // clock
   .data_in       (tb_data_in       ),     // serial input data
   .output_valid  (tb_output_valid  )     // output valid when it detects the sequence 1011
 );

 // initialization of signals
 initial
   begin
      tb_resetn   	= 1'b0;
      tb_clock    	= 1'b0;
      #20;
      tb_resetn   	= 1'b1;
      task_paralle_2_serial(8'hbb);  // 1011 1011
      task_paralle_2_serial(8'h55);  // 0101 0101
      task_paralle_2_serial(8'hb0);  // 1011 0000
      task_paralle_2_serial(8'hbF);  // 1011 1111

    end
  // clock generation
 always
  begin
 	#( CLOCK_PERIOD/2 )tb_clock = ~tb_clock;
  end

//======================
// TASK DECLERATION
//=====================
  // task to convert parallel data to serial
  integer i;
   task task_paralle_2_serial;
      input [7:0] parallel_data_in;
         begin
            for (i=0 ; i<8 ; i=i+1)
               begin
             	   tb_data_in <= parallel_data_in[i];
             		@(negedge tb_clock);
               end
         end
   endtask

  
  
endmodule


