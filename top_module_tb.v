`timescale 1ns / 1ps
module top_module_tb();
    reg clk;
    reg rst;
    reg start;
    reg [3:0]a;
    reg [3:0]b;
    reg cin;
    reg [2:0]op;
    reg [2:0]sel_logic;
    reg [1:0]sel_shift;
    wire [7:0]result;
    wire Z,C,S,V;
    wire done;
    top_module x1(clk,rst,start,a,b,cin,op,sel_logic,sel_shift,result,Z,C,S,V,done);
    always #5 clk=~clk;
    initial begin
        clk=0;rst=1;start=0;
        #10 rst=0;
        $monitor("t=%0t op=%b a=%b b=%b res=%b Z=%b C=%b S=%b V=%b done=%b",$time,op,a,b,result,Z,C,S,V,done);
        #10 op=3'b000;a=4'b1010;b=4'b0101;cin=0;
        #10 op=3'b001;sel_logic=3'b000;
        #10 op=3'b001;sel_logic=3'b001;
        #10 op=3'b001;sel_logic=3'b010;
        #10 op=3'b001;sel_logic=3'b011;
        #10 op=3'b010;sel_shift=2'b00;
        #10 op=3'b010;sel_shift=2'b01;
        #10 op=3'b011;a=4'b1010;b=4'b0011;
        #10 op=3'b100;a=10;b=3;start=1;
        #10 start=0;
        wait(done);
        #10 op=3'b100;a=15;b=4;start=1;
        #10 start=0;
        wait(done);
        #10 $stop;
    end
endmodule
