`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/25 20:30:27
// Design Name: 
// Module Name: x7seg_scan
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


module x7seg_scan(
    input sys_clk,
    input sys_rst_n,
    input clk_flag,
    input [7 : 0] price,
    input [7 : 0] change,
    output logic [3 : 0] x7seg_data,
    output logic [3 : 0] an
    );

    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) an <= 4'd1;
        else if(clk_flag) an <= {an[2 : 0], an[3]};
    end

    always@(*) begin
        if(an == 1) x7seg_data <= price[3 : 0];
        else if(an == 2) x7seg_data <= price[7 : 4];
        else if(an == 4) x7seg_data <= change[3 : 0];
        else if(an == 8) x7seg_data <= change[7 : 4];
    end
endmodule
