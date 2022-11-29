module EX_16TO32 (
    input [15:0] ex_in,
    input [1:0] ex_signal,
    output wire [31:0] ex_out
);
    assign ex_out= (ex_signal == `Ext_unsi) ? {{16{1'b0}},ex_in} 
                   (ex_signal == `Ext_lui) ? {ex_in,{16{1'b0}}} : {{16{in[15]}},ex_in} ;
endmodule

