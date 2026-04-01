`timescale 1ns / 1ps
module restoring_divider(
    input clk,
    input rst,
    input start,
    input [3:0]dividend,
    input [3:0]divisor,
    output reg [3:0]quotient,
    output reg [3:0]remainder,
    output reg done
);
reg [4:0]A;
reg [3:0]Q;
reg [3:0]M;
reg [2:0]count;
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        A<=0;
        Q<=0;
        M<=0;
        count<=0;
        done<=0;
    end 
    else if(start)
    begin
        A<=0;
        Q<=dividend;
        M<=divisor;
        count<=4;
        done<=0;
    end
    else if(count>0)
    begin
        {A,Q}<={A,Q}<<1;
        A<=A-M;
        if(A[4]==1)
        begin
            A<=A+M;
            Q[0]<=0;
        end
        else
        begin
            Q[0]<=1;
        end
        count<=count-1;
        if(count==1)
        begin
            quotient<=Q;
            remainder<=A[3:0];
            done<=1;
        end
    end
end
endmodule
