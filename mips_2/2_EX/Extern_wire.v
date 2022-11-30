`include "../define.v"
module EX_26TO32 (
    input [`Jlen:0] ex_in,
    output wire [`N:0] ex_out
);
    wire [`N:0] temp = {{10{ex_in[`Jlen]}},ex_in};
    assign ex_out = temp << 2;
endmodule





module EX_16TO32 (
    input [`Ilen:0] ex_in,
    input [1:0] ex_signal,
    output wire [`N:0] ex_out
);
    assign ex_out= (ex_signal == `Ext_unsi) ? {{16{1'b0}},ex_in} :
                   (ex_signal == `Ext_lui ) ? {ex_in,{16{1'b0}}} : 
                   (ex_signal == `Ext_sa )  ? {{27{1'b0}},ex_in[10:6]} :
                    {{16{in[15]}},ex_in} ;
endmodule