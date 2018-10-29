//----------------------------------------------------------------------------------
// Company:
// Engineer:
//
// Create Date:      07/15/2018 08:38:09 PM
// Design Name:      Sequence_det : Detection of sequence "1011"
// Module Name:      Sequence - Behavioral
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
// Detecting Pattern "1011"
module sequence_det
 (
   input          resetn,            // input active low reset
   input          clock,             // clock
   input          data_in,           // serial input data
   output reg     output_valid       // output valid when it detects the sequence 1011
 );


// parameter
 parameter SIZE = 3;
 parameter S0 = 3'b000,
           S1 = 3'b001,
           S2 = 3'b010,
           S3 = 3'b100,
           S4 = 3'b101;

// reg decleration (internal signals)
   reg [SIZE -1:0] state;

always@( posedge clock or negedge resetn )
begin
   if( !resetn )
      begin
         state         <= S0;
         output_valid  <= 'b0;
      end
   else
      case ( state )
         S0 : if ( data_in == 'b0)
					begin
                  state        <= S0;
                  output_valid <= 'b0;
               end
              else
                begin
                  state        <=  S1;
                  output_valid <= 'b0;
                end

         S1 : if ( data_in ==  'b0 )
               begin
                  state         <= S2;
                  output_valid  <= 'b0;
               end
              else
               begin
                  state          <= S1;
                  output_valid   <= 'b0;
               end

         S2 : if ( data_in == 'b0 )
               begin
                   state <= S0;
               end
              else
               begin
                   state         <= S3;
                   output_valid  <= 'b0;
               end

         S3: if ( data_in == 'b0 )
               begin
                  state         <= S2;
                  output_valid  <= 'b0;
               end
             else
               begin
                  state          <= S0;
                  output_valid   <= 'b1;   //Output is asserted when the pattern "1011" is found in the sequence.
                  end

         default : state <= S0;
     endcase
end
endmodule





