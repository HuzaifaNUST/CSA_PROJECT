`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 02:32:51 PM
// Design Name: 
// Module Name: Hazard_Detection_Unit
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

module Hazard_Detection_Unit(
    input [5:0] ID_EX_opcode,
    input [4:0] ID_EX_rs1,
    input [4:0] ID_EX_rs2,
    input [4:0] IF_ID_rs1,
    input [4:0] IF_ID_rs2,
    output reg PCWrite,
    output reg IF_ID_Write,
    output reg ControlMux
);
    always @(*) begin
        if ((ID_EX_opcode != 6'b000000) && (ID_EX_opcode != 6'b000010) &&
            ((ID_EX_rs1 == IF_ID_rs1) || (ID_EX_rs2 == IF_ID_rs2))) begin
            PCWrite = 1'b0;
            IF_ID_Write = 1'b0;
            ControlMux = 1'b1;
        end else begin
            PCWrite = 1'b1;
            IF_ID_Write = 1'b1;
            ControlMux = 1'b0;
        end
    end
endmodule
