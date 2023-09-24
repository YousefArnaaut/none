`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 06:34:28 AM
// Design Name: 
// Module Name: mult4x4
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


module mult4x4(

    input [3:0]dataa,
    input [3:0]datab,
    output [7:0]product

    );
    
    assign product = dataa * datab;
    
endmodule
