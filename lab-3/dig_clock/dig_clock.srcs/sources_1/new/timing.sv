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


module timing #(parameter MAX_SEC = 59, MAX_MIN = 59) (
    input sys_clk, 
    input sys_rst_n,
    input i_start,
    output logic [7:0] min,
    output logic [7:0] sec
    );
    

    always_ff@(posedge sys_clk, posedge sys_rst_n, posedge i_start)
        // reset 
        if(!sys_rst_n) begin
            min = 8'd0;
            sec = 8'd0;
        end

        // timing
        else if(i_start && sys_rst_n) begin 
            sec = sec + 1;
            if(sec == 60) begin  
                min <= min + 1;
                sec <= 0;
            end
        end

        // stop timing
        else if(!i_start && sys_rst_n) begin 
            sec <= sec;
            min <= min;
        end

endmodule
