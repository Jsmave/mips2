`include "../define.v"
module ID_MODULE (
    input [`N:0] Instruction_D,reg_write_W,
    input [`RegAd:0] reg_src3_W,
    input clk,reg_we_W,
    output [`Jlen:0] Low26_D,
    output [`N:0] reg_read_1D,
    output [`N:0] reg_read_2D,
    output wire [`M:0] ControlSignal_D
);
    wire [`M:0] Cs;
    assign Low26_D = `iindex;
    assign ControlSignal_D = Cs ;
    ControlUnit cu1(
        .Instruction_D(Instruction_D),
        .ControlSignal(Cs)
    );
    REGISTER_GROUP reggp1(
        .reg_addr_1(`irs),
        .reg_addr_2(`irt),
        .reg_addr_3(reg_src3_W),
        .reg_write_W(reg_write_W),
        .reg_we(reg_we_W),
        .clk(clk),
        .reg_read_1(reg_read_1D),
        .reg_read_2(reg_read_2D)
    );
endmodule