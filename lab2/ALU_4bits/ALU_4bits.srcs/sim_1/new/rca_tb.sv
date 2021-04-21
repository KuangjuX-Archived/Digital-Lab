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
    logic [3:0] r;
    logic cout;
    
    rca test_1 (.cin(1), .A(A), .B(B), .res(r), .cout(cout));
    initial begin
        A=4'd0;B=4'd0;#100;
        A=4'd1;B=4'd1;#100;
        A=4'd3;B=4'd3;#100;
        A=4'd4;B=4'd3;#100;
        A=4'd5;B=4'd7;#100;
        A=4'd15;B=4'd15;#100;
    end
    
    
    initial begin
        $monitor($time, "A=%d, B=%d, res=%d, cout=%b",A, B, r, cout);
    end
endmodule
