`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 15:20:00
// Design Name: 
// Module Name: decode3_8
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


module decode3_8(
   input [2:0] decode,
   input [2:0] enable,
   output logic [7:0] res
);

always_comb begin
   if (enable == 3'b100) begin
    case (decode)
        3'b000: res = 11111110;
        3'b001: res = 11111101;
        3'b010: res = 11111011;
        3'b011: res = 11110111;
        3'b100: res = 11101111;
        3'b101: res = 11011111;
        3'b110: res = 10111111;
        3'b111: res = 01111111;
    endcase
     end
   else res = 8'b11111111;
end

endmodule