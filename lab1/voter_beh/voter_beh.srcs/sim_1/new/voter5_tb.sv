`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 17:39:53
// Design Name: 
// Module Name: voter5_tb
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


module voter5_tb();
    logic a,b,c,d,e;
    logic y;
    voter5 test (.L({a, b, c, d, e}), .led(y));

    initial begin 
        a=0;b=0;c=0;d=0;e=0; #10;
        a=0;b=0;c=0;d=0;e=1; #10;
        a=0;b=0;c=0;d=1;e=0; #10;
        a=0;b=0;c=0;d=1;e=1; #10;
        a=0;b=0;c=1;d=0;e=0; #10;
        a=0;b=0;c=1;d=0;e=1; #10;
        a=0;b=0;c=1;d=1;e=0; #10;
        a=0;b=0;c=1;d=1;e=1; #10;
        a=0;b=1;c=0;d=0;e=0; #10;
        a=0;b=1;c=0;d=0;e=1; #10;
        a=0;b=1;c=0;d=1;e=0; #10;
        a=0;b=1;c=0;d=1;e=1; #10;
        a=0;b=1;c=1;d=0;e=0; #10;
        a=0;b=1;c=1;d=0;e=1; #10;
        a=0;b=1;c=1;d=1;e=0; #10;
        a=0;b=1;c=1;d=1;e=1; #10;
        
        a=1;b=0;c=0;d=0;e=0; #10;
        a=1;b=0;c=0;d=0;e=1; #10;
        a=1;b=0;c=0;d=1;e=0; #10;
        a=1;b=0;c=0;d=1;e=1; #10;
        a=1;b=0;c=1;d=0;e=0; #10;
        a=1;b=0;c=1;d=0;e=1; #10;
        a=1;b=0;c=1;d=1;e=0; #10;
        a=1;b=0;c=1;d=1;e=1; #10;
        a=1;b=1;c=0;d=0;e=0; #10;
        a=1;b=1;c=0;d=0;e=1; #10;
        a=1;b=1;c=0;d=1;e=0; #10;
        a=1;b=1;c=0;d=1;e=1; #10;
        a=1;b=1;c=1;d=0;e=0; #10;
        a=1;b=1;c=1;d=0;e=1; #10;
        a=1;b=1;c=1;d=1;e=0; #10;
        a=1;b=1;c=1;d=1;e=1; #10;
//          a=1;b=0;c=1;d=0;e=1; #10;
    end

    initial begin
        $monitor($time, "a = %b, b = %b, c = %b, d = %b, e = %b, y = %b", a, b, c, d, e, y);
    end

endmodule
