`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/15 11:07:46
// Design Name: 
// Module Name: fulladdr_tb
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


module fulladdr_tb();
    logic a, b, c, d, e;
    fulladder test (.A(a), .B(b), .C_in(c), .S(d), .C_out(e));
    
    initial begin 
        a=0;b=0;c=0;#100;
        a=1;b=0;c=0;#100;
        a=0;b=1;c=0;#100;
        a=1;b=1;c=0;#100;
        a=1;b=1;c=1;#100;
    end
    
    initial begin
        $monitor($time, "a = %b, b = %b, c = %b, d = %b, e = %b", a, b, c, d, e);
    end
endmodule
