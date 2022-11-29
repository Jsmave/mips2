`include "define.v"
module ControlUnit (
    input [`N:0] Instruction_D,
    output wire [`M:0] ControlSignal
);

    wire [5:0] RTypeOp;
    wire wFunc = (`iop==`RType)?`FuncOn:`FuncOff;
assign RTypeOp = (wFunc) ? {`Jmp_nbr,`Reg_nwe,`AluNop}:
    (`ifunc == `RADD  ) ? {`Jmp_nbr,`Reg_we,`AluAdd} :
    (`ifunc == `RADDU ) ? {`Jmp_nbr,`Reg_we,`AluAdd} :
    (`ifunc == `RSUB  ) ? {`Jmp_nbr,`Reg_we,`AluSub} :
    (`ifunc == `RSUBU ) ? {`Jmp_nbr,`Reg_we,`AluSub} :
    (`ifunc == `RSLT  ) ? {`Jmp_nbr,`Reg_we,`AluSub} :
    (`ifunc == `RSLTU ) ? {`Jmp_nbr,`Reg_we,`AluSub} :
    (`ifunc == `RDIV  ) ? {`Jmp_nbr,`Reg_nwe,`AluDiv} :
    (`ifunc == `RDIVU ) ? {`Jmp_nbr,`Reg_nwe,`AluDiv} :
    (`ifunc == `RMULT ) ? {`Jmp_nbr,`Reg_nwe,`AluMul} :
    (`ifunc == `RMULTU) ? {`Jmp_nbr,`Reg_nwe,`AluMul} :
    (`ifunc == `RAND  ) ? {`Jmp_nbr,`Reg_we,`AluAnd} :
    (`ifunc == `RNOR  ) ? {`Jmp_nbr,`Reg_we,`AluNor} :
    (`ifunc == `ROR   ) ? {`Jmp_nbr,`Reg_we,`AluOr} :
    (`ifunc == `RXOR  ) ? {`Jmp_nbr,`Reg_we,`AluXor} :
    (`ifunc == `RSLLV ) ? {`Jmp_nbr,`Reg_we,`AluSl} :
    (`ifunc == `RSLL  ) ? {`Jmp_nbr,`Reg_we,`AluSl} :
    (`ifunc == `RSRAV ) ? {`Jmp_nbr,`Reg_we,`AluSra} :
    (`ifunc == `RSRA  ) ? {`Jmp_nbr,`Reg_we,`AluSra} :
    (`ifunc == `RSRLV ) ? {`Jmp_nbr,`Reg_we,`AluSrl} :
    (`ifunc == `RSRL  ) ? {`Jmp_nbr,`Reg_we,`AluSrl} :
    (`ifunc == `RJR   ) ? {`Jmp_br,`Reg_we,`AluAdd} :
    (`ifunc == `RJALR ) ? {`Jmp_br,`Reg_nwe,`AluAdd} :
    (`ifunc == `RMFHI ) ? {`Jmp_nbr,`Reg_we,`AluAdd} :
    (`ifunc == `RMFLO ) ? {`Jmp_nbr,`Reg_we,`AluAdd} :
    (`ifunc == `RMTHI ) ? {`Jmp_nbr,`Reg_nwe,`AluAdd} :
    (`ifunc == `RMTLO ) ? {`Jmp_nbr,`Reg_nwe,`AluAdd} :
    (`ifunc == `RBREAK) ? {`Jmp_nbr,`Reg_nwe,`AluNop} :
    (`ifunc == `RSYSCALL) ? {`Jmp_nbr,`Reg_nwe,`AluNop} : 
    {`Jmp_nbr,`Reg_nwe,`AluNop} ;   
//                                 1        1  ,        1   ,     1   ,   1   ,     1    ,   2    ,      1   ,   4
assign cu1 = (`iop==`RType)?{`RTJump,`RTRegWe,`MemToReg_Alu,`Mem_nwe,`R_Type,`AluSrc_reg,`Ext_si,`RegDst_Rd,`RTAluop}:
        (`iop==`IADDI    )? {`Jmp_nbr,`Reg_we,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluAdd} :
        (`iop==`IADDIU   )? {`Jmp_nbr,`Reg_we,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluAdd} :
        (`iop==`ISLTI    )? {`Jmp_nbr,`Reg_we,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluSl} :
        (`iop==`ISLTIU   )? {`Jmp_nbr,`Reg_we,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluSub} :
        (`iop==`IANDI    )? {`Jmp_nbr,`Reg_we,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_unsi,`RegDst_Rt,`AluSub} :
        (`iop==`IORI     )? {`Jmp_nbr,`Reg_we,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_unsi,`RegDst_Rt,`AluOr} :
        (`iop==`IXORI    )? {`Jmp_nbr,`Reg_we,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_unsi,`RegDst_Rt,`AluXor} :
        (`iop==`ILUI     )? {`Jmp_nbr,`Reg_we,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_lui,`RegDst_Rt,`AluSl} :
        (`iop==`IBEQ     )? {`Jmp_nbr,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`R_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluSub} :
        (`iop==`IBNE     )? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`R_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluSub} :
        (`iop==`IBGTZ    )? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`IBGTZRT  )? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`IBLEZ    )? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`IBLEZRT  )? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`IBLTZ    )? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`IBLTZRT  )? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`IBGEZ    )? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`IBGEZRT  )? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`IBGEZAL  )? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`IBGEZALRT)? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`IBLTZAL  )? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`IBLTZALRT)? {`Jmp_br,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_reg,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`ILB      )? {`Jmp_nbr,`Reg_we,`MemToReg_Mem,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`ILBU     )? {`Jmp_nbr,`Reg_we,`MemToReg_Mem,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`ILH      )? {`Jmp_nbr,`Reg_we,`MemToReg_Mem,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`ILHU     )? {`Jmp_nbr,`Reg_we,`MemToReg_Mem,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`ILW      )? {`Jmp_nbr,`Reg_we,`MemToReg_Mem,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`ISB      )? {`Jmp_nbr,`Reg_nwe,`MemToReg_Alu,`Mem_we,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`ISH      )? {`Jmp_nbr,`Reg_nwe,`MemToReg_Alu,`Mem_we,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluNop} :
        (`iop==`ISW      )? {`Jmp_nbr,`Reg_nwe,`MemToReg_Alu,`Mem_we,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluNop} : 
        {`Jmp_nbr,`Reg_nwe,`MemToReg_Alu,`Mem_nwe,`I_Type,`AluSrc_ext,`Ext_si,`RegDst_Rt,`AluNop} /*default*/  ;

endmodule