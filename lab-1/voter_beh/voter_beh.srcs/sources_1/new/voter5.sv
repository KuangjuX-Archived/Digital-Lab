`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/02 17:10:50
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
    input logic [4:0] L,
    output logic led
    );
    assign led = (L[0]&L[1]&L[2])||(L[0]&L[1]&L[3])||(L[0]&L[1]&L[4])
    ||(L[0]&L[2]&L[3])||(L[0]&L[2]&L[4])||(L[0]&L[3]&L[4])||(L[1]&L[2]&L[3])
    ||(L[1]&L[2]&L[4])||(L[1]&L[3]&L[4])||(L[2]&L[3]&L[4]);
endmodule
