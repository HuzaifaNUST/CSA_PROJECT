`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 02:25:01 PM
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

module ID_EX_reg(
    input clk,
    input rst,
    input ControlMux,
    input [31:0] instr_in,
    input [31:0] pc_in,
    input [31:0] rdata1_in,
    input [31:0] rdata2_in,
    input [4:0] rs1_in,
    input [4:0] rs2_in,
    input [4:0] rd_in,
    input [5:0] opcode_in,
    output reg [31:0] instr_out,
    output reg [31:0] pc_out,
    output reg [31:0] rdata1_out,
    output reg [31:0] rdata2_out,
    output reg [4:0] rs1_out,
    output reg [4:0] rs2_out,
    output reg [4:0] rd_out,
    output reg [5:0] opcode_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            instr_out <= 32'b0;
            pc_out <= 32'b0;
            rdata1_out <= 32'b0;
            rdata2_out <= 32'b0;
            rs1_out <= 5'b0;
            rs2_out <= 5'b0;
            rd_out <= 5'b0;
            opcode_out <= 6'b0;
        end else if (!ControlMux) begin
            instr_out <= instr_in;
            pc_out <= pc_in;
            rdata1_out <= rdata1_in;
            rdata2_out <= rdata2_in;
            rs1_out <= rs1_in;
            rs2_out <= rs2_in;
            rd_out <= rd_in;
            opcode_out <= opcode_in;
        end
    end
endmodule