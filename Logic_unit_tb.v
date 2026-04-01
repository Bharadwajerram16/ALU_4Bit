`timescale 1ns / 1ps
module Logic_unit_tb;
reg [3:0]a,b;
reg [2:0]s;
wire [3:0]r;
Logic_unit x1(r,s,a,b);
initial
begin
$monitor("Time=%0t | s=%b | a=%b b=%b -> r=%b", $time,s,a,b,r);
a=4'b1010; b=4'b1100;
#10 s=3'b000;
#10 s=3'b001;
#10 s=3'b010;
#10 s=3'b011;
#10 s=3'b100;
#10 s=3'b101;
#10 s=3'b110;
#10 a=4'b1111; b=4'b0001;
#10 s=3'b000;
#10 s=3'b001;
#10 s=3'b010;
#10 s=3'b011;
#10 s=3'b100;
#10 s=3'b101;
#10 s=3'b110;
#10 $stop;
end
endmodule