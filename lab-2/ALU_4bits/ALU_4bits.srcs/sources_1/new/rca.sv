`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/15 08:30:26
// Design Name: 
// Module Name: rca
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

// ripple-carry adder
module rca(
    input logic A [3:0],
    input logic B [3:0],
    output logic res [7:0]
    );
    logic a, b, c;
    
    // 4 bits adder
    fulladder bit_0 (.A(A[0]), .B(B[0]), .C_in(0), .S(res[0]), .C_out(a));
    fulladder bit_1 (.A(A[1]), .B(B[1]), .C_in(a), .S(res[1]), .C_out(b));
    fulladder bit_2 (.A(A[2]), .B(B[2]), .C_in(b), .S(res[2]), .C_out(c));
    fulladder bit_3 (.A(A[3]), .B(B[3]), .C_in(c), .S(res[3]), .C_out(res[4]));
endmodule
