`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2023 03:59:02 PM
// Design Name: 
// Module Name: tb_pwm_light_control
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


module tb_pwm_light_control;
    reg clk;
    reg [7:0] duty;
    wire pwm_out;
    
    pwm_light_control.uut(clk,duty,pwm_out);
    initial begin
    clk=0;
    forever #10 clk=~clk;
    end
    initial begin
    #15;
    duty=60;
    #10;
    duty=120;
    #10;
    duty=180;
    #10;
    duty=200;
    end
endmodule
