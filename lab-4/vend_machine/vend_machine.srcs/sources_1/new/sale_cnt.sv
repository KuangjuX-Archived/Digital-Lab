`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/25 22:37:47
// Design Name: 
// Module Name: sale_cnt
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


module sale_cnt #(parameter MAX_COUNT = 250000000)(
    input sys_clk,
    input sys_rst_n,
    output logic [3 : 0] state
    );
    logic [31 : 0] cnt;


    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) cnt <= 0;
        else begin
           if(cnt < MAX_CNT - 1) cnt <= cnt + 1;
           else begin
                cnt <= 0;
                state <= 4'd0;
           end
        end
    end

endmodule
