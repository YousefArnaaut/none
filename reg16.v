`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 07:27:59 AM
// Design Name: 
// Module Name: reg16
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


module reg16(

    input clk,sclr_n,clk_ena,
    input [15:0] datain,
    output reg [15:0]reg_out

    );
    
    always@(posedge clk) begin
    
        if(clk_ena == 1 && sclr_n == 0)
            reg_out = 0;
        else if(clk_ena == 1 && sclr_n ==1)
            reg_out = datain;
        else
            reg_out = reg_out;
    
    end
    
endmodule
