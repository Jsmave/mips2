`include "define.v"
module a_tb (
);
    reg clk,rst;
    wire [`N:0]pc;
    initial begin
        $monitor($time,,,"clk=%b rst=%b pc=%h",clk,rst,pc);
        clk<=0;
       rst<=1;
#4     rst<=0;
        
    end
    PROGARM_COUNTER pc_i(
        .clk(clk),
        .rst(rst),
        .pc(pc)
    );
    always @(*) begin
        #5 clk<=~clk;
    end

endmodule