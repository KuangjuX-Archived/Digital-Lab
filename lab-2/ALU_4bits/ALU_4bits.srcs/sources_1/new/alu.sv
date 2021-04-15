`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/15 08:30:53
// Design Name: 
// Module Name: alu
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


module alu(
    input [3:0] A,
    input [3:0] B,
    input [3:0] aluop,
    output logic [7:0] alures,
    output logic ZF,
    output logic OF
    );
    
    always_comb begin
        unique case(aluop)
            4'b0000: alures = A & B;
            4'b0001: alures = A | B;
            4'b0010: alures = A ^ B;
            4'b0011: alures = ~(A & B);
            4'b0100: alures = ~A;
            4'b0101: alures = A << B;
            4'b0110: alures = A >> B;
            4'b0111: alures = A >>> B;
            4'b1000: alures = A * B;
            default: alures = '0;
        endcase
    end
endmodule: alu
