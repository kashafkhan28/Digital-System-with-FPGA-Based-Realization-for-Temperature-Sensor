`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2023 04:08:12 PM
// Design Name: 
// Module Name: tb_rgb
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


module tb_rgb;
    reg clk;
    reg [8:0] temp;
    reg sign;
    wire R;
    wire G;
    wire B;
    
    rgb uut(clk,temp,sign,R,G,B);
    
    initial begin
    clk=0;
    forever #5 clk=~clk;
    end
    
    initial begin
    #100;
    sign=0;
    temp=30;  //yellow25
    #100;
    sign=1;
    temp=14;  //blue50
    #100;
    sign=0;
    temp=60;   //red75
    #100;
    sign=1;
    temp=35;    //blue75
    #100;
    $finish;
    
    end
    
    
endmodule
