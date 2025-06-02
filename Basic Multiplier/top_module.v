`timescale 1ns / 1ps

module top_module(clk, reset, data0, data1, ddata0, ddata1, ddata2, ddata3, coeff, dcoeff,ac,out);
    
    input clk, reset;
    parameter n=4;
    input [n-1:0] data0, data1, ddata0, ddata1, ddata2, ddata3;
    output [1:0] coeff;
    output [3:0] dcoeff; 
    output reg [3:0] ac;
    output reg [3:0]out;
    
    wire CSR1_load, CSR1_en, CSR2_load, CSR2_en;
    
    control_unit inst1 (clk,reset, CSR1_load, CSR1_en, CSR2_load, CSR2_en);
    CSR1AND2 inst2 (clk, CSR1_load, CSR1_en, CSR2_load, CSR2_en, data0, data1, coeff);
    dcoef inst3 (clk, reset, CSR2_load, ddata0, ddata1, ddata2, ddata3, dcoeff);
    
    always@(posedge clk)
        if (CSR2_load | reset) begin
                                ac<=0;
                                out<=ac + (coeff*dcoeff);
                                end
        else ac <= ac + (coeff*dcoeff);
   
   
endmodule
