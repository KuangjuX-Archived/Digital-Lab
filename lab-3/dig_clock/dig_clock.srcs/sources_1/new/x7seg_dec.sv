`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/19 11:21:29
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
            4'd1: a_to_g = 8'b00000110;
            4'd2: a_to_g = 8'b01011011;
            4'd3: a_to_g = 8'b01001111;
            4'd4: a_to_g = 8'b01100110;
            4'd5: a_to_g = 8'b01101101;
            4'd6: a_to_g = 8'b01111101;
            4'd7: a_to_g = 8'b00000111;
            4'd8: a_to_g = 8'b01111111;
        endcase
    end
    
endmodule
