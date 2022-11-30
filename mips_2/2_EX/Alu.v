`include "../define.v"
module Alu(
    input [`N:0] alusrc_1,alusrc_2,
    input [3:0] alu_op,
    output Zero,Overflow,
    output [`N:0] alu_out
);
    always@(*)begin
        case(alu_op)
            `AluAdd: alu_out=alusrc_1+alusrc_2;
            `AluSub: alu_out=alusrc_1-alusrc_2;
            `AluMul: alu_out=alusrc_1*alusrc_2;
            `AluDiv: alu_out=alusrc_1/alusrc_2;
            `AluAnd: alu_out=alusrc_1&alusrc_2;
            `AluOr : alu_out=alusrc_1|alusrc_2;
            `AluXor: alu_out=alusrc_1^alusrc_2;
            `AluNor: alu_out=~(alusrc_1|alusrc_2);
            `AluSl : alu_out=alusrc_2<<alusrc_1;
            `AluSrl: alu_out=alusrc_2>>alusrc_1;
            `AluSra: alu_out=alusrc_2>>>alusrc_1;
            `AluHir:alu_out=32'h0fffffff;
            `AluLor:alu_out=32'h0fffffff;
            `AluHiw:alu_out=32'h0fffffff;
            `AluLow:alu_out=32'h0fffffff;
            `AluNop: alu_out=32'h0fffffff;
            default: alu_out=32'h0fffffff;
        endcase
    end
    assign Zero = ~( | alu_out );
    assign Overflow = !(alusrc_1[31]^alusrc_2[31]) & (alusrc_1[31]^alu_out[31]) ;
endmodule