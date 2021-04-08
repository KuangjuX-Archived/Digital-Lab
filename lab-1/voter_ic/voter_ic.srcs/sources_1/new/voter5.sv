`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 16:32:00
// Design Name: 
// Module Name: voter5
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


module voter5(
    input logic [4:0] referee,
    output logic led
    );
    logic [3:0] Y;
    logic [7:0] a, b, c, d;

    // Use 2_4 decoder to 2 judger
    dec_74LS139 decode_24_1 (.S(1), .D({referee[0], referee[1]}), .Y(Y));

    // 3-8 decode to 3 judger
    dec_74LS138 decode_38_1 (.decode({referee[4], referee[3], referee[2]}), .enable({1, Y[3]}), .res(a));
    dec_74LS138 decode_38_2 (.decode({referee[4], referee[3], referee[2]}), .enable({1, Y[2]}), .res(b));
    dec_74LS138 decode_38_3 (.decode({referee[4], referee[3], referee[2]}), .enable({1, Y[1]}), .res(c));
    dec_74LS138 decode_38_4 (.decode({referee[4], referee[3], referee[2]}), .enable({1, Y[0]}), .res(d));

endmodule
