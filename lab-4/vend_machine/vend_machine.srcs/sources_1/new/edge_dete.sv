`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/25 08:44:21
// Design Name: 
// Module Name: edge_dete
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


module edge_dete(
    input sys_clk,
    input sys_rst_n,
    input i_start,
    output logic start_flag
);

logic dff0_Q, dff1_Q;

always_ff@(posedge sys_clk) begin
    if(sys_rst_n) begin
        dff0_Q <= i_start;
        dff1_Q <= dff0_Q;
    end

    else begin
        dff0_Q <= 0;
        dff1_Q <= 0;  
    end
end

    assign start_flag = (~dff1_Q)&dff0_Q;

endmodule
