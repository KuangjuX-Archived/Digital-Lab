`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 16:19:44
// Design Name: 
// Module Name: dec_74LS139
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


module dec_74LS139(
    input logic S,
    input logic [1:0] D,
    output logic [3:0] Y
    );

    always_comb begin
        if (S == 1) Y = 4'b1111;
        else 
            begin
                case (D)
                    2'b00: Y = 4'b1110;
                    2'b01: Y = 4'b1101;
                    3'b10: Y = 4'b1011; 
                    4'b11: Y = 4'b0111;
                endcase
            end 
    end

endmodule
