`timescale 1ns / 1ps
module CLA(c4,c3,s,cin,a,b);
input [3:0]a;
input [3:0]b;
input cin;
output [3:0]s;
output c3,c4;
reg c4;
wire [3:0]b1;
wire [3:0]p;
wire [3:0]g;
wire c0,c1,c2;
assign b1=b^{4{cin}};
assign p[0]=(a[0]^b1[0]);
assign p[1]=(a[1]^b1[1]);
assign p[2]=(a[2]^b1[2]);
assign p[3]=(a[3]^b1[3]);
assign g[0]=(a[0]&b1[0]);
assign g[1]=(a[1]&b1[1]);
assign g[2]=(a[2]&b1[2]);
assign g[3]=(a[3]&b1[3]);
assign c0=(cin&p[0])|g[0];
assign c1=(cin&p[0]&p[1])|(g[0]&p[1])|g[1];
assign c2=(cin&p[0]&p[1]&p[2])|(g[0]&p[1]&p[2])|(g[1]&p[2])|g[2];
assign c3=(cin&p[0]&p[1]&p[2]&p[3])|(g[0]&p[1]&p[2]&p[3])|(g[1]&p[2]&p[3])|(g[2]&p[3])|g[3];
assign s[3]=a[3]^b1[3]^c2;
assign s[2]=a[2]^b1[2]^c1;
assign s[1]=a[1]^b1[1]^c0;
assign s[0]=a[0]^b1[0]^cin;
always@(*)
if(cin==0)
begin 
c4=c3;
end
else
begin
c4=1'b0;
end
endmodule
