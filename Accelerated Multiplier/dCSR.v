`timescale 1ns / 1ps

module dCSR(clk, reset, ddata0, ddata1, ddata2, ddata3, dcoef);
    input clk, reset;
    parameter n=4;
    input [n-1:0]  ddata0, ddata1, ddata2, ddata3;
    output [3:0] dcoef;
   
    reg [n-1:0] dCSR0, dCSR1, dCSR2, dCSR3;
    
    always@(posedge clk)
    if (reset)
        begin
        dCSR0<=ddata0;
        dCSR1<=ddata1;
        dCSR2<=ddata2;
        dCSR3<=ddata3;
        end
    else
        begin
        dCSR0<={dCSR0[0],dCSR0[n-1:1]};
        dCSR1<={dCSR1[0],dCSR1[n-1:1]};
        dCSR2<={dCSR2[0],dCSR2[n-1:1]};
        dCSR3<={dCSR3[0],dCSR3[n-1:1]};
        end
        
   assign dcoef={dCSR3[0],dCSR2[0],dCSR1[0],dCSR0[0]};
   
endmodule
