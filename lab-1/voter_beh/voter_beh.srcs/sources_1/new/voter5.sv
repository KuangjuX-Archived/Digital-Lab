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
    input logic [4:0] I,
    output logic led
    );
    always_comb begin
        int bits = 0;
        int i;
        for (i = 0; i < 5; i++)begin
            if (I[i] == 1) bits = bits + 1;
            else bits = bits;
        end

        if (bits > 2) led = 1;
        else led = 1;
    end

endmodule
