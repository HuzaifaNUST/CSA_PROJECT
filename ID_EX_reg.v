`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 02:28:10 PM
// Design Name: 
// Module Name: EX_MEM_reg
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


module EX_MEM_reg(
    input clk,
    input rst,
    input [31:0] instr_in,
    input [31:32] pc_in,
    input [31:0] ALU_Out_in,
    input [31:0] rdata2_in,
    input [4:0] rd_in,
    input [5:0] opcode_in,
    output reg [31:0] instr_out,
    output reg [31:0] pc_out,
    output reg [31:0] ALU_Out_out,
    output reg [31:0] rdata2_out,
    output reg [4:0] rd_out,
    output reg [5:0] opcode_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            instr_out <= 32'b0;
            pc_out <= 32'b0;
            ALU_Out_out <= 32'b0;
            rdata2_out <= 32'b0;
            rd_out <= 5'b0;
            opcode_out <= 6'b0;
        end else begin
            instr_out <= instr_in;
            pc_out <= pc_in;
            ALU_Out_out <= ALU_Out_in;
            rdata2_out <= rdata2_in;
            rd_out <= rd_in;
            opcode_out <= opcode_in;
        end
    end
endmodule