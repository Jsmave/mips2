`include "../define.v"
module IF_DOUMLE (
    input [`N:0] pc_branch,
    input branch,clk,rst,
    output wire [`N:0] PcPlus4_F,
    output wire [`N:0] Instruction_F
);
    wire [`N:0] i_pc;
    
    PROGARM_COUNTER program_cnt(
        .clk(clk),
        .rst(rst),
        .branch(branch),
        .pc_branch(pc_branch),
        .pc(i_pc),
        .pc_next(PcPlus4_F)
    );
    
    INSTRUCTION_REGSITER inst_reg(
        .I_addr(i_pc),
        .clk(clk),
        .Instruction_F(Instruction_F)
    );
    
endmodule