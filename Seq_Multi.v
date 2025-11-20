`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2025 09:20:57 AM
// Design Name: Sequential Multiplier 
// Module Name: Seq_Multi
// Project Name: Multiplier
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


module Seq_Multi(
    input clk,
    input [3:0] a,
    input [3:0] b,
    output reg [7:0] p
);


    reg [1:0] PS, NS;
    parameter S0_IDLE = 2'b00, S1_MUL  = 2'b01, S2_NEXT = 2'b10, S3_DONE = 2'b11;


    reg [7:0] partial_product, next_partial;
    reg [7:0] multiplicand, next_multiplicand;
    reg [3:0] operand_bb, next_operand_bb;
    reg [2:0] shift_count, next_shift_count;
    
    initial begin
        PS = S0_IDLE;
        partial_product = 0;
        multiplicand = 0;
        operand_bb = 0;
        shift_count = 0;
        p = 0;
    end
    
    always @(posedge clk) begin
        PS <= NS;
        partial_product <= next_partial;
        multiplicand <= next_multiplicand;
        operand_bb <= next_operand_bb;
        shift_count <= next_shift_count;

        if (PS == S3_DONE)
            p <= partial_product;
    end


    always @(*) begin
        NS = PS;
        next_partial = partial_product;
        next_multiplicand = multiplicand;
        next_operand_bb = operand_bb;
        next_shift_count = shift_count;

        case (PS)

            S0_IDLE: begin
                next_partial = 0;
                next_shift_count = 0;
                next_multiplicand = {4'b0000, a};
                next_operand_bb = b;
                NS = S1_MUL;
            end

            S1_MUL: begin
                if (shift_count < 4) begin
                    if (operand_bb[0])
                        next_partial = partial_product + multiplicand;

                    next_operand_bb   = operand_bb >> 1;
                    next_multiplicand = multiplicand << 1;
                    next_shift_count  = shift_count + 1;

                    NS = S2_NEXT;
                end
            end

            S2_NEXT: begin
                if (shift_count == 4)
                    NS = S3_DONE;
                else
                    NS = S1_MUL;
            end

            S3_DONE: begin
                NS = S0_IDLE; 
            end

        endcase
    end

endmodule