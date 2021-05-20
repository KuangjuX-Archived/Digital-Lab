`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/19 14:29:58
// Design Name: 
// Module Name: dig_clock_tb
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

`define CLK_PERIOD 10
module dig_clock_tb();
    logic sys_clk, sys_rst_n, i_start;
    logic [3 : 0] an;
    logic [7 : 0] a_to_g;

    dig_clock Unit(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .i_start(i_start),
        .an(an),
        .a_to_g(a_to_g)
    );

    initial begin
        sys_clk <= 1'b0;
        sys_rst_n <= 1'b0;
        i_start <= 1'b0;
        #100;
        sys_rst_n <= 1'b1;
    end

    always #(`CLK_PERIOD/2) sys_clk = ~sys_clk;

    initial begin
        @(posedge sys_rst_n);
    @(posedge sys_clk);

                repeat(1000) begin
                    @(posedge sys_clk);
                i_start <= {$random}%2;
                end 
        $finish;
    end

endmodule
