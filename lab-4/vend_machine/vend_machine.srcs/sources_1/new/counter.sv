`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/25 09:16:28
// Design Name: 
// Module Name: counter
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


module counter(
    input sys_clk,
    input sys_rst_n,
    input coin5_flag,
    input coin10_flag,
    output logic [7 : 0] coin5_cnt,
    output logic [7 : 0] coin10_cnt
);
    always_ff@(posedge sys_clk) begin
        if(sys_rst_n) begin 
            if(coin5_flag) coin5_cnt <= coin5_cnt + 1;
            else if(coin10_flag) coin10_cnt <= coin10_cnt + 1;
        end

        else begin 
            coin5_cnt <= 0;
            coin10_cnt <= 0;
        end
    end

endmodule
