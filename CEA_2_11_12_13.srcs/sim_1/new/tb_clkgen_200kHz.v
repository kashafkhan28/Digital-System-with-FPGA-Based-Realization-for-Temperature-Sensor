`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2023 07:07:56 PM
// Design Name: 
// Module Name: tb_clkgen_200kHz
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


module tb_clkgen_200kHz;
    reg clk;
    wire clk200kHz;
    clkgen_200kHz uut(clk,clk200kHz);
    initial begin
    clk=0;
    forever #10 clk=~clk;
    end
endmodule
