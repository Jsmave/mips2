`include "define.v"
module mips (
    input clk,rst
);  
    wire [`N:0] pc_branch;
    wire branch;
    wire [`N:0] PcPlus4_F,Instruction_F;
    IF_DOUMLE if_(
        .clk(clk),
        .branch(branch),
        .rst(rst),
        .pc_branch(pc_branch),
        .PcPlus4_F(PcPlus4_F),
        .Instruction_F(Instruction_F)
    );

    wire [`N:0] Instruction_D,PcPlus4_D;
    IF_ID if_id_reg(
        .clk(clk),
        .Instruction_F(Instruction_F),
        .PcPlus4_F(PcPlus4_F),
        .Instruction_D(Instruction_D),
        .PcPlus4_D(PcPlus4_D)
    );
    wire [`N:0] reg_write_W;
    wire [`RegAd:0] reg_src3_W;
    wire reg_we_W;
    wire[`Jlen:0] Low26_D;
    wire[`N:0] reg_read_1D,reg_read_2D;
    wire [`M:0] ControlSignal_D;
    ID_MODULE id_(
        .clk(clk),
        .Instruction_D(Instruction_D),
        .reg_write_W(reg_write_W),
        .reg_src3_W(reg_src3_W),
        .reg_we_W(reg_we_W),
        .Low26_D(Low26_D),
        .reg_read_1D(reg_read_1D),
        .reg_read_2D(reg_read_2D),
        .ControlSignal_D(ControlSignal_D)       
    );
    wire [`N:0] reg_read_1E;
    wire [`Jlen:0] Low26_E;
    wire [`N:0] reg_read_2E;
    wire [`M:0] ControlSignal_E;
    wire [`N:0] PcPlus4_E;
    ID_EX id_ex_reg(
        .clk(clk),
        .Low26_D(Low26_D),
        .reg_read_1D(reg_read_1D),
        .reg_read_2D(reg_read_2D),
        .ControlSignal_D(ControlSignal_D),
        .PcPlus4_D(PcPlus4_D),        
        .reg_read_1E(reg_read_1E),
        .Low26_E(Low26_E),
        .reg_read_2E(reg_read_2E),
        .ControlSignal_E(ControlSignal_E),
        .PcPlus4_E(PcPlus4_E)
    );
    wire ZeroE,OverflowE;
    wire [`RegAd:0] reg_src3_E;
    wire [`N:0] alu_out_E;
    EX_MODULE ex_(
        .clk(clk),
        .reg_read_1E(reg_read_1E),
        .reg_read_2E(reg_read_2E),
        .ControlSignal_E_in(ControlSignal_E),
        .PcPlus4_E_t(PcPlus4_E),
        .Low26_E(Low26_E ),
        .ZeroE(ZeroE),
        .OverflowE(OverflowE),
        .reg_src3_E(reg_src3_E),
        .alu_out_E(alu_out_E)
    );
    wire ZeroM,OverflowM;
    wire [`RegAd:0] reg_src3_M;
    wire [`N:0] alu_out_M,PcPlus4_M;
    wire [`M_C_len:0] ControlSignal_M;
    EX_MEM ex_mem_reg(
        .ZeroE(ZeroE),
        .OverflowE(OverflowE),
        .reg_src3_E(reg_src3_E),
        .alu_out_E(alu_out_E),
        .PcPlus4_E(PcPlus4_E),
        .ControlSignal_E(ControlSignal_E),
        .clk(clk),
        .ZeroM(ZeroM),
        .OverflowM(OverflowM),
        .reg_src3_M(reg_src3_M),
        .alu_out_M(alu_out_M),
        .PcPlus4_M(PcPlus4_M),
        .ControlSignal_M(ControlSignal_M)
    );
    wire [`N:0] memory_data_out;
    MEM_module mem_(
        .ZeroM(ZeroM),
        .reg_src3_M(reg_src3_M),
        .alu_out_M(alu_out_M),
        .PcPlus4_M(PcPlus4_M),
        .ControlSignal_M(ControlSignal_M),
        .clk(clk),
        .memory_data_out(memory_data_out)
    );
    wire [`N:0] memory_data_outW;
    wire [`N:0] alu_out_W;
    wire [`W_C_len:0] ControlSignal_W;
    wire OverflowW;
    MEM_WR mem_wr_reg(
        .memory_data_out(memory_data_out),
        .alu_out_M(alu_out_M),
        .reg_src3_M(reg_src3_M),
        .ControlSignal_M(ControlSignal_M),
        .clk(clk),
        .OverflowM(OverflowM),
        .memory_data_outW(memory_data_outW),
        .alu_out_W(alu_out_W),
        .reg_src3_W(reg_src3_W),
        .ControlSignal_W(ControlSignal_W),
        .OverflowW(OverflowW)
    );

    WR_module wr_(
        .memory_data_outW(memory_data_outW),
        .alu_out_W(alu_out_W),
        .ControlSignal_W(ControlSignal_W),
        .OverflowW(OverflowW),
        .reg_write_W(reg_write_W),
        .reg_we_W(reg_we_W)
    );
endmodule