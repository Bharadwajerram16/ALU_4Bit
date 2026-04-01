`timescale 1ns / 1ps
module top_module(
    input clk,
    input rst,
    input start,
    input [3:0]a,
    input [3:0]b,
    input cin,
    input [2:0]op,
    input [2:0]sel_logic,
    input [1:0]sel_shift,
    output reg [7:0]result,
    output Z,C,S,V,
    output done
);
    wire [3:0]logic_out;
    wire [3:0]shift_out;
    wire [3:0]sum;
    wire c3,c4;
    wire [7:0]mul_out;
    wire [3:0]div_q,div_r;
    wire div_done;
    CLA cla1(c4,c3,sum,cin,a,b);
    Logic_unit lu1(logic_out,sel_logic,a,b);
    shifter sh1(a,sel_shift,shift_out);
    booth_multiplier mul1(a,b,mul_out);
    restoring_divider div1(clk,rst,start,a,b,div_q,div_r,div_done);
    always@(*)
    begin
        case(op)
            3'b000:result={4'b0000,sum};
            3'b001:result={4'b0000,logic_out};
            3'b010:result={4'b0000,shift_out};
            3'b011:result=mul_out;
            3'b100:result={div_q,div_r};
            default:result=8'b00000000;
        endcase
    end
    assign done=(op==3'b100)?div_done:1'b1;
    flag_generator fg1(result[3:0],c4,c3,Z,C,S,V);
endmodule