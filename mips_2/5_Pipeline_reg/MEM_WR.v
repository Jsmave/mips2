`include "../define.v"
module MEM_WR (
    input [`N:0] memory_data_out,alu_out_M,
    input [`RegAd:0] reg_src3_M,
    input [`M_C_len:0] ControlSignal_M,
    input clk,OverflowM,
    output reg [`N:0] memory_data_outW,alu_out_W,
    output reg [`RegAd:0] reg_src3_W,
    output reg [`W_C_len:0] ControlSignal_W,
    output reg OverflowW
);
    always @(posedge clk ) begin
        memory_data_outW<=memory_data_out;
        alu_out_W<=alu_out_M;
        reg_src3_W<=reg_src3_M;
        ControlSignal_W<=ControlSignal_M[`W_C_len:0];
        OverflowW<=OverflowM;
    end
endmodule