module mips_IF_sim (
);
    reg [31:0] pc_branch;
    wire [31:0]Instruction_F,PcPlus4_F;
    reg clk,rst,branch;
    IF_DOUMLE ihaveadream(
        .pc_branch(pc_branch),
        .branch(branch),
        .clk(clk),
        .rst(rst),
        .PcPlus4_F(PcPlus4_F),
        .Instruction_F(Instruction_F)
    );
    initial begin
        pc_branch<=32'h0f0f0f00;
        branch<=1'b0;
        clk<=0;
        rst<=1;
        $monitor($time,,,"clk=%b rst=%b branch=%b pc_branch=%h Pc_next=%h instruction=%h",clk,rst,branch,pc_branch,PcPlus4_F,Instruction_F);
        #1 rst<=0;    
    end
    always @(*) begin
        #5 clk<=~clk;
    end
    always @(*) begin
        #15 branch<=~branch;
        pc_branch<=pc_branch<<4;
    end
endmodule