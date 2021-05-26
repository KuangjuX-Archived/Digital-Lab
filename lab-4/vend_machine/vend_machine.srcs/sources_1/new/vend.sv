`timescale 1ns / 1ps

module vend(
    input sys_clk, sys_rst_n,
    input coin5, coin10,
    output logic [3 : 0] an,
    output logic [7 : 0] a_to_g,
    output logic open
    );

    logic clk_1MS;
    logic coin5_flag, coin10_flag;
    logic [7 : 0] coin5_cnt, coin10_cnt;
    logic [7 : 0] price, change;
    logic [7 : 0] price_bcd, change_bcd;
    logic [3 : 0] x7seg_data;
    logic open_flag;

    clk_en U1(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .clk_out(clk_1MS)
    );

    edge_dete U2(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .i_start(coin5),
        .start_flag(coin5_flag)
    );

    edge_dete U3(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .i_start(coin10),
        .start_flag(coin10_flag)
    );

    // counter U4(
    //     .sys_clk(sys_clk),
    //     .sys_rst_n(sys_rst_n),
    //     .coin5_flag(coin5_flag),
    //     .coin10_flag(coin10_flag),
    //     .coin5_cnt(coin5_cnt),
    //     .coin10_cnt(coin10_cnt)
    // );

    FSM U5(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .coin5_flag(coin5_flag),
        .coin10_flag(coin10_flag),
        .price(price),
        .change(change),
        .open(open)
    );

    bin2bcd_0 U6(
        .bin(price),
        .bcd(price_bcd)
    );

    bin2bcd_0 U7(
        .bin(change),
        .bcd(change_bcd)
    );

    x7seg_scan U8(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .clk_flag(clk_1MS),
        .price(price_bcd),
        .x7seg_data(x7seg_data),
        .an(an)
    );

    x7seg_dec U9(
        .D(x7seg_data),
        .a_to_g(a_to_g)
    );
  
endmodule