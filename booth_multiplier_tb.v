`timescale 1ns / 1ps
module booth_multiplier_tb();
reg clk,rst;
reg signed [3:0]m,qin;
wire signed [7:0]r;
wire done;
booth_multiplier x1(clk,rst,m,qin,r,d);
initial
begin
rst=1;clk=0;
m=4'd3;qin=-4'd2;
#10 rst=0;
#60 rst=1;m=4'd3;qin=4'd3;
#10 rst=0;
#60 rst=1;m=-4'd4;qin=-4'd4;
#10 rst=0;
#60 rst=1;m=4'd7;qin=4'd7;
#10 rst=0;
#60 $stop;
end
always #5 clk=~clk;
endmodule