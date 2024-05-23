`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 02:22:49 PM
// Design Name: 
// Module Name: Top_Level
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

module Top_Level(
    output [31:0] rdata1,
    output [31:0] rdata2,
    output [31:0] ALU_Out,
    output [31:0] instr,
    input rst,
    input clk
);
    wire [31:0] pc_out, pc_next;
    wire [31:0] IF_ID_instr, ID_EX_instr, EX_MEM_instr, MEM_WB_instr;
    wire [31:0] IF_ID_pc, ID_EX_pc, EX_MEM_pc, MEM_WB_pc;
    wire [31:0] ID_EX_rdata1, ID_EX_rdata2, EX_MEM_rdata2, MEM_WB_rdata2;
    wire [31:0] ID_EX_ALU_Out, EX_MEM_ALU_Out, MEM_WB_ALU_Out;
    wire [4:0] ID_EX_rs1, ID_EX_rs2, ID_EX_rd, EX_MEM_rd, MEM_WB_rd;
    wire [5:0] ID_EX_opcode, EX_MEM_opcode, MEM_WB_opcode;
    wire PCWrite, IF_ID_Write, ControlMux;
   
    // Program Counter
    PC uut1 (
        .clk(clk),
        .rst(rst),
        .PCWrite(PCWrite),
        .PC_next(pc_next),
        .PC_out(pc_out)
    );

    // Instruction Memory
    instr_mem uut4 (
        .instr(instr),
        .clk(clk),
        .rst(rst),
        .PC(pc_out)        
    );

    // IF/ID Pipeline Register
    IF_ID_reg IF_ID (
        .clk(clk),
        .rst(rst),
        .IF_ID_Write(IF_ID_Write),
        .instr_in(instr),
        .pc_in(pc_out),
        .instr_out(IF_ID_instr),
        .pc_out(IF_ID_pc)
    );

    // Register File
    wire [4:0] rs1, rs2, rd;
    assign rs1 = IF_ID_instr[25:21];
    assign rs2 = IF_ID_instr[20:16];
    assign rd = IF_ID_instr[15:11];
    wire w_e = 1'b0;//MEM_WB_RegWrite;
    reg_file uut2 (
        .rs1(rs1),
        .rs2(rs2),
        .rd(MEM_WB_rd),
        .clk(clk),
        .rst(rst),
        .w_e(w_e),
        .data_in(MEM_WB_ALU_Out),
        .rdata1(rdata1),
        .rdata2(rdata2)
    );

    // ID/EX Pipeline Register
    ID_EX_reg ID_EX (
        .clk(clk),
        .rst(rst),
        .ControlMux(ControlMux),
        .instr_in(IF_ID_instr),
        .pc_in(IF_ID_pc),
        .rdata1_in(rdata1),
        .rdata2_in(rdata2),
        .rs1_in(rs1),
        .rs2_in(rs2),
        .rd_in(rd),
        .opcode_in(IF_ID_instr[31:26]),
        .instr_out(ID_EX_instr),
        .pc_out(ID_EX_pc),
        .rdata1_out(ID_EX_rdata1),
        .rdata2_out(ID_EX_rdata2),
        .rs1_out(ID_EX_rs1),
        .rs2_out(ID_EX_rs2),
        .rd_out(ID_EX_rd),
        .opcode_out(ID_EX_opcode)
    );

    // ALU
    ALU uut3 (
        .Rs1(ID_EX_rdata1),
        .Rs2(ID_EX_rdata2),
        .opcode(ID_EX_opcode),
        .data_out(ALU_Out)
    );

    // EX/MEM Pipeline Register
    EX_MEM_reg EX_MEM (
        .clk(clk),
        .rst(rst),
        .instr_in(ID_EX_instr),
        .pc_in(ID_EX_pc),
        .ALU_Out_in(ALU_Out),
        .rdata2_in(ID_EX_rdata2),
        .rd_in(ID_EX_rd),
        .opcode_in(ID_EX_opcode),
        .instr_out(EX_MEM_instr),
        .pc_out(EX_MEM_pc),
        .ALU_Out_out(EX_MEM_ALU_Out),
        .rdata2_out(EX_MEM_rdata2),
        .rd_out(EX_MEM_rd),
        .opcode_out(EX_MEM_opcode)
    );

    // MEM/WB Pipeline Register
    MEM_WB_reg MEM_WB (
        .clk(clk),
        .rst(rst),
        .instr_in(EX_MEM_instr),
        .pc_in(EX_MEM_pc),
        .ALU_Out_in(EX_MEM_ALU_Out),
        .rdata2_in(EX_MEM_rdata2),
        .rd_in(EX_MEM_rd),
        .opcode_in(EX_MEM_opcode),
        .instr_out(MEM_WB_instr),
        .pc_out(MEM_WB_pc),
        .ALU_Out_out(MEM_WB_ALU_Out),
        .rdata2_out(MEM_WB_rdata2),
        .rd_out(MEM_WB_rd),
        .opcode_out(MEM_WB_opcode)
    );

    // Hazard Detection Unit
    Hazard_Detection_Unit hazard_unit (
        .ID_EX_opcode(ID_EX_opcode),
        .ID_EX_rs1(ID_EX_rs1),
        .ID_EX_rs2(ID_EX_rs2),
        .IF_ID_rs1(rs1),
        .IF_ID_rs2(rs2),
        .PCWrite(PCWrite),
        .IF_ID_Write(IF_ID_Write),
        .ControlMux(ControlMux)
    );

    // PC Update Logic
    assign pc_next = pc_out + 4;

endmodule