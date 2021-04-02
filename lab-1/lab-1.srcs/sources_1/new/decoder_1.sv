`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 13:19:56
// Design Name: 
// Module Name: decoder_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder_1(
   input [2:0] decode,
   input [2:0] enable,
   output [7:0] res
);

always_comb begin
   if (enable = 3'b100) {
      case (decode):
         3'b000: output = 11111110
         3'b001: output = 11111101
         3'b010: output = 11111011
         3'b011: output = 11110111
         3'b100: output = 11101111
         3'b101: output = 11011111
         3'b110: output = 10111111
         3'b111: output = 01111111
   }else {
      output = 8'b11111111
   }

end

endmodule
