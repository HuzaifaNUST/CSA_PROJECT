`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 02:40:32 PM
// Design Name: 
// Module Name: PC
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

module PC (
    input clk,
    input rst,
    input PCWrite,
    input [31:0] PC_next,
    output reg [31:0] PC_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            PC_out <= 0;
        end else if (PCWrite) begin
            PC_out <= PC_next;
        end
    end
endmodule

