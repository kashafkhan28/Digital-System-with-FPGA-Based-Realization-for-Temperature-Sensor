`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2023 08:49:00 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb;
    reg clk;
    reg reset;
    wire TMP_SDA;
    wire TMP_SCL;
    wire [6:0]  SEG;              // 7 segments of each display
    wire [7:0]  AN;              // 4 anodes of 4 displays
    wire dp;              // 4 anodes always OFF
    wire [15:0]  LED;
    reg wr;
    reg [12:0] switch_in;
    reg sensor_en;
    
    //rgb declarations
//    input [8:0] rgb_temp,
//    input sign,
    wire R;
    wire G;
    wire B;
    top dut(clk, reset, TMP_SDA , TMP_SCL,SEG, AN, dp, LED, switch_in,sensor_en, R,G,B);
    assign TMP_SDA = (wr) ? switch_in:1'bz;
    initial begin
    clk = 1;
    forever #10 clk=~clk;
    end
    initial begin
    reset=1;
    #20;
    reset=0;
    #20;
    sensor_en=0;
    wr=0;
     switch_in=16'b0000000001111111;
        #100;
        sensor_en=0;
        wr=1;
        switch_in=16'b0000000000011001;
        #100;
        sensor_en=0;
        wr=0;
        switch_in=16'b0000000000001001;
        #100;
        sensor_en=0;
        wr=1;
        switch_in=16'b0000000000100000;
        #100;
        sensor_en=1;
        wr=1;
        switch_in=16'b0000000000101000;
        #100;
        sensor_en=0;
        wr=0;
        switch_in=16'b0000000000101001;
        #100;
        $finish;
        end
endmodule
