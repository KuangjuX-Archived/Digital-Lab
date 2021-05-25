`timescale 1ns / 1ps

module vend(
    input sys_clk, sys_rst_n,
    input coin5, coin10,
    output [3 : 0] an,
    output [7 : 0] a_to_g,
    output open
    );

    logic clk_1MS;
    logic coin5_flag, coin10_flag;
    logic [7 : 0] coin5_cnt, coin10_cnt;
    logic [7 : 0] price, change;

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

    counter U4(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .coin5_flag(coin5_flag),
        .coin10_flag(coin10_flag),
        .coin5_cnt(coin5_cnt),
        .coin10_cnt(coin10_cnt)
    );

    FSM U5(
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .coin5_cnt(coin5_cnt),
        .coin10_cnt(coin10_cnt),
        .price(price),
        .change(change)
    );
    
    
endmodule