`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/25 09:38:09
// Design Name: 
// Module Name: FSM
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


module FSM #(parameter MAX_CNT = 250000000)(
    input sys_clk,
    input sys_rst_n,
    input coin5_flag,
    input coin10_flag,
    input reset_flag,
    output logic [7 : 0] price,
    output logic [7 : 0] change,
    output logic open
    );

    // state:
    // 0 : 0;
    // 1 : 5;
    // 2 : 10;
    // 3 : 15;
    // 4 : 20
    logic [3 : 0] current_state, next_state;
    always_ff@(posedge sys_clk) begin
        if(!sys_rst_n) current_state <= 4'd0;
        else current_state <= next_state;
    end

    always_ff@(posedge sys_clk) begin
        if(!sys_clk) begin
            price <= 8'd0;
            change <= 8'd0;
            open <= 1'b0;
        end

        else begin
            case(current_state)
            4'd0: begin
                if(coin5_flag) next_state <= 4'd1;
                else if(coin10_flag) next_state <= 4'd2;
            end
            4'd1: begin
                if(coin5_flag) next_state <= 4'd2;
                else if(coin10_flag) next_state <= 4'd3;
            end
            4'd2: begin
                if(coin5_flag) next_state <= 4'd3;
                else if(coin10_flag) next_state <= 4'd4;
            end
            4'd3: begin
                if(reset_flag) next_state <= 4'd0;
            end
            4'd4: begin
                if(reset_flag) next_state <= 4'd0;
            end
        endcase
        end
    end

    always_ff@(*) begin
        if(!sys_rst_n) begin
            price = 8'd0;
            change = 8'd0;
            open = 1'b0;
        end

        else begin
            case(next_state)
                4'd0: begin
                    price = 8'd0;
                    change = 8'd0;
                    open = 1'b0;
                end

                4'd1: begin
                    price = 8'd5;
                    change = 8'd0;
                    open = 1'b0;
                end

                4'd2: begin
                    price = 8'd10;
                    change = 8'd0;
                    open = 1'b0;
                end

                4'd3: begin
                    price = 8'd15;
                    change = 8'b0;
                    open = 1'b1;
            
                end

                4'd4: begin 
                    price = 8'd20;
                    change = 8'd5;
                    open = 1'b1;
                end
            endcase   
        end
    end

endmodule
