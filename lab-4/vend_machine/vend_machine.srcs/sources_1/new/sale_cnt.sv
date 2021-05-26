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


module sale_cnt #(parameter MAX_CNT = 250000000)(
    input sys_clk,
    input sys_rst_n,
    input start_flag,
    output logic state
    );
    logic [31 : 0] cnt;


    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) begin
            cnt <= 0;
            state <= 0;
        end
        else if(start_flag) begin
           if(cnt < MAX_CNT - 1) cnt <= cnt + 1;
           else begin
                cnt <= 0;
                state <= 1;
           end
        end
        else if(!start_flag) begin
            cnt <= 0;
            state <= 0;
        end
    end

endmodule
