//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      decoder
// Module Name:      decoder - Behavioral
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

module decoder3_8
 (
   input    		[2:0]    i_data_in,             // data_in
   input             		i_data_in_en,          // data_in
   output reg  	[7:0]    decoder_out            // decoder out

 );

always@*
   begin
       if (i_data_in_en)
         begin
            case(i_data_in)
               3'd0 :  decoder_out = 8'd7 ;
               3'd1 :  decoder_out = 8'd6 ;
               3'd2 :  decoder_out = 8'd5 ;
               3'd3 :  decoder_out = 8'd4 ;
               3'd4 :  decoder_out = 8'd3 ;
               3'd5 :  decoder_out = 8'd2 ;
               3'd6 :  decoder_out = 8'd1 ;
               3'd7 :  decoder_out = 8'd0 ;
            endcase;
         end
   end

endmodule

