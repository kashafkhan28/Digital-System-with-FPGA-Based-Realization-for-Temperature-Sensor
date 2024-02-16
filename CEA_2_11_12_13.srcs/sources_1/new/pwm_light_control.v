`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2023 10:29:12 PM
// Design Name: 
// Module Name: pwm_light_control
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


module pwm_light_control(
    input clk,
    input [3:0] duty,
    output reg pwm_out
    );
//    input [8:0] temp,
//    input sign,
//    output reg R,
//    output reg G,
//    output reg B);
    reg reset;
    initial reset = 1;
    reg [3:0] counter;//=0; // internal accumulator
    always @(posedge clk)
    if (reset) begin counter<=0; reset<=0;end
    else 
    begin
    counter <= counter+1;
    if (counter>=9) counter<=0;
    end
    always @(*) pwm_out = (counter<duty)?1:0;
endmodule
