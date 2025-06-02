`timescale 1ns / 1ps

module top_module_tb();
    reg clk, reset;
    reg [3:0] data0, data1, ddata0, ddata1, ddata2, ddata3;
    wire [1:0] coeff;
    wire [3:0]dcoeff;
    wire [3:0] ac;
    wire [3:0] out;
    
    top_module uut (.clk(clk), .reset(reset), .data0(data0), .data1(data1), .coeff(coeff), .ddata0(ddata0), .ddata1(ddata1), .ddata2(ddata2), .ddata3(ddata3), .dcoeff(dcoeff), .ac(ac) , .out(out) );
    
    initial begin
    clk=0;
    forever #1 clk=~clk;
    end
    
    initial begin
    data1={1'b0,1'b0,1'b0,1'b0};data0={1'b1,1'b0,1'b1,1'b0};
    ddata3={1'b0,1'b0,1'b0,1'b0};ddata2={1'b1,1'b0,1'b0,1'b0};ddata1={1'b0,1'b1,1'b1,1'b0};ddata0={1'b0,1'b1,1'b0,1'b1}; 
    reset=1 ; #2 ;
     reset=0; #100;
    $finish;
    end
    
endmodule
