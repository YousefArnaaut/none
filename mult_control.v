`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 01:52:43 PM
// Design Name: 
// Module Name: mult_control
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


module mult_control(

    input clk,reset_a,start,
    input [1:0] count,
    output reg [1:0]input_sel,shift_sel,
    output [2:0]state_out,
    output reg done,clk_ena,sclr_n

    );
    
    localparam IDLE = 3'b000;
    localparam LSB = 3'b001;
    localparam MID = 3'b010;
    localparam MSB = 3'b011;
    localparam CALC_DONE = 3'b100;
    localparam ERR = 3'b101;
    
    reg [2:0] next_state , reg_state;
    
    always@(posedge clk , negedge reset_a )
        begin
        if(~ reset_a)
            reg_state<=IDLE;
        else
            next_state<=next_state;
        end
        
    always@(*) begin
    
        case(reg_state)
            IDLE: if(start == 0)begin
                    input_sel = 2'bxx;
                    shift_sel = 2'bxx;
                    done = 0;
                    clk_ena = 1;
                    sclr_n = 0;
                    next_state =IDLE;
                  end
                  else begin
                    input_sel = 2'bxx;
                    shift_sel = 2'bxx;
                    done = 0;
                    clk_ena = 0;
                    sclr_n = 1;
                    next_state = LSB;
                  end
                  
            LSB:  if(start == 0 && count == 0)begin
                     input_sel = 2'b00;
                     shift_sel = 2'b00;
                     done = 0;
                     clk_ena = 1;
                     sclr_n = 1;
                     next_state = MID;
                  end
                  else begin
                     input_sel = 2'bxx;
                     shift_sel = 2'bxx;
                     done = 0;
                     clk_ena = 0;
                     sclr_n = 1;
                     next_state = ERR;
                  end
                         
            MID:  if(start == 0 && count == 1)begin
                     input_sel = 2'b01;
                     shift_sel = 2'b01;
                     done = 0;
                     clk_ena = 1;
                     sclr_n = 1;
                     next_state = MID;
                  end
                  else if(start == 0 && count == 2) begin
                     input_sel = 2'b10;
                     shift_sel = 2'b01;
                     done = 0;
                     clk_ena = 1;
                     sclr_n = 1;
                     next_state = MSB;
                  end
                  else begin
                     input_sel = 2'bxx;
                     shift_sel = 2'bxx;
                     done = 0;
                     clk_ena = 0;
                     sclr_n = 1;
                     next_state = ERR;
                  end
                       
            MSB:  if(start == 0 && count == 3)begin
                     input_sel = 2'b11;
                     shift_sel = 2'b10;
                     done = 0;
                     clk_ena = 1;
                     sclr_n = 1;
                     next_state = CALC_DONE;
                  end
                  else begin
                     input_sel = 2'bxx;
                     shift_sel = 2'bxx;
                     done = 0;
                     clk_ena = 0;
                     sclr_n = 1;
                     next_state = ERR;
                  end
                    
            CALC_DONE: if(start == 0)begin
                          input_sel = 2'bxx;
                          shift_sel = 2'bxx;
                          done = 1;
                          clk_ena = 0;
                          sclr_n = 1;
                          next_state = IDLE;
                       end
                       else begin
                          input_sel = 2'bxx;
                          shift_sel = 2'bxx;
                          done = 0;
                          clk_ena = 0;
                          sclr_n = 1;
                          next_state = ERR;
                       end
                  
            ERR:  if(start == 0)begin
                     input_sel = 2'bxx;
                     shift_sel = 2'bxx;
                     done = 0;
                     clk_ena = 0;
                     sclr_n = 1;
                     next_state =ERR;
                  end
                  else begin
                     input_sel = 2'bxx;
                     shift_sel = 2'bxx;
                     done = 0;
                     clk_ena = 1;
                     sclr_n = 0;
                     next_state = LSB;
                  end
                  
            default:next_state=reg_state;
                                
        endcase        
    
    end
    
    assign state_out = reg_state;
    
endmodule
