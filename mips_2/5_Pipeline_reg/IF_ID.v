`include "../define.v"
module IF_ID (
    input [`N:0] Instruction_F,
    input [`N:0] PcPlus4_F,
    input clk,
    output reg [`N:0] Instruction_D,
    output reg [`N:0] PcPlus4_D
);
  always @(posedge clk ) begin
    Instruction_D<=Instruction_F;
    PcPlus4_D<=PcPlus4_F;
  end  

endmodule