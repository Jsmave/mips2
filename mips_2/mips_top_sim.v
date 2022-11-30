`include "define.v"
module mips_top_sim (
    input clk,rst
);
    IF_DOUMLE if_(.clk(clk),);
    IF_ID if_id_reg(.clk(clk),);
    ID_MODULE id_(.clk(clk),);
    ID_EX id_ex_reg(.clk(clk),);
    EX_MODULE ex_();
    EX_MEM ex_mem_reg(.clk(clk),);
    MEM_MODULE mem_();
    MEM_WR mem_wr_reg(.clk(clk),);
    WR_MODULE wr_();
endmodule