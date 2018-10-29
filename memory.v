//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      Memory
// Module Name:      Memory - Behavioral
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

module memory
(
    input      [7:0]  data_in,
    input             write_enable,
    input             clk,
    input      [7:0]  wr_addr,
    input      [7:0]  rd_add,
    output     [7:0]  data_out

   );

    // reg
    reg [7:0] memory [0:255];  // 256* 8 bit memory

    // write data to memory
    always @(posedge clk) begin
        if (write_enable == 1'b1) begin
            memory[wr_addr] <= data_in;
        end
    end

    // Asynchronous read data
    assign data_out = memory[rd_add];

endmodule
