`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2023 06:57:01 PM
// Design Name: 
// Module Name: top
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


module top(
    input         CLK100MHZ,        // nexys clk signal
    //temp sensor declarations
    input         reset,            // btnC on nexys
    inout         TMP_SDA,          // i2c sda on temp sensor - bidirectional
    output        TMP_SCL,          // i2c scl on temp sensor
    output [6:0]  SEG,              // 7 segments of each display
    output [7:0]  AN,               // 4 anodes of 4 displays
    output dp,              // 4 anodes always OFF
    output [15:0]  LED,               // nexys leds = binary temp in deg C
    
    //switch declarations
    input [12:0] switch_in,
    input sensor_en,
//    output [15:0] temp_fraction,
//    output [8:0] temp_Integral,
//    output signbit,
    
    //rgb declarations
//    input [8:0] rgb_temp,
//    input sign,
    output R,
    output G,
    output B
    );
    
    wire sda_dir;                   // direction of SDA signal - to or from master
    wire w_200kHz;                  // 200kHz SCL
    wire [15:0] w_data;              // 8 bits of temperature data
    wire [15:0] temp_fraction;
    wire [8:0] temp_Integral;
    wire signbit;
    
    wire [12:0] switch_input;
    
    // Instantiate i2c master
    i2c_master master(
        .clk_200kHz(w_200kHz),
        .reset(reset),
        .temp_data(w_data),
        .SDA(TMP_SDA),
        .SDA_dir(sda_dir),
        .SCL(TMP_SCL)
    );
    
    
    // Instantiate 200kHz clock generator
    clkgen_200kHz cgen(.reset(reset),
        .clk_100MHz(CLK100MHZ),
        .clk_200kHz(w_200kHz)
    );
    
    
    
    // Instantiate 7 segment control
    seg_Display seg_instance(.clk_100MHz(CLK100MHZ), 
        .sensor_en(sensor_en), 
        .switch_in(switch_in), 
        .sensor_temp(w_data),
        .SEG(SEG),
        .AN(AN),
        .dp(dp));
    // Set LED value to temp data
    assign LED = w_data;
//    assign LED = {in[12:0],w_data[2:0]};    
    
    

    //Instantiate switch control
    switch_temp sw_instance(.clk(CLK100MHZ),.sensor_en(sensor_en), .sensor_in(w_data[15:3]), .switch_in(switch_in),
        .temp_fraction(temp_fraction),
        .temp_Integral(temp_Integral),
        .signbit(signbit));
   
    
    //Instantiate RGB Control
    rgb rgb_instance(.clk(CLK100MHZ),
        .temp(temp_Integral),
        .sign(signbit),
        .R(R), .G(G), .B(B));

endmodule
