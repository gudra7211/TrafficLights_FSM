`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.07.2024 10:11:57
// Design Name: 
// Module Name: TrafficlightFSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TrafficlightFSM(clk,rst,Y1,Y2,G1,G2,R1,R2);
input clk,rst;
output reg Y1,Y2,G1,G2,R1,R2;
reg [3:0] count;
reg [2:0] state;
reg [25:0]a;
reg clk_div;
parameter s0=3'b000,s1=3'b001, s2=3'b010,s3 =3'b011, s4=3'b100, s5=3'b101;
always@(posedge clk or posedge rst )

begin
if (rst)
begin
a<=26'd0;
clk_div<=0;
end
else
begin
a<=a+26'd1;
clk_div<=a[25];
end
end

always@(posedge clk_div or posedge rst)
begin
if (rst == 1)
begin
Y1 = 0;
Y2 =0;
G1 = 0;
G2 = 0;
R1 = 0;
R2 = 0;
count = 0;
state = 0;
end
else
begin
case (state)
s0: if(count == 4'd10) begin
    state <= s1;
    count <= 0;
    end
    else begin
    count = count + 1;
    state = s0;
    G1 = 1;
    R2 = 1;
    G2 = 0;
    R1 = 0;
    Y1 = 0;
    Y2 = 0;
    end
s1: if(count == 4'd5) begin
    state <= s2;
    count <= 0;
    end
    else begin
    count = count + 1;
    state = s1;
    G1 = 0;
    R2 = 0;
    G2 = 0;
    R1 = 0;
    Y1 = 1;
    Y2 = 1;
    end
s2: if(count == 4'd2) begin
    state <= s3;
    count <= 0;
    end
    else begin
    count = count + 1;
    state = s2;
    G1 = 0;
    R2 = 0;
    G2 = 0;
    R1 = 1;
    Y1 = 0;
    Y2 = 1;
    end
s3: if(count == 4'd10) begin
    state <= s4;
    count <= 0;
    end
    else begin
    count = count + 1;
    state = s3;
    G1 = 0;
    R2 = 0;
    G2 = 1;
    R1 = 1;
    Y1 = 0;
    Y2 = 0;
    end
s4: if(count == 4'd5) begin
    state <= s5;
    count <= 0;
    end
    else begin
    count = count + 1;
    state = s4;
    G1 = 0;
    R2 = 0;
    G2 = 0;
    R1 = 0;
    Y1 = 1;
    Y2 = 1;
    end
s5: if(count == 4'd2) begin
    state <= s0;
    count <= 0;
    end
    else begin
    count = count + 1;
    state = s5;
    G1 = 0;
    R2 = 1;
    G2 = 0;
    R1 = 0;
    Y1 = 1; 
    Y2 = 0;
    end
endcase
end
end
endmodule 




