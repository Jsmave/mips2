`include "define.v"
module INSTRUCTION_REGSITER (
    input [`N:0] I_addr,
    input clk,
    output wire [`N:0] Instruction_F
);
  wire en;
  assign en=1;
/*
blk_mem_gen_1 instance_rom1(
  .clka(clk),    // input wire clka
  .ena(en),      // input wire ena
  .addra(I_addr[11:2]),  // input wire [9 : 0] addra
  .douta(Instruction_F)  // output wire [31 : 0] douta
);
*/
//modelsim test
/* */
  reg [7:0] rom [11:0];
  //ram test
  //always@(posedeg clk)begin
  //  if(en) rom[I_addr[11:2]]<= data_in;
  //end
  
  assign Instruction_F[7:0] = rom[{I_addr[11:2],2'b00}];
  assign Instruction_F[15:8] = rom[{I_addr[11:2],2'b01}];
  assign Instruction_F[23:16] = rom[{I_addr[11:2],2'b10}];
  assign Instruction_F[31:24] = rom[{I_addr[11:2],2'b11}];
  initial begin
    rom[0]=8'hff;
    rom[1]=8'haa;
    rom[2]=8'h55;
    rom[3]=8'h00;
    rom[4]=8'h33;
    rom[5]=8'h22;
    rom[6]=8'h11;
    rom[7]=8'h88;
  end
/**/

endmodule
