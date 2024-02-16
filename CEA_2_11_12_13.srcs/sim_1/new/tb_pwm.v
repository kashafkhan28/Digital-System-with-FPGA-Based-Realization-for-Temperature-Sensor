`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2023 04:13:12 PM
// Design Name: 
// Module Name: tb_pwm
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


module tb_pwm;
    reg clk;
    reg [3:0] duty;
    wire pwm_out;
    pwm_light_control uut(clk,duty,pwm_out);
    initial begin
    $monitor("%d counter %d", $time, uut.counter);
    clk=0;
    forever #5 clk=~clk;
    end
    initial begin
    #100;
    duty =0;
    #100;
    duty=2;
    #100;
    duty=4;
    #100;
    duty=7;
    #100;
    duty=8;
    #100;
    $finish;
    end
endmodule
