`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/25 09:03:25
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


module clk_en #(parameter N = 25000) (
    input sys_clk,
    input sys_rst_n,
    output logic clk_out
);

    logic [31 : 0] r_cnt;

    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) r_cnt <= 0;
        else if(r_cnt == N-1) r_cnt <= 0;
        else r_cnt <= r_cnt + 1;
    end

    always_ff@(posedge sys_clk) begin 
        if(!sys_rst_n) clk_out <= 1'b0;
        else if(r_cnt == N-1) clk_out <= 1'b1;
        else clk_out <= 1'b0;
    end
    
endmodule

