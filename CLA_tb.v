`timescale 1ns / 1ps
module CLA_tb();
reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire c3,c4;
wire [4:0]sum;
assign sum={c4,s};
CLA x1(c4,c3,s,cin,a,b);
initial
begin
a=4'b1011;b=4'b0011;cin=1'b0;
#10 a=4'b1110;b=4'b1011;cin=1'b0;
#10 a=4'b1010;b=4'b0101;cin=1'b0;
#10 a=4'b1110;b=4'b1011;cin=1'b0;
#10 a=4'b0111;b=4'b0101;cin=1'b0;
#10 a=4'b0001;b=4'b1000;cin=1'b0;
#10 a=4'b0010;b=4'b0101;cin=1'b0;
#10 a=4'b1111;b=4'b0001;cin=1'b0;
#10 a=4'b1111;b=4'b1001;cin=1'b1;
#10 a=4'b1100;b=4'b1000;cin=1'b1;
#10 a=4'b1110;b=4'b1101;cin=1'b1;
#10 a=4'b1011;b=4'b0011;cin=1'b1;
#10 a=4'b1001;b=4'b0011;cin=1'b1;
#10 a=4'b1110;b=4'b0011;cin=1'b1;
#10 a=4'b1111;b=4'b0101;cin=1'b1;
#10 a=4'b1010;b=4'b0101;cin=1'b1;
#10 $stop;
end
endmodule