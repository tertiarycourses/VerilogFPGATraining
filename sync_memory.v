//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      Sync_Memory
// Module Name:      Sync_Memory - Behavioral
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

module sync_memory
#( parameter DATA_WIDTH = 8,
             ADDR_WIDTH = 8)
 (
    input      [DATA_WIDTH-1:0]     data_in,
    input                           write_enable,
    input                           read_enable,
    input                           clk,
    input      [ADDR_WIDTH-1:0]     wr_addr,
    input      [ADDR_WIDTH-1:0]     rd_add,
    output     [DATA_WIDTH-1:0]     data_out

   );

    // reg
    reg [DATA_WIDTH-1:0]  memory [0:255];  // 256* 8 bit memory
    reg [DATA_WIDTH-1:0]  r_data_out;

    // write data to memory
    always @(posedge clk)
    begin
        if (write_enable == 1'b1)
        begin
            memory[wr_addr] <= data_in;
        end
    end

    // write data to memory
    always @(posedge clk)
    begin
        if (read_enable == 1'b1)
        begin
            r_data_out <= memory[rd_add];
        end
    end

    // read data
    assign data_out = r_data_out;

endmodule
