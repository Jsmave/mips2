`include "../define.v"
module EX_MODULE (
    input clk,
    input [`N:0] reg_read_1E,
    input [`N:0] reg_read_2E,
    input [`M:0] ControlSignal_E,
    input [`N:0] PcPlus4_E,
    input [`Jlen:0] Low26_E,
    output ZeroE,OverflowE,
    output [`RegAd:0] reg_src3_E,
    output [`N:0] alu_out_E
);
    wire [`N:0] alusrc_1,alusrc_2;
    wire [`N:0] ext_out;
    assign ext_out = `shift16l2 ? ex16<<2 : 
                     &`Jtype? ex26 : ex16 ;
    assign alusrc_1 = (`Ext == `Ext_sa) ? ext_out : reg_read_1E ;
    assign alusrc_2 = (`IoRType) ? ext_out : reg_read_2E ;
    Alu alu1(    
        .alusrc_1(alusrc_1),
        .alusrc_2(alusrc_2),
        .alu_op(`alu_op),
        .Zero(ZeroE),
        .Overflow(OverflowE),
        .alu_out(alu_out_E)
    );
    
    wire [`N:0] ex16,ex26;
    EX_16TO32 ex1(
        .ex_in(`ex16in),
        .ex_signal(`Ext),
        .ex_out(ex16)
    );
    EX_26TO32 ex2(
        .ex_in(Low26_E),
        .ex_out(ex26)
    );
    
    wire [`RegAd:0] reg_src3_E = (`Jal == `JAL3 )? 5'b11111 :
    `RegDst ? `exRt : `exRd ;
endmodule