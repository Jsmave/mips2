`include "idefine"
`include "sdefine"
`define N 31
`define M 15
`define Ilen 15
`define Jlen 25
`define RegAd 4
//代码段格式_ID
`define iop instruction_D[31:26]
`define irs instruction_D[25:21]
`define irt instruction_D[20:16]
`define ird instruction_D[15:11]
`define ifunc instruction_D[5:0]
`define iindex instruction_D[25:0]

//CU_ID
`define RTAluop RTypeOp[3:0]
`define RTRegWe RTypeOp[4]
`define RTJump RTypeOp[6:5]
`define RTHiLo RTypeOp[8:7]
`define RTAL RTypeOp[10:9]
//译码信号_EX
`define RegDst ControlSignal_E[14]
`define IoRType ControlSignal_E[13]
`define Jal ControlSignal_E[1:0]
`define Ext ControlSignal_E[10:9]
`define alu_op ControlSignal_E[8:5]
`define shift16l2 ControlSignal_E[15]
`define ex16in ex26[17:2] 
`define exRt   ex26[22:18]
`define exRd   ex26[17:13]