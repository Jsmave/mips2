`define N 31
//代码段格式
`define iop instruction_D[31:26]
`define irs instruction_D[25:21]
`define irt instruction_D[20:16]
`define ird instruction_D[15:11]
`define ishamt instruction_D[10:6]
`define ifunc instruction_D[5:0]
`define iimm instruction_D[15:0]
`define ioffset instruction_D[15:0]
`define iindex instruction_D[25:0]
//解码格式
`define 
//alu控制信号
`define FuncOn 1'b1
`define FuncOff 1'b0
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
`define AluHi 4'b1011
`define AluLo 4'b1100
`define AluNop 4'b1111
//其他控制信号

//J型指令，OP字段
`define JJ 6'b000010
`define JJAL 6'b000011
//R型指令，func字段
`define RType 6'b000000
`define RADD 6'b100000
`define RADDU 6'b100001
`define RSUB 6'b100010
`define RSUBU 6'b100011
`define RSLT 6'b101010
`define RSLTU 6'b101011
`define RDIV 6'b011010
`define RDIVU 6'b011011
`define RMULT 6'b011000
`define RMULTU 6'b011001
`define RAND 6'b100100
`define RNOR 6'b100111
`define ROR 6'b100101
`define RXOR 6'b100110
`define RSLLV 6'b000100
`define RSLL 6'b000000
`define RSRAV 6'b000111
`define RSRA 6'b000011
`define RSRLV 6'b000110
`define RSRL 6'b000010
`define RJR 6'b001000
`define RJALR 6'b001001
`define RMFHI 6'b100000
`define RMFLO 6'b100010
`define RMTHI 6'b010001
`define RMTLO 6'b010011
`define RBREAK 6'b001101
`define RSYSCALL 6'b001100
//I型指令，OP字段
`define IADDI 6'b001000
`define IADDIU 6'b001001
`define ISLTI 6'b001010
`define ISLTIU 6'b001011
`define IANDI 6'b001100
`define IORI 6'b001101
`define IXORI 6'b001110
`define ILUI 6'b001111
`define IBEQ 6'b000100
`define IBNE 6'b000101
`define IBGTZ 6'b000111
`define IBGTZRT 5'b00000
`define IBLEZ 6'b000110
`define IBLEZRT 5'b00000
`define IBLTZ 6'b000001
`define IBLTZRT 5'b00000
`define IBGEZ 6'b000001
`define IBGEZRT 5'b00001
`define IBGEZAL 6'b000001
`define IBGEZALRT 5'b10001
`define IBLTZAL 6'b000001
`define IBLTZALRT 5'b10000
`define ILB 6'b100000
`define ILBU 6'b100100
`define ILH 6'b100001
`define ILHU 6'b100101
`define ILW 6'b100011
`define ISB 6'b101000
`define ISH 6'b101001
`define ISW 6'b101011
