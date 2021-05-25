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
    input start_flag, 
    output logic [7 : 0] price,
    output logic [7 : 0] change,
    output logic open
    );
    logic [31 : 0] cnt;
    logic state;

    always@(*) begin
        if(start_flag) state = 1;
    end

    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) cnt <= 0;
        else begin
            if(state) begin
                if(cnt < MAX_COUNT) cnt <= cnt + 1;
                else begin
                    cnt <= 0;
                    state <= 0;
                    price <= 0;
                    change <= 0;
                    open <= 0;
                end
            end
        end
    end

endmodule
