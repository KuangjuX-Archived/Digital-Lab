`timescale 1ns / 1ps

module dig_clock(
    input                   sys_clk,
    input                   sys_rst_n,
    input                   i_start,
    output logic [3 : 0]    an,
    output logic [7 : 0]    a_to_g
    );
    
    logic clk_1MS;
    logic start_flag;
    logic [7 : 0]   min, sec, bcd_min, bcd_sec;
    logic [3 : 0]   x7seg_data;


    clk_en U0(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        .clk_out (clk_1MS)
    );

    DFF_N U1(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        .i_start (i_start),
        .start_flag (start_flag)
    );

    timing U2(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        .i_start (start_flag),
        .min (min),
        .sec (sec)
    );

    bin2bcd_0 U3(
        .bin (min),
        .bcd (bcd_min)
    );

    bin2bcd_0 U4(
        .bin (sec),
        .bcd (bcd_sec)
    );

    x7seg_scan U5(
        .sys_clk (sys_clk),
        .sys_rst_n (sys_rst_n),
        .clk_flag (clk_1MS),
        .min (bcd_min),
        .sec (bcd_sec),
        .x7seg_data (x7seg_data),
        .an (an)
    );

    x7seg_dec U6(
        .D (x7seg_data),
        .a_to_g (a_to_g)
    );

    initial begin 
        $monitor($time, "clk_1MS = %b min = %b sec = %b", clk_1MS, min, sec);
    end
 
    
endmodule