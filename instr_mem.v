`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 02:41:15 PM
// Design Name: 
// Module Name: instr_mem
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

module instr_mem(
 output reg [31:0] instr,
 input clk,
 input rst,
 input [31:0] PC
 );
reg [31:0] memory [31:0];
// format for ROM:: memory[0] = 32'b000000 00001 00000 00100 00000 000000;
initial begin
memory[0] = 32'b000000_00001_00000_00100_00000_000000;
memory[1] = 32'b000001_00001_00000_00100_00000_000000;
memory[2] = 32'b000010_00001_00000_00100_00000_000000;
memory[3] = 32'b000011_00001_00000_00100_00000_000000;
memory[4] = 32'b000000_00001_00000_00100_00000_000000;
memory[5] = 32'b000000_00001_00000_00100_00000_000000;
memory[6] = 32'b000000_00001_00000_00100_00000_000000;
memory[7] = 32'b000000_00001_00000_00100_00000_000000;
end
always@(posedge clk, posedge rst)
begin
if(rst)
instr = 0;
else
instr = memory[PC>>2];
end
endmodule
