//alu控制信号
//`define FuncOn 1'b1
//`define FuncOff 1'b0
`define AluAdd 4'b0000
`define AluSub 4'b0001
`define AluMul 4'b0010
`define AluDiv 4'b0011
`define AluAnd 4'b0100
`define AluOr 4'b0101
`define AluXor 4'b0110
`define AluNor 4'b0111
`define AluSl 4'b1000
`define AluSrl 4'b1001
`define AluSra 4'b1010
`define AluHir 4'b1011
`define AluLor 4'b1100
`define AluHiw 4'b1110
`define AluLow 4'b1101
`define AluNop 4'b1111
//其他控制信号
`define RegDst_Rd 1'b0
`define RegDst_Rt 1'b1
`define Ext_si 2'b00
`define Ext_unsi 2'b10
`define Ext_sa   2'b01
`define Ext_lui 2'b11
`define AluSrc_reg 1'b0
`define AluSrc_ext 1'b1
`define R_Type 1'b0
`define I_Type 1'b1
`define Mem_we 1'b1
`define Mem_nwe 1'b0
`define MemToReg_Alu 1'b0
`define MemToReg_Mem 1'b1
    //不能根据指令类型确定的其他信号
 `define Reg_we 1'b1
 `define Reg_nwe 1'b0
 `define Jmp_br 1'b1
 `define Jmp_nb 1'b0
 `define Jtype 2'b11
 `define JALR 2'b01
 `define JAL3 2'b10
 `define NJAL 2'b00
 `define Immsl 1'b1
 `define Immns 1'b0



