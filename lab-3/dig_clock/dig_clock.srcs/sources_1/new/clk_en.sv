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


module clk_en #(parameter N = 10) (
    input sys_clk,
    input sys_rst_n,
    output logic clk_out
    );

    logic [31 : 0] count;
    
    always_ff@(posedge sys_clk)
        if(count < N-1 && sys_rst_n) count <= count + 1;
        else if(sys_rst_n && count == N-1) count <= 0;
        else if(!sys_rst_n) count <= 0;


    always@(*) begin
        if(sys_rst_n && count == 0) clk_out = ~clk_out;
        else if(sys_rst_n && count > 0) clk_out = clk_out;
        else if(!sys_rst_n) clk_out = 0;
    end
endmodule
