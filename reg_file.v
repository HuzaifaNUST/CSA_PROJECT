`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 02:42:32 PM
// Design Name: 
// Module Name: reg_file
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

module reg_file (
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input clk,
    input rst,
    input w_e,
    input [31:0] data_in,
    output reg [31:0] rdata1,
    output reg [31:0] rdata2
);
    // Register file array
    reg [31:0] registers [0:31];

    // Initialize registers with different values
    integer i;
    initial begin
        registers[0] = 32'h00000009; // $zero
        registers[1] = 32'h0000000A;
        registers[2] = 32'h00000002;
        registers[3] = 32'h00000003;
        registers[4] = 32'h00000004;
        registers[5] = 32'h00000005;
        registers[6] = 32'h00000006;
        registers[7] = 32'h00000007;
        registers[8] = 32'h00000008;
        registers[9] = 32'h00000009;
        registers[10] = 32'h0000000A;
        registers[11] = 32'h0000000B;
        registers[12] = 32'h0000000C;
        registers[13] = 32'h0000000D;
        registers[14] = 32'h0000000E;
        registers[15] = 32'h0000000F;
        registers[16] = 32'h00000010;
        registers[17] = 32'h00000011;
        registers[18] = 32'h00000012;
        registers[19] = 32'h00000013;
        registers[20] = 32'h00000014;
        registers[21] = 32'h00000015;
        registers[22] = 32'h00000016;
        registers[23] = 32'h00000017;
        registers[24] = 32'h00000018;
        registers[25] = 32'h00000019;
        registers[26] = 32'h0000001A;
        registers[27] = 32'h0000001B;
        registers[28] = 32'h0000001C;
        registers[29] = 32'h0000001D;
        registers[30] = 32'h0000001E;
        registers[31] = 32'h0000001F;
    end

    // Write to register file
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            registers[0] <= 32'h00000009;
            registers[1] <= 32'h0000000A;
            registers[2] <= 32'h00000002;
            registers[3] <= 32'h00000003;
            registers[4] <= 32'h00000004;
            registers[5] <= 32'h00000005;
            registers[6] <= 32'h00000006;
            registers[7] <= 32'h00000007;
            registers[8] <= 32'h00000008;
            registers[9] <= 32'h00000009;
            registers[10] <= 32'h0000000A;
            registers[11] <= 32'h0000000B;
            registers[12] <= 32'h0000000C;
            registers[13] <= 32'h0000000D;
            registers[14] <= 32'h0000000E;
            registers[15] <= 32'h0000000F;
            registers[16] <= 32'h00000010;
            registers[17] <= 32'h00000011;
            registers[18] <= 32'h00000012;
            registers[19] <= 32'h00000013;
            registers[20] <= 32'h00000014;
            registers[21] <= 32'h00000015;
            registers[22] <= 32'h00000016;
            registers[23] <= 32'h00000017;
            registers[24] <= 32'h00000018;
            registers[25] <= 32'h00000019;
            registers[26] <= 32'h0000001A;
            registers[27] <= 32'h0000001B;
            registers[28] <= 32'h0000001C;
            registers[29] <= 32'h0000001D;
            registers[30] <= 32'h0000001E;
            registers[31] <= 32'h0000001F;
        end else if (w_e) begin
            if (rd != 0) // Register 0 ($zero) is always 0
                registers[rd] <= data_in;
        end
    end

    // Read from register file
    always @(*) begin
        rdata1 = registers[rs1];
        rdata2 = registers[rs2];
    end
endmodule



