`timescale 1ns / 1ps
module booth_multiplier(
    input wire clk,
    input wire rst,
    input wire signed [3:0]m,
    input wire signed [3:0]qin,
    output reg signed [7:0]r,
    output reg d
);
reg signed[3:0]a;
reg signed[3:0]q;
reg q1;
reg [2:0]c;
reg signed [3:0]an;
always@(*)
begin
case({q[0],q1})
    2'b01:an=a+m;
    2'b10:an=a-m;
    default: an=a;
endcase
end
always@(posedge clk or posedge rst)
begin
    if(rst)
        begin
            a<=4'b0000;
            q<=qin;
            q1<=1'b0;
            c<=3'd4;
            r<=8'b0;
            d<=1'b0;
        end
    else if(c>0)
        begin
            {a,q,q1}<={an[3],an,q};
            c<=c-1'b1;
            d<=1'b0;
        end
    else 
        begin
            r<={a,q};
            d<=1'b1;
        end
end
endmodule