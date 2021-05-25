`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/25 21:04:50
// Design Name: 
// Module Name: x7seg_dec
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


module x7seg_dec(
    input [3 : 0] D,
    output logic [7 : 0] a_to_g
    );
    always@(*) begin 
        unique case(D)
            4'd0: a_to_g = 8'b11000000;
            4'd1: a_to_g = 8'b11111001;
            4'd2: a_to_g = 8'b10100100;
            4'd3: a_to_g = 8'b10110000;
            4'd4: a_to_g = 8'b10011001;
            4'd5: a_to_g = 8'b10010010;
            4'd6: a_to_g = 8'b10000010;
            4'd7: a_to_g = 8'b11111000;
            4'd8: a_to_g = 8'b10000000;
            4'd9: a_to_g = 8'b10010000;
        endcase
    end
    
endmodule

