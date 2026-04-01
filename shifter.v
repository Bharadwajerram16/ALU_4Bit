`timescale 1ns / 1ps
module shifter(r,a,s);
input [3:0]a;
input [1:0]s;
output reg [3:0]r;
always@(*)
begin
case(s)
2'b00:r=a<<1;
2'b01:r=a>>1;
2'b10:r={a[2:0],a[3]};
2'b11:r={a[0],a[3:1]};
endcase
end
endmodule
