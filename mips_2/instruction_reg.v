module INSTRUCTION_REGSITER #(parameter N = 31)(
    input [N:0] adderss,
    input clk,
    output reg [N:0] instruction
);
  wire en;
  assign en=1;

blk_mem_gen_1 instance_rom1(
  .clka(clk),    // input wire clka
  .ena(en),      // input wire ena
  .addra(address[9:0]),  // input wire [9 : 0] addra
  .douta(instruction)  // output wire [31 : 0] douta
);

/* modelsim test
  reg [N:0] rom [9:0];
  //ram test
  //always@(posedeg clk)begin
  //  if(en) rom[address[9:0]]<= data_in;
  //end
  
  assign instruction = rom[address[9:0]];
  initial begin
    rom[]=;
  end
*/

endmodule
