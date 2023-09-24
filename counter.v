`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 07:16:15 AM
// Design Name: 
// Module Name: counter
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


module counter(

    input clk ,aclr_n,
    output [1:0]count_out 

    );
    
    reg [1:0] Q_next ,Q_reg;
    
    always@(posedge clk ,negedge aclr_n) begin
    
        if(!aclr_n)
            Q_reg <= 0;
        else
            Q_reg <= Q_next;
    
    end 
    
    
    always@(*)
        Q_next = Q_reg + 1;
        
    assign count_out = Q_reg;

endmodule
