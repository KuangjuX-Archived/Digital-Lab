`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/16 14:10:53
// Design Name: 
// Module Name: DFF_N
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


module DFF_N (
    input sys_clk,
    input i_start,
    output logic pos_edge
    );

    logic dff0_Q;
    logic dff1_Q;
    always_ff@(posedge sys_clk)
        if(i_start) dff0_Q <= 1;
        else if(!i_start) dff0_Q <= 0;
    assign pos_edge = dff0_Q;

endmodule
