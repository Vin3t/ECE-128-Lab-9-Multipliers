`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2025 08:45:41 AM
// Design Name: 
// Module Name: Comb_Multi_tb
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


module Comb_Multi_tb;
    reg  [3:0] a, b;
    wire [7:0] p;

    Comb_Multi dut(a, b, p);

    initial begin
        // Test 1: 3×5=15
        a = 4'd3; b = 4'd5; #10;

        // Test 2: 8×9=72
        a = 4'd8; b = 4'd9; #10;

        // Test 3: 12×12=144
        a = 4'd12; b = 4'd12; #10;

        // Test 4: 1×15=225
        a = 4'd15; b = 4'd15; #10;

        $finish;
    end
endmodule
