module PROGRAM_COUNTER #(
    parameter N=31;
) (
    input [N:0] pc_next,
    input clk,rst,
    output reg [N:0] pc
);
    always @(posedge clk ) begin
        pc<=pc_next+4;
        if(rst) pc_next<=0;
    end

    
endmodule