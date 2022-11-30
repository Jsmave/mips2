module ID_MODULE (
    input [`N:0] Instruction_D,reg_write,
    input clk,
    output wire [`M:0] ControlSignal
);
    wire [`M:0] cs;
    ControlUnit cu();
    REGISTER_GROUP reggp1();
endmodule