module IF_REG (
    input [`N:0] instruction_in,
    input clk,
    output reg [`N:0] instruction,
);
  always @(posedge clk ) begin
    instruction=instruction_in;
  end  

endmodule