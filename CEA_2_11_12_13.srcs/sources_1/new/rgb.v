`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2023 10:18:50 PM
// Design Name: 
// Module Name: rgb
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


module rgb(
    input clk,
    input [8:0] temp,
    input sign,
    output reg R,
    output reg G,
    output reg B);
    wire intensity25;
    wire intensity50;
    wire intensity75;
    pwm_light_control duty25(.clk(clk),.duty(2),.pwm_out(intensity25));
    pwm_light_control duty50(.clk(clk),.duty(4),.pwm_out(intensity50));
    pwm_light_control duty75(.clk(clk),.duty(7),.pwm_out(intensity75));
    always @(*) begin
    if (sign==1 & temp<=40 & temp>=20)
    begin R<=0;G<=0;B<=intensity75; end
//    if 
//    else if (sign==1 & temp<30 & temp>=20)
//    begin R<=0;G<=0;B<=1; end
    else if (sign==1 & temp<20 & temp>=10)
    begin R<=0;G<=0;B<=intensity50; end
    else if (sign==1 & temp<10 & temp>=0)
    begin R<=0;G<=0;B<=intensity25; end
    else if (sign==0 & temp>0 & temp<=10)
    begin R<=intensity75;G<=intensity75;B<=intensity75; end
    else if (sign==0 & temp>10 & temp<=20)
    begin R<=intensity50;G<=intensity50;B<=intensity50; end
    else if (sign==0 & temp>20 & temp<=30)
    begin R<=intensity25;G<=intensity25;B<=intensity25; end
    else if (sign==0 & temp>30 & temp<=40)
    begin R<=intensity25;G<=0;B<=0; end
    else if (sign==0 & temp>40 & temp<=50)
    begin R<=intensity50;G<=0;B<=0; end
    else if (sign==0 & temp>50 & temp<=70)
    begin R<=intensity75;G<=0;B<=0;end
    else begin R<=0; G<=1;B<=0; end
    end
endmodule
