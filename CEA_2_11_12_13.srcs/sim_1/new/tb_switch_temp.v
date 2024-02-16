`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2023 12:09:52 PM
// Design Name: 
// Module Name: tb_switch_temp
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


module tb_switch_temp;
    reg [12:0] temp_bin;
    wire [15:0] temp_fraction;
    wire [8:0] temp_integral;
    wire signbit;
    switch_temp uut(temp_bin,temp_fraction,temp_integral,signbit);

 
    initial begin
        $monitor("%d Temp %d",$time, signbit,temp_integral,".%d",temp_fraction);
        #100;
        temp_bin=13'b0100011110001;
        //temp=143.0625
        #100;
        temp_bin = 13'b0001110010011;
        //temp=57.1875
        #100;
        temp_bin = 13'b1111010001110;
        //temp=0000101110010
        //temp=-23.1250
        #100;
        temp_bin = 13'b1111111110000;
        //temp=0000000010000
        //temp=1.0000
        #100;
        temp_bin = 13'b0000000001111;
        //temp=0.9375
        end
endmodule
