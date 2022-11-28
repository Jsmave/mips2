`include "define.v"
module ControlUnit (
    input [`N:0] instruction_D,
    output wire [`N:0] ControlSignal
);
    wire wFunc ;
    assign wFunc = (`iop==`RType)?`FuncOn:`FuncOff;
    assign ControlSignal = (`iop==`RType)?{0,,`AluNop}:
    (`iop==`IADDI    )?:
    (`iop==`IADDIU   )?:
    (`iop==`ISLTI    )?:
    (`iop==`ISLTIU   )?:
    (`iop==`IANDI    )?:
    (`iop==`IORI     )?:
    (`iop==`IXORI    )?:
    (`iop==`ILUI     )?:
    (`iop==`IBEQ     )?:
    (`iop==`IBNE     )?:
    (`iop==`IBGTZ    )?:
    (`iop==`IBGTZRT  )?:
    (`iop==`IBLEZ    )?:
    (`iop==`IBLEZRT  )?:
    (`iop==`IBLTZ    )?:
    (`iop==`IBLTZRT  )?:
    (`iop==`IBGEZ    )?:
    (`iop==`IBGEZRT  )?:
    (`iop==`IBGEZAL  )?:
    (`iop==`IBGEZALRT)?:
    (`iop==`IBLTZAL  )?:
    (`iop==`IBLTZALRT)?:
    (`iop==`ILB      )?:
    (`iop==`ILBU     )?:
    (`iop==`ILH      )?:
    (`iop==`ILHU     )?:
    (`iop==`ILW      )?:
    (`iop==`ISB      )?:
    (`iop==`ISH      )?:
    (`iop==`ISW      )?:
/*default*/  
                            
                            
endmodule