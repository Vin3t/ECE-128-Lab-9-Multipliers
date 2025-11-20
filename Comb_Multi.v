`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2025 08:41:03 AM
// Design Name: 
// Module Name: Comb_Multi
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


module Comb_Multi(a,b,p);
    input [3:0] a,b;
    wire [3:0]m0;
    wire [4:0]m1;
    wire [5:0]m2;
    wire [6:0]m3;
    
    wire [7:0] s1,s2,s3;
    output [7:0] p;
    
assign m0 =  (a & {4{b[0]}});        // a * b0
    assign m1 = ((a & {4{b[1]}}) << 1);  // a * b1 << 1
    assign m2 = ((a & {4{b[2]}}) << 2);  // a * b2 << 2
    assign m3 = ((a & {4{b[3]}}) << 3);  // a * b3 << 3
    
    assign s1 = m0 + m1;
    assign s2 = s1 + m2;
    assign s3 = s2 + m3;
    assign p = s3;

endmodule
