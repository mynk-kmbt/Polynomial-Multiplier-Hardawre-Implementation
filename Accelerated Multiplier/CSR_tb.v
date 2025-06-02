`timescale 1ns / 1ps

module CSR_tb(
    );
    
    reg clk, reset;
    reg [3:0] data0, data1;
    wire [1:0] coef0, coef1, coef2, coef3;
     
    
    CSR uut (.clk(clk), .reset(reset), .data0(data0), .data1(data1), .coef0(coef0), .coef1(coef1), .coef2(coef2), .coef3(coef3));

    initial begin
    clk=0;
    forever #1 clk=~clk;
    end
    
    initial begin
    data1={1'b1,1'b1,1'b0,1'b0};data0={1'b1,1'b0,1'b1,1'b0};
    reset=1 ; #2 ;
     reset=0; #100;
    $finish;
    end

endmodule
