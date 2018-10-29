//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      tb_sync_memory (Synchronous write / Synchronous read)
// Module Name:      tb_sync_memory - Behavioral
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


module tb_sync_memory();

   // reg (all input of DUT)
   reg   [7:0]  tb_data_in;
   reg          tb_write_enable;
   reg          tb_read_enable;
   reg          tb_clock;
   reg   [7:0]  tb_wr_addr;
   reg   [7:0]  tb_rd_add;
   reg   [7:0]  tb_rd_data_out;


   // wire (all output of DUT)
   wire  [7:0] tb_data_out;

   //parameter
     parameter CLOCK_PERIOD = 10;
     parameter tcq_delay    = 1;

   //interger
     integer f1;

   //instantiate the DUT
   sync_memory memory_inst
   (
      .data_in         (tb_data_in),
      .write_enable    (tb_write_enable),
      .read_enable     (tb_read_enable),
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
      tb_read_enable  = 'b0;
      tb_clock    	 = 'b0;
      tb_wr_addr      = 'b0;
      tb_rd_add       = 'b0;
   end

// clock generation
 always
   begin
      #( CLOCK_PERIOD/2 )tb_clock = ~tb_clock;
   end

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


// Memory write : task  (execute sequentially)
task mem_write;
// input
   input [7:0] address;
   input [7:0] data;
// output // in-out // parameter // reg

 begin
     @(posedge tb_clock);                       // wait for positive edge of clock
     #tcq_delay;
      tb_wr_addr        = address;              // blocking statement = will execute sequentially
      tb_write_enable   = 1'b1;
      tb_data_in        = data;
      $display ("WRITE@ %g ns Write Address :%d  Data :%d",$time,address,data);
     @(posedge tb_clock);                      // wait for positive edge of clock
     #tcq_delay;
      tb_wr_addr        = 7'b0;                // wait for positive edge of clock
      tb_write_enable   = 1'b0;
      tb_data_in        = 1'b0;
    $display("============End of Writing data===========");
 end
endtask




// Memory read and compare data: task (execute sequentially)
task mem_read;
// input
   input    [7:0] address;
   output   [7:0] rd_data;
// output // in-out // parameter // reg

 begin
      @(posedge tb_clock);                       // wait for positive edge of clock
      #tcq_delay;                                // clock-to-q delay
      tb_rd_add         = address;
      tb_read_enable    = 1'b1;
      rd_data           = "zzzzzzzz";           //(global decleration signal: Data will available on next clock cycle)

      @(posedge tb_clock);
      #tcq_delay;
      tb_rd_add         = 'b0;
      tb_read_enable    = 1'b0;
      rd_data           = tb_data_out;           //(global decleration signal)
      $display ("READ@ %g ns read Address :%d  Data :%d",$time,address,tb_data_out);

      // compare data expected vs actual
      if ( address == 'd10 && tb_data_out !='d24 )
         $display (">>>>>>>>>>Data Mismatch @ Address 10 : Expected = 24 , Actual = %d",tb_data_out);

      else if ( address == 'd11 && tb_data_out !='d25 )
         $display (">>>>>>>>>>Data Mismatch @ Address 11 : Expected = 25 , Actual = %d",tb_data_out);

      else if ( address == 'd12 && tb_data_out !='d26 )
         $display (">>>>>>>>>>Data Mismatch @ Address 12 : Expected = 26 , Actual = %d",tb_data_out);

      else if ( address == 'd13 && tb_data_out !='d27 )
         $display (">>>>>>>>>>Data Mismatch @ Address 13 : Expected = 27 , Actual = %d",tb_data_out);
      else
         $display (">>>>>>> DATA MATCH @ Address %d",address);

    $display("============End of reading data===========");
 end
endtask



// writing data in file
initial
   begin
      f1 = $fopen("sync_memory_data_out.txt");    // opening file
      #4000;

      $fclose (f1);     // closing file
      $finish;          // end simulation
   end

 always@(negedge tb_read_enable)
 begin
      # 10;
      $fwrite(f1,"[%t] %d\n",$time,tb_data_out[7:0]);
   end






endmodule
