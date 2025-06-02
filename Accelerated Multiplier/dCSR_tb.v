`timescale 1ns / 1ps

module dCSR_tb(
    );
    
    reg clk, reset;
    reg [3:0] ddata0, ddata1, ddata2, ddata3;
    wire [3:0] dcoef;
     
    
    dCSR uut (.clk(clk), .reset(reset), .ddata0(ddata0), .ddata1(ddata1), .ddata2(ddata2), .ddata3(ddata3), .dcoef(dcoef) );

    initial begin
    clk=0;
    forever #1 clk=~clk;
    end
    
    initial begin
    ddata3={1'b0,1'b0,1'b0,1'b0};ddata2={1'b0,1'b0,1'b0,1'b1};ddata1={1'b0,1'b1,1'b1,1'b0};ddata0={1'b1,1'b0,1'b1,1'b0}; 
    reset=1 ; #2 ;
     reset=0; #100;
    $finish;
    end

endmodule
