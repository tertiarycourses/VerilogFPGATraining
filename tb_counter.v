
//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      tb_counter
// Module Name:      tb_counter - Behavioral
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

module tb_counter();

// reg decleration ( all inputs of DUT)
   reg         tb_resetn;
   reg         tb_clock;
   reg         tb_enable;
   reg   [999:0] filepath = "D:/GR/Personal/Training/VERILOG/project/counter/";

// wire decleration ( all outputs of DUT)
   wire [7:0]  tb_count_out;
   integer f1;

 // parameters
   parameter CLOCK_PERIOD = 5;


// instsantiate the DUT
 counter counter_inst
 (
   .resetn		(tb_resetn),            // input active low reset
   .clock		(tb_clock),             // clock
   .enable   	(tb_enable),            // data enable signal
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
      tb_enable = 1'b1;
    end

 
  // clock generation
 always
 #( CLOCK_PERIOD/2 )tb_clock = ~tb_clock;

// run simulation for 80000 units and display message.
initial
   begin
   f1 =  $fopen({filepath,"counter_out_data.txt"},"w");   // open file for writting
   #80000;   // timeperiod * `timescale
   	$display("End of simulation time%d,",$time);
   	$fclose;    // closing file
   	$finish;   // will end the simulation
   end

 // write datainto file
   always @(posedge tb_clock)
     begin
      if(tb_enable)
       begin
         $fwrite(f1,"%d\n",tb_count_out);
       end
    end



  endmodule
