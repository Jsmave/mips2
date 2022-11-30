`include "../define.v"
module REGISTER_GROUP #(parameter reg_ad = 4)(
    input [reg_ad:0] reg_addr_1,reg_addr_2,reg_addr_3,
    input [`N:0] reg_write,
    input reg_we,clk,
    output [`N:0] reg_read_1,reg_read_2
);

    reg [`N:0] register [2**(reg_ad+1)-1:0];
    always @(posedge clk ) begin
        if(reg_we) register[reg_addr_3] <= reg_write ; 
    end
    assign reg_read_1 = (|reg_addr_1)?register[reg_addr_1]:32'b0;
    assign reg_read_2 = (|reg_addr_2)?register[reg_addr_2]:32'b0;

endmodule