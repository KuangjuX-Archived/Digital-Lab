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
    logic [4:0] input_tb [32: 0];
    voter5 test (.I({a, b, b, d, e}));
    int i;

    initial begin
        $readmemb("test.txt", input_tb);
        for (i = 0; i < 32; i++)begin
            {a, b, c, d, e} = input_tb[i]; #10;
        end
    end

    initial begin
        $monitor($time, "a = %b, b = %b, c = %b, d = %b, e = %b", a, b, c, d, e);
    end

endmodule
