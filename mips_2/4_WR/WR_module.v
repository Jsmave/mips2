`include "../define.v"
module WR_module (
    input [`N:0]  memory_data_outW,
    input [`N:0]  alu_out_W,
    input [`W_C_len:0] ControlSignal_W,
    input OverflowW,
    output [`N:0] reg_write_W,
    output wire reg_we_W
);
    assign reg_write_W =`d_Mem_to_reg ? memory_data_outW :alu_out_W ;
    assign reg_we_W = `d_regwe;
endmodule