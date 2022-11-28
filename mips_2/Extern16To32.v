module EX_16TO32 (
    input [15:0] ex_in,
    output [31:0] ex_out,
    input wire unsign_ex
);
    assign ex_out=unsign_ex ? {{16{1'b0}},ex_in} :{{16{in[15]}},ex_in};
endmodule

