`include "../define.v"
module MEM_module (
    input ZeroM,
    input [`RegAd:0] reg_src3_M,
    input [`N:0] alu_out_M,PcPlus4_M,
    input [`M_C_len:0] ControlSignal_M,
    input clk,
    output wire [`N:0] memory_data_out
);
    wire [`N:0] ram_address;
    wire [`N:0] memory_write_data = reg_src3_M ;
    MEMORY ram1(
        .address(ram_address),
        .data_in(memory_write_data),
        .clk(clk),
        .memory_data_out(memory_data_out),
        .mem_we(`Mem_we_m)
    );

    
endmodule