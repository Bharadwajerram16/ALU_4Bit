`timescale 1ns / 1ps
module shifter_tb;
reg [3:0]a;
reg [1:0]s;
wire [3:0]y;
shifter x1(a,s,y);
initial
begin
$monitor("Time=%0t | s=%b | a=%b -> y=%b", $time,s,a,y);
a=4'b1011;
#10 s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;
#10 a=4'b1100;
#10 s=2'b00;
#10 s=2'b01;
#10 s=2'b10;
#10 s=2'b11;
#10 $stop;
end
endmodule
