`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/19 11:13:21
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
    input [7 : 0] min,
    input [7 : 0] sec,
    output logic [3 : 0] x7seg_data,
    output logic [3 : 0] an
    );

    always_ff@(posedge sys_clk)
        if(!sys_rst_n) begin 
            an <= 4'd1;
        end

        else if(sys_rst_n && clk_flag) begin 
            if(an == 8) an <= 4'd1;
            else an <= (an << 1);
        end

    
    always@(*) begin 
        if(an == 1) x7seg_data = sec[3 : 0];
        else if(an == 2) x7seg_data = sec[7 : 4];
        else if(an == 4) x7seg_data = min[3 : 0];
        else if(an == 8) x7seg_data = min[7 : 4];
    end
endmodule
