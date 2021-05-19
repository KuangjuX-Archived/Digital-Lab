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
    input sys_rst_n,
    input i_start,
    output logic start_flag
    );

    logic dff0_Q;
    logic dff1_Q;
    always_ff@(posedge sys_clk, posedge sys_rst_n)
        if(sys_rst_n) begin 
            dff0_Q <= i_start;
            dff1_Q <= dff0_Q;
        end
        else if(!sys_rst_n) begin 
            dff0_Q <= 0;
            dff1_Q <= 1;
        end
    assign start_flag = (~dff1_Q)&dff0_Q;

endmodule
