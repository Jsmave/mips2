`include "../define.v"
module ControlUnit (
    input [`N:0] Instruction_D,
    output wire [`M:0] ControlSignal
);

    wire [7:0] RTypeOp;
//                                           7:6        5           4     [3:0]
assign RTypeOp = (`ifunc == `RADD    ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluAdd }:
/**/             (`ifunc == `RADDU   ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluAdd }:
/**/             (`ifunc == `RSUB    ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluSub }:
/**/             (`ifunc == `RSUBU   ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluSub }:
/**/             (`ifunc == `RSLT    ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluSub }:
/**/             (`ifunc == `RSLTU   ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluSub }:
/**/             (`ifunc == `RDIV    ) ? { `NJAL , `Jmp_nb , `Reg_nwe , `AluDiv }:
/**/             (`ifunc == `RDIVU   ) ? { `NJAL , `Jmp_nb , `Reg_nwe , `AluDiv }:
/**/             (`ifunc == `RMULT   ) ? { `NJAL , `Jmp_nb , `Reg_nwe , `AluMul }:
/**/             (`ifunc == `RMULTU  ) ? { `NJAL , `Jmp_nb , `Reg_nwe , `AluMul }:
/**/             (`ifunc == `RAND    ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluAnd }:
/**/             (`ifunc == `RNOR    ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluNor }:
/**/             (`ifunc == `ROR     ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluOr  }:
/**/             (`ifunc == `RXOR    ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluXor }:
/**/             (`ifunc == `RSLLV   ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluSl  }:
/**/             (`ifunc == `RSLL    ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluSl  }:
/**/             (`ifunc == `RSRAV   ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluSra }:
/**/             (`ifunc == `RSRA    ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluSra }:
/**/             (`ifunc == `RSRLV   ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluSrl }:
/**/             (`ifunc == `RSRL    ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluSrl }:
/**/             (`ifunc == `RJR     ) ? { `NJAL , `Jmp_br , `Reg_we  , `AluAdd }:
/**/             (`ifunc == `RJALR   ) ? { `JALR , `Jmp_br , `Reg_nwe , `AluAdd }:
/**/             (`ifunc == `RMFHI   ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluHir }:
/**/             (`ifunc == `RMFLO   ) ? { `NJAL , `Jmp_nb , `Reg_we  , `AluLor }:
/**/             (`ifunc == `RMTHI   ) ? { `NJAL , `Jmp_nb , `Reg_nwe , `AluHiw }:
/**/             (`ifunc == `RMTLO   ) ? { `NJAL , `Jmp_nb , `Reg_nwe , `AluLow }:
/**/             (`ifunc == `RBREAK  ) ? { `NJAL , `Jmp_nb , `Reg_nwe , `AluNop }:
/**/             (`ifunc == `RSYSCALL) ? { `NJAL , `Jmp_nb , `Reg_nwe , `AluNop }: 
/*default*/                 { `NJAL , `Jmp_nb , `Reg_nwe , `AluNop };
//assign bbb =    
//         16[15:0]                        15         14        13       12:11      10:7          6           5          4              3          2       1:0
assign ControlSignal = (`iop==`RType)?{ `Immns , `RegDst_Rd , `R_Type , `Ext_si   , `RTAluop, `Mem_nwe , `AluSrc_reg ,`RTJump , `MemToReg_Alu , `RTRegWe, `RTAL }:
        (`iop==`IADDI    )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluAdd , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_we , `NJAL }:
        (`iop==`IADDIU   )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluAdd , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_we , `NJAL }:
        (`iop==`ISLTI    )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluSl  , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_we , `NJAL }:
        (`iop==`ISLTIU   )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluSub , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_we , `NJAL }:
        (`iop==`IANDI    )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_unsi , `AluAnd , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_we , `NJAL }:
        (`iop==`IORI     )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_unsi , `AluOr  , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_we , `NJAL }:
        (`iop==`IXORI    )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_unsi , `AluXor , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_we , `NJAL }:
        (`iop==`ILUI     )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_lui  , `AluSl  , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_we , `NJAL }:
        (`iop==`IBEQ     )?           { `Immsl , `RegDst_Rt , `R_Type , `Ext_si   , `AluSub , `Mem_nwe , `AluSrc_reg ,`Jmp_nb , `MemToReg_Alu , `Reg_nwe, `NJAL }:
        (`iop==`IBNE     )?           { `Immsl , `RegDst_Rt , `R_Type , `Ext_si   , `AluSub , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `NJAL }:
        (`iop==`IBGTZ    )?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `NJAL }:
      //(`iop==`IBGTZRT  )?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `NJAL }:
        (`iop==`IBLEZ    )?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `NJAL }:
      //(`iop==`IBLEZRT  )?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `NJAL }:
        (`iop==`IBLTZ    )?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `NJAL }:
      //(`iop==`IBLTZRT  )?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `NJAL }:
        (`iop==`IBGEZ    )?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `NJAL }:
      //(`iop==`IBGEZRT  )?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `NJAL }:
        (`iop==`IBGEZAL  )?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `JAL3 }:
      //(`iop==`IBGEZALRT)?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `NJAL }:        
        (`iop==`IBLTZAL  )?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `JAL3 }:
      //(`iop==`IBLTZALRT)?           { `Immsl , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_reg ,`Jmp_br , `MemToReg_Alu , `Reg_nwe, `NJAL }:
        (`iop==`ILB      )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluAdd , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Mem , `Reg_we , `NJAL }:
        (`iop==`ILBU     )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluAdd , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Mem , `Reg_we , `NJAL }:
        (`iop==`ILH      )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluAdd , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Mem , `Reg_we , `NJAL }:
        (`iop==`ILHU     )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluAdd , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Mem , `Reg_we , `NJAL }:
        (`iop==`ILW      )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluAdd , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Mem , `Reg_we , `NJAL }:
        (`iop==`ISB      )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluAdd , `Mem_we  , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_nwe, `NJAL }:
        (`iop==`ISH      )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluAdd , `Mem_we  , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_nwe, `NJAL }:
        (`iop==`ISW      )?           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluAdd , `Mem_we  , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_nwe, `NJAL }: 
/*default*/                           { `Immns , `RegDst_Rt , `I_Type , `Ext_si   , `AluNop , `Mem_nwe , `AluSrc_ext ,`Jmp_nb , `MemToReg_Alu , `Reg_nwe, `NJAL };  

endmodule