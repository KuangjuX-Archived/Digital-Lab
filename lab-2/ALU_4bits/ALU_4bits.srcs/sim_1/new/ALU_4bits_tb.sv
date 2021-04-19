`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/15 10:27:09
// Design Name: 
// Module Name: ALU_4bits_tb
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


module ALU_4bits_tb();
    logic [3:0] A, B, aluop;
    logic [7:0] alures;
    logic ZF, OF;
    
    alu alu_test(.A(A), .B(B), .aluop(aluop), .alures(alures), .OF(OF), .ZF(ZF));
    
    initial begin
        // AND
        A=4'b0001;B=4'b0001;aluop=4'b0000;#100;
        // OR
        A=4'b0000;B=4'b0001;aluop=4'b0001;#100;
        // SLL
        A=4'b1111;B=4'b0001;aluop=4'b0101;#100;
        // SRL
        A=4'b0111;B=4'b0001;aluop=4'b0110;#100;
        // SRA
        A=4'b1001;B=4'd1;aluop=4'b0111;#100;
        // MULU
        A=4'd4;B=4'd7;aluop=4'b1000;#100;
        // MUL
        A=4'b1110;B=4'b1100;aluop=4'b1001;#100;
        A=4'b0110;B=4'b1100;aluop=4'b1001;#100;
        // ADD
        A=4'b1111;B=4'b1111;aluop=4'b1010;#100;
        A=4'b0111;B=4'b0111;aluop=4'b1010;#100;
        // ADDU
        A=4'b1111;B=4'b1111;aluop=4'b1010;#100;
        A=4'b0111;B=4'b0111;aluop=4'b1010;#100;
        // SUBU
        A=4'd15;B=4'd15;aluop=4'b1101;#100;
    end
    
    initial begin 
        $monitor($time, "A=%d B=%d aluop=%b alures=%d OF=%d, ZF=%d", A, B, aluop, alures, OF, ZF);
    end
endmodule
