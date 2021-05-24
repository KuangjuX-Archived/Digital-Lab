`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/13 11:23:12
// Design Name: 
// Module Name: timing
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


module timing #(parameter MAX_SEC = 59, MAX_MIN = 59, MAX_COUNT = 25000000) (
    input sys_clk, 
    input sys_rst_n,
    input start_flag,
    output logic [7:0] min,
    output logic [7:0] sec
    );
    
    logic [31 : 0] r_cnt;
    logic state;
   
    always_ff@(posedge sys_clk) begin 
        if(!sys_rst_n) state = 1'b0;
        else if(start_flag) state = ~state;
    end

    always_ff@(posedge sys_clk) begin
        // reset 
        if(!sys_rst_n) begin
            min = 8'd0;
            sec = 8'd0;
        end

        // timing
        else if(state) begin 
            if (r_cnt < MAX_COUNT - 1) r_cnt <= r_cnt + 1;
            else if(r_cnt == MAX_COUNT - 1) begin  
                r_cnt <= 0;
                if(sec == MAX_SEC) begin 
                    sec <= 0;
                    min <= min + 1;
                end
                else if(sec < MAX_SEC) sec <= sec + 1;
                else if(min == MAX_MIN) min <= 0;
            end
        end

        else if(!state) begin
            min <= min;
            sec <= sec;
        end
    end

endmodule
