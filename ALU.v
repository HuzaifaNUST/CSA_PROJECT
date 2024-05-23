`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 02:43:17 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
 output reg [31:0] data_out,
 input [31:0] Rs1,
 input [31:0] Rs2,
 input [5:0] opcode
 );
always@(Rs1, Rs2, opcode)
begin
case(opcode)
6'b000000: data_out = Rs1+Rs2;
6'b000001: data_out = Rs1-Rs2;
6'b000010: data_out = Rs1*Rs2;
6'b000011: data_out = ~Rs1;
default: data_out = 6'd0;
endcase
end
endmodule