`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2023 06:51:54 PM
// Design Name: 
// Module Name: clkgen_200kHz
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


module clkgen_200kHz(input reset,
    input clk_100MHz,  //10ns
    output clk_200kHz  //1us
    );
    
    // 100 x 10^6 / 200 x 10^3 / 2 = 250 <-- 8 bit counter
    reg [7:0] counter;// = 8'h00;
    reg clk_reg = 1'b1;
    
    
    always @(posedge clk_100MHz or posedge reset) begin
        if (reset) counter<=0;
        else 
        if(counter == 249) begin
//    if(counter == 2) begin
            counter <= 8'h00;
            clk_reg <= ~clk_reg;
        end
        else
            counter <= counter + 1;
    end
    
    assign clk_200kHz = clk_reg;
    
endmodule

