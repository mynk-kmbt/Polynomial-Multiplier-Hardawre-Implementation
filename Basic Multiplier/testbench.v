`timescale 1ns / 1ps


module testbench();
    reg clk, CSR1_load, CSR1_en, CSR2_load, CSR2_en;
    reg [3:0] data0, data1;
    wire [1:0] coeff;
   
    
    initial 
    begin 
    clk=0;
    forever #1 clk=~clk;
    end
    
    CSR1AND2 uut (.clk(clk), .CSR1_load(CSR1_load), .CSR1_en(CSR1_en), .CSR2_load(CSR2_load), .CSR2_en(CSR2_en), .data0(data0), .data1(data1), .coeff(coeff));
    
    initial 
    begin
    data1={1'b0,1'b0,1'b1,1'b0};data0={1'b1,1'b0,1'b1,1'b0};CSR1_load=1;
    #2;CSR1_load=0;
    CSR2_load=1;CSR1_en=1;#2;
    CSR2_load=0;CSR1_en=0;CSR2_en=1;#6;
    CSR2_load=1;CSR1_en=1;#2;
    CSR2_load=0;CSR1_en=0;CSR2_en=1;#6;
    CSR2_load=1;CSR1_en=1;#2;
    CSR2_load=0;CSR1_en=0;CSR2_en=1;#6;
    CSR2_load=1;CSR1_en=1;#2;
    CSR2_load=0;CSR1_en=0;CSR2_en=1;#6;
    #1;
    $finish;
    end
endmodule