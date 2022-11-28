`include "../define.v"
module IF_REG (
    input [`N:0] instruction_F,
    input [`N:0] PcPlus4_F,
    input clk,
    output reg [`N:0] instruction_D,
    output reg [`N:0] PcPlus4_D
);
  always @(posedge clk ) begin
    instruction_D<=instruction_F;
    PcPlus4_F<=PcPlus4_D;
  end  

endmodule