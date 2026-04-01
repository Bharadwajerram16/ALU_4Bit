`timescale 1ns / 1ps
module restoring_divider_tb;
reg clk,rst,start;
reg [3:0] dividend,divisor;
wire [3:0] quotient,remainder;
wire done;
restoring_divider x1(clk,rst,start,dividend,divisor,quotient,remainder,done);
always #5 clk=~clk;
initial
begin
clk=0;rst=1;start=0;
#10 rst=0;
$monitor("t=%0t a=%d b=%d q=%d r=%d done=%b",$time,dividend,divisor,quotient,remainder,done);
#10 dividend=10;divisor=3;start=1;
#10 start=0;
wait(done);
#10 dividend=15;divisor=4;start=1;
#10 start=0;
wait(done);
#10 dividend=9;divisor=2;start=1;
#10 start=0;
wait(done);
#10 dividend=7;divisor=3;start=1;
#10 start=0;
wait(done);
#10 dividend=8;divisor=5;start=1;
#10 start=0;
wait(done);
#10 $stop;
end
endmodule