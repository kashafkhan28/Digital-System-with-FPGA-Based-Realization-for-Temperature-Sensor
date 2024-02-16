`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2023 09:36:09 AM
// Design Name: 
// Module Name: switch_temp
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

//This module takes temperature input from switches in binary form and convert it into
//decimal form
module switch_temp(input clk,
    input sensor_en,
    input [12:0] sensor_in,
    input [12:0] switch_in, //temperature in binary
    output reg [15:0] temp_fraction,  //temperature fractional part
    output reg [8:0] temp_Integral,  //temperature integral part
    output reg signbit
    );
    reg [12:0] bin;  //intermediate variable for storing binary value
    reg [12:0] temp_bin;
    
    always @(posedge clk)
    begin
    if (sensor_en) temp_bin=sensor_in;
    else temp_bin=switch_in;
    if (temp_bin[12])
        //Taking 2's complement of the binary value
        bin = (~temp_bin)+1;    
        else 
        bin=temp_bin;
        signbit=temp_bin[12];
     case (bin[3:0])
        4'b0000  : temp_fraction = 16'd0000;
        4'b0001  : temp_fraction = 16'd0625;
        4'b0010  : temp_fraction = 16'd1250;
        4'b0011  : temp_fraction = 16'd1875;
        4'b0100  : temp_fraction = 16'd2500;
        4'b0101  : temp_fraction = 16'd3125;
        4'b0110  : temp_fraction = 16'd3750;
        4'b0111  : temp_fraction = 16'd4375;
        4'b1000  : temp_fraction = 16'd5000;
        4'b1001  : temp_fraction = 16'd5625;
        4'b1010  : temp_fraction = 16'd6250;
        4'b1011  : temp_fraction = 16'd6875;
        4'b1100  : temp_fraction = 16'd7500;
        4'b1101  : temp_fraction = 16'd8125;
        4'b1110  : temp_fraction = 16'd8750;
        default : temp_fraction = 16'd9375;
        endcase
        temp_Integral=bin[12:4];
        end
endmodule
