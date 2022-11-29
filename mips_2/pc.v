`include "define.v"
module PC_DFILPFLOP (
    input [`N:0] pc_next,
    input clk,rst,
    output reg [`N:0] pc
);
    always @(posedge clk or posedge rst) begin
        pc<=pc_next;
        if(rst) pc<=0;    
    end

    
endmodule

module PROGARM_COUNTER(
    input clk,rst,branch,
    input [`N:0] pc_branch,
    output wire [`N:0] pc,
    output wire [`N:0] pc_next
);
    //wire [`N:0] pc_next;
    assign pc_next= branch ? pc_branch :pc+4;

    PC_DFILPFLOP pcd1(
        .pc_next(pc_next),
        .clk(clk),
        .rst(rst),
        .pc(pc)
    );

endmodule