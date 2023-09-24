`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2023 07:44:35 AM
// Design Name: 
// Module Name: seven_segment_cntrl
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


module seven_segment_cntrl(

    input [2:0]inp,
    output reg seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g

    );
    
    always@(*) begin
    
        if(inp == 3'b000)
            {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g} = 7'b1111110;
        else if(inp == 3'b001)
            {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g} = 7'b0110000;
        else if(inp == 3'b010)
            {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g} = 7'b1101101;
        else if(inp == 3'b011)
            {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g} = 7'b1111001;
        else
            {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g} = 7'b1001111;
    
    end
    
endmodule
