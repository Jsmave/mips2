`include "define.v"
module INSTRUCTION_REGSITER (
    input [`N:0] I_addr,
    input clk,
    output reg [`N:0] instruction_F
);
  wire en;
  assign en=1;

blk_mem_gen_1 instance_rom1(
  .clka(clk),    // input wire clka
  .ena(en),      // input wire ena
  .addra(I_addr[11:2]),  // input wire [9 : 0] addra
  .douta(instruction_F)  // output wire [31 : 0] douta
);

/* modelsim test
  reg [`N:0] rom [11:2];
  //ram test
  //always@(posedeg clk)begin
  //  if(en) rom[I_addr[11:2]]<= data_in;
  //end
  
  assign instruction_F[7:0] = rom[{I_addr[11:2],2'b00}];
  assign instruction_F[15:8] = rom[{I_addr[11:2],2'b01}];
  assign instruction_F[23:16] = rom[{I_addr[11:2],2'b10}];
  assign instruction_F[31:24] = rom[{I_addr[11:2],2'b11}];
  initial begin
    rom[]=;
  end
*/

endmodule
