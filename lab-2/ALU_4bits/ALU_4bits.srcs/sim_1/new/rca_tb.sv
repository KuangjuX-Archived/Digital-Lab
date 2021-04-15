`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/15 11:22:31
// Design Name: 
// Module Name: rca_tb
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


module rca_tb();
    logic [3:0] A;
    logic [3:0] B;
    logic [7:0] r;
    
    rca test (.A({A[3],A[2],A[1],A[0]}), .B({B[3],B[2],B[1],B[0]}), .res({r[7],r[6],r[5],r[4],r[3],r[2],r[1].r[0]}));
    initial begin
        A=4'd0;B=4'd0;#100;
        A=4'd1;B=4'd1;#100;
        A=4'd3;B=4'd3;#100;
        A=4'd4;B=4'd3;#100;
        A=4'd5;B=4'd7;#100;
    end
    
    
    initial begin
        $monitor($time, "A=%d, B=%d, res=%d",A, B, r );
    end
endmodule
