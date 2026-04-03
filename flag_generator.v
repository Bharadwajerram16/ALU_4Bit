module flag_generator(
    input [3:0] r,
    input c_out,
    input c_in_msb,
    output Z,
    output C,
    output S,
    output V
);
assign Z=(r==4'b0000);
assign S=r[3];
assign C=c_out;
assign V=c_in_msb^c_out;
endmodule