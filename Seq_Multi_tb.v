`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh University
// Engineer: Vincent Langford
// 
// Create Date: 11/18/2025 01:11:45 AM
// Design Name: Sequential Multiplier
// Module Name: Seq_Multi_tb
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
module Seq_Multi_tb;

    reg clk = 0;
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] p;
    
    Seq_Multi dut(.clk(clk),.a(a),.b(b),.p(p));
    
    always #5 clk = ~clk;
    
    reg [2:0] test_count = 0;   // Track which test we're on
    reg [3:0] wait_count = 0;   // Wait for FSM to finish

    always @(posedge clk) begin
        case (test_count)
            0: begin
                a <= 4'd3; b <= 4'd5;
                wait_count <= wait_count + 1;
                if (wait_count == 12) begin
                    test_count <= 1;
                    wait_count <= 0;
                end
            end

            1: begin
                a <= 4'd8; b <= 4'd9;
                wait_count <= wait_count + 1;
                if (wait_count == 12) begin
                    test_count <= 2;
                    wait_count <= 0;
                end
            end

            2: begin
                a <= 4'd12; b <= 4'd12;
                wait_count <= wait_count + 1;
                if (wait_count == 12) begin
                    test_count <= 3;
                    wait_count <= 0;
                end
            end

            3: begin
                a <= 4'd15; b <= 4'd15;
                wait_count <= wait_count + 1;
                if (wait_count == 12) begin
                    $finish;
                end
            end
        endcase
    end

endmodule