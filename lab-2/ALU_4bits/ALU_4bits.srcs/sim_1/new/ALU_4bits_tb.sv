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
    int i;
    int length = 22;
    logic [11:0] stim[22:0];
    
    initial begin
        //  // AND
        //  A=4'b0001;B=4'b0001;aluop=4'b0000;#10;
        //  // OR
        //  A=4'b0000;B=4'b0001;aluop=4'b0001;#10;
        //  // XOR
        //  A=4'b0001;B=4'b0000;aluop=4'b0010;#10;
        //  // NAND
        //  A=4'b0001;B=4'b0001;aluop=4'b0011;#10;
        //  // NOT
        //  A=4'b0001;B=4'b0000;aluop=4'b0100;#100;
        //  // SLL
        //  A=4'b1111;B=4'b0001;aluop=4'b0101;#10;
        //  // SRL
        //  A=4'b0111;B=4'b0001;aluop=4'b0110;#10;
        //  // SRA
        //  A=4'b1001;B=4'd1;aluop=4'b0111;#10;
        //  // MULU
        //  A=4'd4;B=4'd7;aluop=4'b1000;#10;
        //  // MUL
        //  A=4'b1110;B=4'b1100;aluop=4'b1001;#10;
        //  A=4'b0110;B=4'b1100;aluop=4'b1001;#10;
        //  // ADD
        //  A=4'b1111;B=4'b1111;aluop=4'b1010;#10;
        //  A=4'b0111;B=4'b0111;aluop=4'b1010;#10;
        //  A=4'b0001;B=4'b0001;aluop=4'b1010;#10;
        //  // ADDU
        //  A=4'b1111;B=4'b1111;aluop=4'b1010;#10;
        //  A=4'b0111;B=4'b0111;aluop=4'b1010;#10;
        //  // SUB
        //  A=4'b0111;B=4'b0011;aluop=4'b1100;#10;
        //  A=4'b1111;B=4'b0111;aluop=4'b1100;#10;
        //  // SUBU
        //  A=4'd15;B=4'd15;aluop=4'b1101;#10;
        //  A=4'd7;B=4'd3;aluop=4'b1101;#10;
        //  // SLT
        //  A=4'b1100;B=4'b0100;aluop=4'b1110;#10;
        //  A=4'b0111;B=4'b0110;aluop=4'b1110;#10;
        //  // SLTU
        //  A=4'b1100;B=4'b0100;aluop=4'b1111;#10;
       $readmemb("test.txt", stim);
       for(i=0; i<length; i++) 
       begin
           {A, B, aluop} = stim[i];#10;
       end
    end
    
    initial begin 
        $monitor($time, "A=%d B=%d aluop=%b binary alures=%b alures=%d OF=%d, ZF=%d", A, B, aluop, alures, alures, OF, ZF);
    end
endmodule
