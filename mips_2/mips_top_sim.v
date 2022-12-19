module mips_top_sim (
);
    reg clk,rst;
    initial begin
        clk<=1;
        rst<=1;
    #1  clk<=0;
        rst<=0;
    end
    mips mips_1(clk,rst);
    always @(*) begin
        #1 clk<=~clk;
    end
endmodule