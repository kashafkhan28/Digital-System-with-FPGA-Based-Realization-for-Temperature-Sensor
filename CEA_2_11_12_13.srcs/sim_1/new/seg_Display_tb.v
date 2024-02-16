`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2023 09:04:00 AM
// Design Name: 
// Module Name: seg_Display_tb
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


module seg_Display_tb;
reg clk_100MHz;
reg [15:0] temp_data;
wire [6:0] SEG;
wire [7:0] AN;
wire dp;
reg reset;

seg_Display uut(
.clk_100MHz(clk_100MHz),
.temp_data(temp_data),
.SEG(SEG),
.AN(AN),
.dp(dp),
.reset(reset));
initial
$monitor("%d Counter=%d seg=%d ", $time, uut.Counter, uut.seg);

initial begin
        clk_100MHz=0;
        forever #10 clk_100MHz = ~clk_100MHz;
end
initial begin
        reset = 1;
        #200;
        reset=0;
        temp_data=16'b0000000001111111;
        //temp_data=0.625;
        #100;
        temp_data=16'b0000000000011001;
        //temp_data=13;
        #100;
        temp_data=16'b0000000000001001;
        //temp_data=25;
        #100;
        temp_data=16'b0000000000100000;
        //temp_data=32;
        #100;
        temp_data=16'b0000000000101000;
        //temp_data=-15;
        #100;
        temp_data=16'b0000000000101001;
        //temp_data=-6;
        #100;
        temp_data=16'b0000000000101001;
        //temp_data=43;
        #100;
        temp_data=16'b1110110000000001;
        #100;
        temp_data=16'b1111001110000001;
        #100;
        temp_data=16'b1111111111111001;
        #100;
        temp_data=16'b0000000000001001;
        #100;
        temp_data=16'b0000110010000001;
        #100;
        #100;
        #100;
        #100;
        $finish;
        end
        
endmodule