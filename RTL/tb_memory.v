//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      tb_memory (Synchronous write / Asynchronous read)
// Module Name:      tb_memory - Behavioral
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


module tb_memory();

   // reg (all input of DUT)
   reg   [7:0]  tb_data_in;
   reg          tb_write_enable;
   reg          tb_clock;
   reg   [7:0]  tb_wr_addr;
   reg   [7:0]  tb_rd_add;
   reg   [7:0]  tb_rd_data_out;
   
   

   // wire (all output of DUT)
   wire  [7:0] tb_data_out;

   //parameter
     parameter CLOCK_PERIOD = 10;
     parameter tcq_delay    = 1;

   //instantiate the DUT
   memory memory_inst
   (
      .data_in         (tb_data_in),
      .write_enable    (tb_write_enable),
      .clk             (tb_clock),
      .wr_addr         (tb_wr_addr),
      .rd_add          (tb_rd_add),
      .data_out        (tb_data_out)
    );


// initialization of signals
 initial
   begin
      tb_data_in      = 'b0;
      tb_write_enable = 'b0;
      tb_clock    	 = 'b0;
      tb_wr_addr      = 'b0;
      tb_rd_add       = 'b0;
   end

// clock generation
 always
 #( CLOCK_PERIOD/2 )tb_clock = ~tb_clock;

// writing data into memory (using task (re-useable code))
initial
   begin
     #200;
  // task mem_write ( address, data);
     mem_write(8'd10,8'd24);
     mem_write(8'd11,8'd25);
     mem_write(8'd12,8'd26);
     mem_write(8'd13,8'd27);
   end

// reading data into memory (using task (re-useable code))
initial
   begin
     #800;
  // task mem_read ( address, read_data )
     mem_read(8'd10,tb_rd_data_out);
     mem_read(8'd11,tb_rd_data_out);
     mem_read(8'd12,tb_rd_data_out);
     mem_read(8'd13,tb_rd_data_out);

   end
//=======================
//  TASK DECLERATION
//=======================

// Memory write : task  (execute sequentially)
task mem_write;
// input
   input [7:0] address;
   input [7:0] data;
// output
// in-out
// parameter
// reg

 begin
     @(posedge tb_clock);                       // wait for positive edge of clock
     #tcq_delay;
      tb_wr_addr        = address;              // blocking statement = will execute sequentially
      tb_write_enable   = 1'b1;
      tb_data_in        = data;
      $display ("@ %t ns Write Address :%d  Data :%d",$time,address,data);
     @(posedge tb_clock);                      // wait for positive edge of clock
     #tcq_delay;
      tb_wr_addr        = 7'b0;                // wait for positive edge of clock
      tb_write_enable   = 1'b0;
      tb_data_in        = 1'b0;
    $display("============End of Writing data===========");
 end
endtask




// Memory read : task (execute sequentially)
task mem_read;
// input
   input    [7:0] address;
   output   [7:0] rd_data;
// output
// in-out
// parameter
// reg

 begin
      tb_rd_add         = address;
      #5 ;                                                // mem delay
      rd_data           = tb_data_out;                    //(global decleration signal)
      $display ("@ %t ns read Address :%d  Data :%d",$time,address,tb_data_out);
      $display("============End of reading data===========");
 end
endtask





   


/* // with non-nlocking
 begin
   $display ("%g Write Address :%h  Data :%h",$time,address,data);
     @(posedge tb_clock);                     // wait for positive edge of clock
      begin
         tb_wr_addr        <= address;        // non-blockig statemnt = will execute concurrently
         tb_write_enable   <= 1'b1;
         tb_data_in        <= data;
      end
     @(posedge tb_clock);                    // wait for positive edge of clock
      begin
         tb_wr_addr        <= 7'b0;          // non-blockig statemnt = will execute concurrently
         tb_write_enable   <= 1'b0;
         tb_data_in        <= 1'b0;
      end
    $display("============End of Writing data===========");
 end
endtask
*/



endmodule
