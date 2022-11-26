module IF_REG (
    input instruction_in,
    input clk,
    output reg instruction,
);
  always @(posedge clk ) begin
    instruction=instruction_in;
  end  
endmodule