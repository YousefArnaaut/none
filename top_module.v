`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2023 07:35:16 AM
// Design Name: 
// Module Name: top_module
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


module top_module(

    input [7:0] dataa, datab,
    input start, reset_a,clk,
    output done_flag,seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g,
    output [15:0] product8x8_out
   
    );
    
    wire [1:0]sel,count,shift;
    wire [2:0]state_out;
    wire [3:0]aout,bout;
    wire [7:0] product;
    wire clk_ena,sclr_n;
    wire [15:0]shift_out,sum;
    
    mult_control f8(
        .clk(clk),
        .reset_a(reset_a),
        .start(start),
        .count(count),
        .input_sel(sel),
        .shift_sel(shift),
        .state_out(state_out),
        .done(done_flag),
        .clk_ena(clk_ena),
        .sclr_n(sclr_n)
    );
    
    mux4 f1(
        .mux_in_a(dataa[3:0]),
        .mux_in_b(dataa[7:4]),
        .mux_sel(sel[1]),
        .mux_out(aout)
    );

    mux4 f2(
        .mux_in_a(datab[3:0]),
        .mux_in_b(datab[7:4]),
        .mux_sel(sel[0]),
        .mux_out(bout)
    );

    mult4x4 f3(
        .dataa(aout),
        .datab(bout),
        .product(product)
    );

    shifter f4(
        .inp(product),
        .shift_cntrl(shift),
        .shift_out(shift_out)
    );

    adder f5(
        .dataa(shift_out),
        .datab(product8x8_out),
        .sum(sum)
    );

    reg16 f6(
        .clk(clk),
        .sclr_n(sclr_n),
        .clk_ena(clk_ena),
        .datain(sum),
        .reg_out(product8x8_out)
    );

    counter f7(
        .aclr_n(~start),
        .clk(clk),
        .count_out(count)
    );

    seven_segment_cntrl f9(
        .inp(state_out),
        .seg_a(seg_a),
        .seg_b(seg_b),
        .seg_c(seg_c),
        .seg_d(seg_d),
        .seg_e(seg_e),
        .seg_f(seg_f),
        .seg_g(seg_g)
    );
    
endmodule
