`include "../define.v"
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
  reg [31:0] rom[511:0];
  //ram test
  //always@(posedeg clk)begin
  //  if(en) rom[I_addr[11:2]]<= data_in;
  //end
  
  //assign Instruction_F[7:0] = rom[{I_addr[11:2],2'b00}];
  //assign Instruction_F[15:8] = rom[{I_addr[11:2],2'b01}];
  //assign Instruction_F[23:16] = rom[{I_addr[11:2],2'b10}];
  //assign Instruction_F[31:24] = rom[{I_addr[11:2],2'b11}];
  assign Instruction_F = rom[I_addr[11:0]];
  initial begin
    rom[0]<=`Nop;
    rom[1]<=32'h201e1a2c;
    rom[2]<=32'h201d0367;
    rom[3]<=32'h201c0a23;
    rom[4]<=`Nop;
    rom[5]<=`Nop;
    rom[6]<=`Nop;
    rom[7]<=32'h03dc0824;
    rom[8]<=32'h03bc1027;
    rom[9]<=32'h03dd1825;
    rom[10]<=32'h03dc2026;
    rom[11]<=`Nop;
    rom[12]<=`Nop;
    rom[13]<=`Nop;
    rom[14]<=`Nop;
    rom[15]<=`Nop;
    rom[16]<=`Nop;
    rom[17]<=`Nop;
    rom[18]<=`Nop;
    rom[19]<=`Nop;
    rom[20]<=`Nop;
    rom[21]<=`Nop;
    rom[22]<=`Nop;
    rom[23]<=`Nop;
    rom[24]<=`Nop;
    rom[25]<=`Nop;
    rom[26]<=`Nop;
    rom[27]<=`Nop;



  end
/**/

endmodule
