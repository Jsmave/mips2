`include "../define.v"
module ID_EX (
    input [`Jlen:0] Low26_D,
    input [`N:0] reg_read_1D,
    input [`N:0] reg_read_2D,
    input [`M:0] ControlSignal_D,
    input [`N:0] PcPlus4_D,
    input clk,
    output reg [`N:0] reg_read_1E,
    output reg [`Jlen:0] Low26_E,
    output reg [`N:0] reg_read_2E,
    output reg [`M:0] ControlSignal_E,
    output reg [`N:0] PcPlus4_E
);
  always @(posedge clk ) begin
    reg_read_1E<=reg_read_1D;
    reg_read_2E<=reg_read_2D;
    ControlSignal_E<=ControlSignal_D;
    PcPlus4_E<=PcPlus4_D;
    Low26_E<=Low26_D;
  end    
endmodule