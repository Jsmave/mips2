`include "../define.v"
module MEMORY (
    input [`N:0] address,data_in,
    input clk,mem_we,
    output wire [`N:0]  memory_data_out
);
    reg [7:0] myram [11:0];
  
    always@(posedge clk)begin
        if(mem_we) myram[address[11:2]]<= data_in;
    end
  
    assign memory_data_out[7:0] = myram[{address[11:2],2'b00}];
    assign memory_data_out[15:8] = myram[{address[11:2],2'b01}];
    assign memory_data_out[23:16] = myram[{address[11:2],2'b10}];
    assign memory_data_out[31:24] = myram[{address[11:2],2'b11}];
endmodule