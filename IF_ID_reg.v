`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 02:24:05 PM
// Design Name: 
// Module Name: IF_ID_reg
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

module IF_ID_reg(
    input clk,
    input rst,
    input IF_ID_Write,
    input [31:0] instr_in,
    input [31:0] pc_in,
    output reg [31:0] instr_out,
    output reg [31:0] pc_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            instr_out <= 32'b0;
            pc_out <= 32'b0;
        end else if (IF_ID_Write) begin
            instr_out <= instr_in;
            pc_out <= pc_in;
        end
    end
endmodule

