`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/25 09:38:09
// Design Name: 
// Module Name: FSM
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


module FSM #(parameter MAX_CNT = 250000000)(
    input sys_clk,
    input sys_rst_n,
    input [7 : 0] coin5_cnt,
    input [7 : 0] coin10_cnt,
    output logic [7 : 0] price,
    output logic [7 : 0] change,
    output logic open
    );

    logic [31 : 0] cnt;

    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) cnt <= 32'd0;
        else begin
            if(open) begin
                if(cnt < MAX_CNT) cnt <= cnt + 1;
                else if(cnt == MAX_CNT - 1) begin
                    cnt <= 32'd0;
                    open <= 0;
                end
            end
        end
    end

    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) begin
            price <= 8'd0;
            change <= 8'd0;
            open <= 0;
        end
        else begin
            if(coin5_cnt == 1 && coin10_cnt == 0) begin
                price <= 8'd5;
                change <= 8'd0;
                open <= 0;
            end
            else if(coin5_cnt == 2 && coin10_cnt == 0) begin
                price <= 8'd10;
                change <= 8'd0;
                open <= 0;
            end
            else if(coin10_cnt == 1 && coin5_cnt == 0) begin
                price <= 8'd10;
                change <= 8'd0;
                open <= 0;
            end
            else if(coin5_cnt == 1 && coin5_cnt == 1) begin
                price <= 8'd15;
                change <= 8'd0;
                open <= 1;
            end
            else if(coin5_cnt == 3 && coin10_cnt == 0) begin
                price <= 8'd15;
                change <= 8'd0;
                open <= 1;
            end
            else if(coin5_cnt == 0 && coin10_cnt == 2) begin
                price <= 8'd20;
                change <= 8'd5;
                open <= 1;
            end
        end
    end

endmodule
