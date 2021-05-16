`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/15 21:49:31
// Design Name: 
// Module Name: clk_en
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


module clk_en (#parameter N = 25000000;) (
    input sys_clk,
    output clk_out
    );

    int count;
    initial begin 
        count = 0;
        clk_out = 0;
    end
    always_ff@(posedge sys_clk)
        if(count < N) count <= count + 1;
        else begin 
            count <= 0;
            clk_out <= !clk_out;
        end
endmodule
