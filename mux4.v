`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 06:25:41 AM
// Design Name: 
// Module Name: mux4
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


module mux4(

    input [3:0] mux_in_a,
    input [3:0] mux_in_b,
    input mux_sel,
    output reg [3:0] mux_out

    );
    
    always@(*) begin
    
        if(mux_sel == 0)
            mux_out = mux_in_a;
        else 
            mux_out = mux_in_b;
    
    end
    
endmodule
