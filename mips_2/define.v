`include "idefine.v"
`include "sdefine.v"
`define N 31
`define M 15
`define Ilen 15
`define Jlen 25
`define RegAd 4
`define M_C_len 6
`define W_C_len 3
//代码段格式_ID
`define iop Instruction_D[31:26]
`define irs Instruction_D[25:21]
`define irt Instruction_D[20:16]
`define ird Instruction_D[15:11]
`define ifunc Instruction_D[5:0]
`define iindex Instruction_D[25:0]

//CU_ID
`define RTAluop RTypeOp[3:0]
`define RTRegWe RTypeOp[4]
`define RTJump RTypeOp[5]
`define RTAL RTypeOp[7:6]
//译码信号_EX
`define shift16l2 ControlSignal_E_in[15]
`define RegDst ControlSignal_E_in[14]
`define IoRType ControlSignal_E_in[13]
`define Ext ControlSignal_E_in[12:11]
`define alu_op ControlSignal_E_in[10:7]
`define Mem_we_m ControlSignal_M[6]
`define Jump_branch ControlSignal_E_in[4]
`define d_Mem_to_reg ControlSignal_W[3]
`define d_regwe ControlSignal_W[2]
`define Jal ControlSignal_E_in[1:0]
`define ex16in ex26[17:2] 
`define exRt   ex26[22:18]
`define exRd   ex26[17:13]

//编码格式 ControlSignal[]{}
`define Nop 32'hffffffff