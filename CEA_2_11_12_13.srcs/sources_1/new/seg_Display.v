`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2023 06:54:28 PM
// Design Name: 
// Module Name: seg_Display
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


module seg_Display(input clk_100MHz,               // Nexys A7 clock
    input sensor_en,
    input [12:0] switch_in,
    input [15:0] sensor_temp,          // Temp data from i2c master
    input reset,
    output reg [6:0] SEG,           // 7 Segments of Displays
    output reg [7:0] AN,            // Anodes of 7 segments
    output reg dp
    );
    reg [15:0] temp_data;
    reg [3:0] first;  // first seven segment
    reg [3:0] second; //second seven segment
    reg [3:0] third; //third seven segment
    reg [3:0] fourth; // fourth seven segment
    reg [3:0] fifth; //fifth seven segment
    reg [3:0] sixth; //sixth seven segment
    reg [3:0] seventh;  //seventh seven segment
    
    reg [3:0] seg;
    reg [15:0] temp;
    reg [3:0] stuffing_bits=0'b000;
    
    reg [17:0] Counter;
    initial    seg=0;
    always @(posedge clk_100MHz)
    begin
    if (reset)
    begin
    Counter <=0;
    end
    else
    begin
        Counter<=Counter+1;
    end
    end
    
    always @(sensor_en)begin
    if (sensor_en) temp_data<=sensor_temp;
    else temp_data<={switch_in[12:0],stuffing_bits[3:0]};
    end
   always @ (*)
begin
    case(seg)
    0 : SEG = 7'b1000000; //0
    1 : SEG = 7'b1111001; //1
    2 : SEG = 7'b0100100; //2
    3 : SEG = 7'b0110000; //3
    4 : SEG = 7'b0011001; //4
    5 : SEG = 7'b0010010; //5
    6 : SEG = 7'b0000010; //6
    7 : SEG = 7'b1111000; //7
    8 : SEG = 7'b0000000; //8
    9 : SEG = 7'b0011000; //9
    10 : SEG = 7'b10111111; //-ve sign
    11 : SEG = 7'b11111111; //Display off
//    10: SEG = 7'b0001000; //A
//    11: SEG = 7'b0000011; //B
//    12: SEG = 7'b1000110; //C
//    13: SEG = 7'b0100001; //D
//    14: SEG = 7'b0000110; //E
//    15: SEG = 7'b0001110; //F
    
    endcase
    //conerting from 9 digit binary to decimal value 
    // Starting at 8 degrees.

//Working on the decimal point values.
    if (temp_data[15])
    begin temp <= (~temp_data)+1;
    seventh = 4'b1010; end
    else begin
    temp <= temp_data;
    seventh = 4'b1011;
    end
    sixth = temp[15:7] / 10;           // Tens value of temp data
    fifth = temp[15:7] % 10; 

case (temp[6:3])


4'b0000: begin first  <= 4'b0000;
               second <= 4'b0000;
               third  <= 4'b0000;
               fourth <= 4'b0000;end
4'b0001: begin first  <= 4'b0101;
               second <= 4'b0010;
               third  <= 4'b0110;
               fourth <= 4'b0000;end
4'b0010: begin first  <= 4'b0000;
               second <= 4'b0101;
               third  <= 4'b0010;
               fourth <= 4'b0001;end
4'b0011: begin first  <= 4'b0101;
               second <= 4'b0111;
               third  <= 4'b1000;
               fourth <= 4'b0001;end
4'b0100: begin first  <= 4'b0000;
               second <= 4'b0000;
               third  <= 4'b0101;
               fourth <= 4'b0010;end
4'b0101: begin first  <= 4'b0101;
               second <= 4'b0010;
               third  <= 4'b0001;
               fourth <= 4'b0011;end
4'b0110: begin first  <= 4'b0000;
               second <= 4'b0101;
               third  <= 4'b0111;
               fourth <= 4'b0011;end
4'b0111: begin first  <= 4'b0101;
               second <= 4'b0111;
               third  <= 4'b0011;
               fourth <= 4'b0100;end
4'b1000: begin first  <= 4'b0000;
               second <= 4'b0000;
               third  <= 4'b0000;
               fourth <= 4'b0101;end               
4'b1001: begin first  <= 4'b0101;
               second <= 4'b0010;
               third  <= 4'b0110;
               fourth <= 4'b0101;end
4'b1010: begin first  <= 4'b0000;
               second <= 4'b0101;
               third  <= 4'b0010;
               fourth <= 4'b0110;end
4'b1011: begin first  <= 4'b0101;
               second <= 4'b0111;
               third  <= 4'b1000;
               fourth <= 4'b0110;end
4'b1100: begin first  <= 4'b0000;
               second <= 4'b0000;
               third  <= 4'b0101;
               fourth <= 4'b0111;end
4'b1101: begin first  <= 4'b0101;
               second <= 4'b0010;
               third  <= 4'b0001;
               fourth <= 4'b1000;end
4'b1110: begin first  <= 4'b0000;
               second <= 4'b0101;
               third  <= 4'b0111;
               fourth <= 4'b1000;end
4'b1111: begin first  <= 4'b0101;
               second <= 4'b0111;
               third  <= 4'b0011;
               fourth <= 4'b1001;end
default: begin first  <= 4'b0000;
               second <= 4'b0000;
               third  <= 4'b0000;
               fourth <= 4'b0000;end
   endcase


end 
    
    always @ (*)
begin
 
    case (Counter[17:15])
    
    3'b000: begin
                seg <= first;
                AN <= 8'b11111110;
                dp <= 1'b1;
            end
    3'b001: begin
                seg <= second;
                AN <= 8'b11111101;
                dp <= 1'b1;
            end
    3'b010: begin
                seg <= third;
                AN <= 8'b11111011;
                dp <= 1'b1;
            end
    3'b011: begin
                seg <= fourth;
                AN <= 8'b11110111;
                dp <= 1'b1;
            end
    3'b100: begin
                seg <= fifth;
                AN <= 8'b11101111;
                dp <= 1'b0;
           end
    3'b101: begin
                seg <= sixth;
                AN <= 8'b11011111;
                dp <= 1'b1;
           end
    3'b110: begin
                seg <= seventh;
                AN <= 8'b10111111;
                dp <= 1'b1;
            end
    default: begin AN <=8'b11111111; dp <= 1'b1;end
   
    endcase
end

endmodule
