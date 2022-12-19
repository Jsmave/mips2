`include "../define.v"
module EX_MEM (
    input ZeroE,OverflowE,
    input [`RegAd:0] reg_src3_E,
    input [`N:0] alu_out_E,PcPlus4_E,
    input [`M:0]ControlSignal_E,
    input clk,
    output reg ZeroM,OverflowM,
    output reg [`RegAd:0] reg_src3_M,
    output reg [`N:0] alu_out_M,PcPlus4_M,
    output reg [`M_C_len:0] ControlSignal_M
);
    always @(posedge clk )begin
        ZeroM<=ZeroE;
        OverflowM<=OverflowE;
        reg_src3_M<=reg_src3_E;
        alu_out_M<=alu_out_E;
        ControlSignal_M<=ControlSignal_E[`M_C_len:0];
        PcPlus4_M<=PcPlus4_E;
    end
endmodule