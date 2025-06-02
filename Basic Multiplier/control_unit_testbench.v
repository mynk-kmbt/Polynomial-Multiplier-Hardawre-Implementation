`timescale 1ns / 1ps

module control_unit_testbench();
    reg clk, reset;
    wire CSR1_load, CSR1_en, CSR2_load, CSR2_en;
    
    control_unit uut (.clk(clk), .reset(reset), .CSR1_load(CSR1_load), .CSR1_en(CSR1_en), .CSR2_load(CSR2_load), .CSR2_en(CSR2_en));

    initial begin
    clk=0;
    forever #1 clk=~clk;
    end
    
    initial
    begin
    reset=1;#2;
    reset=0;#32;
    $finish;
    end
endmodule
